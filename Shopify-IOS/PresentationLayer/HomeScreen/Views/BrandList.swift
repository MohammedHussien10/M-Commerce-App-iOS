//
//  BrandList.swift
//  Shopify-IOS
//
//  Created by Noha Ali Gomaa on 15/06/2025.
//

import SwiftUI

struct BrandList: View {
    @EnvironmentObject var themeViewModel: ThemeViewModel
    let collections: [CollectionModel]
    let rows = [
           GridItem(.flexible()),
           GridItem(.flexible())
       ]
    @Binding var isTabBarHidden: Bool
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
             LazyHGrid(rows: rows, spacing: 10) {
                 ForEach(collections.filter { $0.title.lowercased() != "home page" }, id: \.id) { collection in

                     
                     NavigationLink {
                         BrandsView(collection: collection, isTabBarHidden: $isTabBarHidden)
                     } label: {
                       BrandItem(collection: collection)
                     }
                    .tint(.orange)
                 }
             }
             .frame(height: UIScreen.main.bounds.width * 0.55)
             .padding(.vertical, 10)
         }
        .background(Color.forBackground)
    }
}

