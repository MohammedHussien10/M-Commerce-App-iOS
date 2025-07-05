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
    let exchangeRate: Double
    let currency: String
    var onUpdateQuantity: (_ lineId: String, _ newQuantity: Int) -> Void
    var onRemove: (_ lineId: String) -> Void
    @State private var showDeleteAlert = false
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

                Text(product.VariantTitle)
                    .font(.headline)
                
                HStack {
                    Button(action: {
                        if product.quantity > 1 {
                            onUpdateQuantity(product.id, product.quantity - 1)
                        } else {
                            showDeleteAlert = true
                        }
                    }) {
                        Image(systemName: "minus.circle")
                    }
                    .buttonStyle(.plain)

                    Text("\(product.quantity)")
                        .padding(.horizontal)
                    
                    Button(action: {
                                           if product.quantity < 5 {
                                               onUpdateQuantity(product.id, product.quantity + 1)
                                           }
                                       }) {
                                           Image(systemName: "plus.circle")
                                               .foregroundColor(product.quantity < 5 ? .blue : .gray)
                                       }
                                       .buttonStyle(.plain)
                                       .disabled(product.quantity >= 5)
                    
                    Spacer()
                    Text(
                        (product.price * Double(product.quantity) * exchangeRate)
                            .priceFormatter(with: currency)
                    )

                    Button(action: {
                        showDeleteAlert = true
                      
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
        .alert(isPresented: $showDeleteAlert) {
                Alert(
                    title: Text("Delete Item"),
                    message: Text("Are you sure you want to remove this item from your cart?"),
                    primaryButton: .destructive(Text("Delete")) {
                        onRemove(product.id)
                    },
                    secondaryButton: .cancel()
                )
            }
    }
}



//#Preview {
//    ShoppingCartProductRow()
//}
