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

    var body: some View {
        NavigationView {
            VStack {
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

                
                
                NavigationLink(destination: CheckoutScreen(products: cartViewModel.cartProducts)) {
                    Text("Check Out")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Constants.AppColor.primaryColor)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                        .padding(.horizontal)
                }
                .padding(.bottom, 16)
                Spacer().frame(height: 60)
            }
            .navigationTitle("Shopping Cart")
            .onAppear {
                cartViewModel.loadCartProducts()
            }
        }
    }
}

