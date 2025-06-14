//
//  ProductItem.swift
//  Shopify-IOS
//
//  Created by Noha Ali Gomaa on 08/06/2025.
//

import SwiftUI
import Kingfisher

struct ProductItem: View {
    let product: Product

    var body: some View {
        NavigationLink(destination: ProductDetailsView(viewModel: ProductDetailsViewModel(product: product))) {
            VStack(alignment: .leading, spacing: 4) {
                    // Product Image
                    KFImage(product.images.first ?? URL(string: "https://theperfectroundgolf.com/wp-content/uploads/2022/04/placeholder.png")!)
                        .resizable()
                        .scaledToFill()
                        .frame(width: UIScreen.main.bounds.width * 0.20,
                               height: UIScreen.main.bounds.width * 0.20)
                        .background(Color.gray.opacity(0.4))
                        .cornerRadius(10)
                        .clipped()
              

                // Product Info
                VStack(alignment: .leading, spacing: 12) {
                    let parts = product.title.split(separator: "|")
                    Text(parts.count > 1 ? String(parts[1]) : product.title)
                        .font(.system(size: 16))
                        .foregroundColor(.black)

                    Text(product.productType)
                        .font(.custom(Constants.AppFont.regularFont, size: 11))
                        .foregroundColor(.gray)
                        .padding(.horizontal, 5)

                    if let firstVariant = product.variants.first {
                        let price = firstVariant.price.amount
                        Text("\(price)")
                            .font(.system(size: 17, weight: .bold, design: .rounded))
                            .foregroundColor(.black)
                    } else {
                        Text("No price")
                            .font(.system(size: 17))
                            .foregroundColor(.red)
                    }

                    Spacer()
                }
            }
            .padding()
            .padding(.horizontal)
            .frame(width: 170 ,height: 200)
            .cornerRadius(25)
            .overlay(
                RoundedRectangle(cornerRadius: 25)
                    .stroke(Color.orange, lineWidth: 1.5) // Orange border
            )
           
        }
    }
}
