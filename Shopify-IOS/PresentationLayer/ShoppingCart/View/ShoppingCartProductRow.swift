//
//  ShoppingCartProductRow.swift
//  Shopify-IOS
//
//  Created by Macos on 19/06/2025.
//

import SwiftUI

struct CartProductRow: View {
    let product: CartProduct

    var body: some View {
        HStack(alignment: .top) {
            AsyncImage(url: URL(string: product.imageURL)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                Color.gray.opacity(0.3)
            }
            .frame(width: 80, height: 80)
            .cornerRadius(12)

            VStack(alignment: .leading, spacing: 6) {
                Text(product.title)
                    .font(.headline)

                Text("Quantity: \(product.quantity)")
                    .font(.subheadline)

                Text(String(format: "$%.2f", product.price))
                    .font(.subheadline)
                    .foregroundColor(.green)
            }

            Spacer()
        }
        .padding(.vertical, 8)
    }
}


//#Preview {
//    ShoppingCartProductRow()
//}
