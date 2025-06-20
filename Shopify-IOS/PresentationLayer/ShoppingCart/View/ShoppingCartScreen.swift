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
            .navigationTitle("Shopping Cart")
            .onAppear {
                cartViewModel.loadCartProducts()
            }
        }
    }
}

