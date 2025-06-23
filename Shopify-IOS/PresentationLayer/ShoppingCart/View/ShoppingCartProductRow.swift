//
//  ShoppingCartProductRow.swift
//  Shopify-IOS
//
//  Created by Macos on 19/06/2025.
//

import SwiftUI

struct CartProductRow: View {
    let product: CartProduct
    let cartId: String
    var onUpdateQuantity: (_ lineId: String, _ newQuantity: Int) -> Void
    var onRemove: (_ lineId: String) -> Void
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
                
                HStack {
                    Button(action: {
                        if product.quantity > 1 {
                            onUpdateQuantity(product.id, product.quantity - 1)
                        }
                    }) {
                        Image(systemName: "minus.circle")
                    }
                    .buttonStyle(.plain)
                    Text("\(product.quantity)")
                        .padding(.horizontal)
                    
                    Button(action: {
                        onUpdateQuantity(product.id, product.quantity + 1)
                    }) {
                        Image(systemName: "plus.circle")
                    }
                    .buttonStyle(.plain)
                    Spacer()
                    Text(String(format: "$%.2f", product.price * Double(product.quantity)))
                              .font(.subheadline)
                              .foregroundColor(.green)
                    Button(action: {
                        onRemove(product.id)
                    }) {
                        Image(systemName: "trash")
                            .foregroundColor(.red)
                    }
                    .buttonStyle(.plain)
                }
            }
            
            Spacer()
        }
        .padding(.vertical, 8)
    }
}



//#Preview {
//    ShoppingCartProductRow()
//}
