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
        
        LazyVGrid(columns: columns, spacing: 16) {
            ForEach(products, id: \.id) { product in
               
               ProductItem(product: product).onAppear {
                   print(product.title)
               }
            }
        }

    }
}
//
//#Preview {
//    ProductsView(products: [])
//}
