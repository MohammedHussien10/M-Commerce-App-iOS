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
    @Binding var isTabBarHidden: Bool

    var body: some View {
        NavigationView {
            VStack {
                if cartViewModel.cartProducts.isEmpty {
                    emptyCartView()
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
                    }
                    .listStyle(PlainListStyle())

                    NavigationLink(
                        destination: CheckoutScreen(
                            viewModel: CheckoutViewModel(
                                cartProducts: cartViewModel.cartProducts,
                                cartId: cartViewModel.cartId ?? ""
                            )
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
            .navigationTitle("Shopping Cart")
        }
    }
    
}
