//
//  ShoppingCartScreen.swift
//  Shopify-IOS
//
//  Created by Macos on 18/06/2025.
//

import Foundation
import SwiftUI
struct ShoppingCartScreen: View {
    @EnvironmentObject var cartViewModel: CartViewModel
    @StateObject private var addressViewModel = AddressViewModel(
        useCase: AddressUseCase(
            repository: RepositoryImp(
                remoteDataSource: RemoteDataSource()
            )
        )
    )
    
    @Binding var isTabBarHidden: Bool
    var body: some View {
        NavigationView {
            VStack {
                if (cartViewModel.cartProducts.isEmpty) {
                    emptyCartView()
                    Spacer()
                } else {
                    List(cartViewModel.cartProducts) { product in
                        if let cartId = cartViewModel.cartId {
                            CartProductRow(
                                product: product,
                                cartId: cartId,
                                onUpdateQuantity: { lineId, newQuantity in
                                    cartViewModel.updateProductQuantity(cartId: cartId, lineId: lineId, newQuantity: newQuantity)
                                },
                                onRemove: { lineId in
                                    cartViewModel.removeProduct(lineId: lineId)
                                }
                            )
                        }
                    }.listStyle(PlainListStyle())
                    
                    HStack {
                                  Text("Total:")
                                      .font(.title2)
                                      .bold()
                                  Spacer()
                                  Text(
                                      String(format: "$%.2f", cartViewModel.cartProducts.reduce(0) { $0 + ($1.price * Double($1.quantity)) })
                                  )
                                  .font(.title2)
                                  .foregroundColor(.green)
                              }
                              .padding()
                }
                
                NavigationLink(
                    destination: CheckoutScreen(
                        viewModel: CheckoutViewModel(
                            cartProducts: cartViewModel.cartProducts,
                            cartId: cartViewModel.cartId ?? ""
                            
                        ), addressViewModel: addressViewModel
                    )
                ) {
                    Text("Check Out")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(
                            cartViewModel.shouldProceedCheckingOut ? Constants.AppColor.primaryColor : Color.gray.opacity(0.5)
                        )
                        .foregroundColor(.white)
                        .cornerRadius(12)
                        .padding(.horizontal)
                }
                .disabled(!cartViewModel.shouldProceedCheckingOut)
                .padding(.bottom, 16)
            }
        }
        .onAppear {
            cartViewModel.loadCartProducts()
            isTabBarHidden = true
        }
    }
}


