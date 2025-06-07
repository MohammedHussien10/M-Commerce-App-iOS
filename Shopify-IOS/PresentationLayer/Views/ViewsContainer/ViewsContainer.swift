//
//  ViewsContainer .swift
//  Shopify-IOS
//
//  Created by Macos on 07/06/2025.
//

import SwiftUI

struct ViewsContainer: View {
    var body: some View {
        TabView {
            HomeScreen()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            CategoriesScreen()
                .tabItem {
                    Label("Category", systemImage: "cart")
                }
            SettingsScreen()
                .tabItem {
                    Label("Settings", systemImage: "gearshape")
                }

        }.onAppear(){
            fetchProducts()
        }
            
            .tint(Color.OrangeColor("#FF7F00"))
    }
    
    func fetchProducts(){
        let query = GraphQLSchema.GetAllProductsQuery(first: 100)
        
        NetworkManager.sharedStoreFront.queryGraphQLRequest(query: query) { result in
            switch result {
            case .success(let success):
                success.products.nodes.forEach { node in
                    print(node.title)
                }
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
}

#Preview {
    ViewsContainer()
}
