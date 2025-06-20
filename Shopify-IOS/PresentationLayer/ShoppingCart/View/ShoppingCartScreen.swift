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
                  CartProductRow(product: product)
              }
              .navigationTitle("Shopping Cart")
              .onAppear {
                  cartViewModel.loadCartProducts()
              }
          }
      }
}
