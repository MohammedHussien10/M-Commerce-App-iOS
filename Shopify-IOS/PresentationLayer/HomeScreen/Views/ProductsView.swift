//
//  ProductsView.swift
//  Shopify-IOS
//
//  Created by Noha Ali Gomaa on 08/06/2025.
//

import SwiftUI

struct ProductsView: View {
    let products : [Product]
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    var body: some View {
        
        if products.isEmpty {
              VStack {
                  Spacer()
                  Image("out-of-stock") 
                      .resizable()
                      .scaledToFit()
                      .frame(width: 200, height: 200)
                      .padding()
                  Text("No Products Found")
                      .font(.headline)
                      .foregroundColor(.gray)
                  Spacer()
              }
              .frame(maxWidth: .infinity, maxHeight: .infinity)
          } else {
              ScrollView {
                  LazyVGrid(columns: columns, spacing: 16) {
                      ForEach(products, id: \.id) { product in
                          ProductItem(product: product)
                              .onAppear {
                                  print(product.title)
                              }
                      }
                  }
                  .padding()
              }
          }
      }
}
//
//#Preview {
//    ProductsView(products: [])
//}
