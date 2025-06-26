//
//  Section3.swift
//  Shopify-IOS
//
//  Created by Aya Emam on 12/06/2025.
//

import SwiftUI

struct Section3: View {
    @ObservedObject var viewModel: ProductDetailsViewModel
    @EnvironmentObject var cartViewModel: CartViewModel
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Description")
                .font(.headline)

            ScrollView(.vertical) {
                Text(viewModel.description)
                    .font(.body)
            }
            .frame(minHeight: 100)
            Button(action: {
                if let variantId = viewModel.product.variants.first?.id {
                      cartViewModel.addProduct(productId: variantId, quantity: 1)
                  } else {
                      print("No variant ID available to add to cart")
                  }
            }) {
                Text(viewModel.isOutOfStock ? "Out of Stock" : "Add to Cart")
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .foregroundColor(.white)
                    .background(viewModel.isOutOfStock ? Color.gray : Color.orangeColor("FF7F00"))
                    .cornerRadius(8)
            }


        }.disabled(viewModel.isOutOfStock)
        .padding(.horizontal)
    }
}
//extension Section3 {
//    @State private var productQuantity: Int = 0
//    @State private var isInCart: Bool = false
//    if isInCart && productQuantity > 0 {
//        HStack(spacing: 20) {
//            Button(action: {
//                if productQuantity > 1 {
//                    productQuantity -= 1
//                } else {
//                    productQuantity = 0
//                    isInCart = false
//                }
//            }) {
//                Image(systemName: "minus")
//                    .font(.system(size: 18, weight: .bold))
//                    .frame(width: 36, height: 36)
//                    .foregroundColor(.white)
//                    .background(Color.orangeColor("FF7F00"))
//                    .clipShape(Circle())
//                    .shadow(radius: 2)
//            }
//
//            Text("\(productQuantity)")
//                .font(.headline)
//                .frame(width: 40)
//                .padding(.vertical, 6)
//                .background(Color(.systemGray6))
//                .cornerRadius(10)
//
//            Button(action: {
//                productQuantity += 1
//            }) {
//                Image(systemName: "plus")
//                    .font(.system(size: 18, weight: .bold))
//                    .frame(width: 36, height: 36)
//                    .foregroundColor(.white)
//                    .background(Color.orangeColor("FF7F00"))
//                    .clipShape(Circle())
//                    .shadow(radius: 2)
//            }
//        }
//        .padding()
//        .frame(maxWidth: .infinity)
//        .background(Color.orange.opacity(0.2))
//        .cornerRadius(12)
//    } else {
//        Button(action: {
//            isInCart = true
//            productQuantity = 1
//        }) {
//            HStack {
//                Image(systemName: "cart.badge.plus")
//                Text("Add to Cart")
//                    .fontWeight(.bold)
//            }
//            .frame(maxWidth: .infinity)
//            .padding()
//            .foregroundColor(.white)
//            .background(Color.orangeColor("FF7F00"))
//            .cornerRadius(12)
//        }
//    }
//}
//
