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
    @State private var showAlart = false
    @State private var alertMessage = ""
    @State private var navigateToCheckout = false
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
                                exchangeRate: cartViewModel.exchangeRate,
                                currency: UserDefaults.standard.string(forKey: "selectedCurrency") ?? "USD",
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

                        let total = cartViewModel.cartProducts.reduce(0) { $0 + ($1.price * Double($1.quantity)) }
                        let convertedTotal = total * cartViewModel.exchangeRate
                        let currency = UserDefaults.standard.string(forKey: "selectedCurrency") ?? "USD"

                        Text(convertedTotal.priceFormatter(with: currency))
                            .font(.title2)
                            .foregroundColor(.green)
                    }
                    .padding()

                }
                
                Button(action:{
                    if cartViewModel.shouldProceedCheckingOut && !addressViewModel.addresses.isEmpty{
                        navigateToCheckout = true
                    }else{
                        if !cartViewModel.shouldProceedCheckingOut{
                            alertMessage = "Your cart is empty !"
                        }else if addressViewModel.addresses.isEmpty{
                            alertMessage = "please add a shipping address first !"
                        }
                        showAlart = true
                    }
                }){
                    Text("Check Out")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Constants.AppColor.primaryColor)
                            .foregroundColor(.white)
                            .cornerRadius(12)
                            .padding(.horizontal)
                    
                }.alert(isPresented: $showAlart){
                    Alert(title: Text ("Can't Go to Payment CheckPoint"),
                          message: Text(alertMessage),
                          dismissButton: .default(Text("Ok")))
                }
                .padding(.bottom, 16)
                
                NavigationLink( destination: CheckoutScreen(viewModel: CheckoutViewModel(cartProducts: cartViewModel.cartProducts, cartId: cartViewModel.cartId ?? ""), addressViewModel: addressViewModel),
                                isActive: $navigateToCheckout
                
                ){
                    EmptyView()
                }
            }
        }
        .onAppear {
            cartViewModel.loadCartProducts()
            cartViewModel.fetchExchangeRate()
            Task {
                await addressViewModel.getAddresses(accessToken: SessionManager.shared.accessToken)
            }
       
            isTabBarHidden = true
        }

    }
}


