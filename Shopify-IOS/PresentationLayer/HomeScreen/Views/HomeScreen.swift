//
//  HomeScreen.swift
//  Shopify-IOS
//
//  Created by Macos on 07/06/2025.
//

import SwiftUI

struct HomeScreen: View {
    @StateObject private var viewModel = HomeViewModel()
    @State private var showSearchView = false
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 16) {
                    HeaderWithIconAndLogo(
                        leftIcon: "magnifyingglass",
                        rightIcon: "panda",
                        onLeftIconTap: {
                            print("Search tapped")
                            showSearchView = true
                        },
                        onRightIconTap: {
                            print("Cart tapped")
                        })

                    // Example visible content
                    Text("Welcome to Genie!")
                        .font(.title2)
                        .frame(alignment: .trailing)
                        .bold()

                    Coupons()
                    
                   
                
                    if viewModel.isLoading {
                        ProgressView("Loading products...")
                    } else if let error = viewModel.errorMessage {
                        Text("Error: \(error)")
                            .foregroundColor(.red)
                    } else {
                        BrandsHeader()
                        BrandList(collections: viewModel.collections)
                        ProductHeader()
                        ProductsView(products:  Array(viewModel.products.prefix(4)))
                    }
                }
                .padding()
            }
            Rectangle()
              .fill(Color.white.opacity(0.2))
              .frame(height: 50)
                             
            .onAppear {
                viewModel.fetchProducts()
                viewModel.fetchCollections()
            }
            .navigationDestination(isPresented: $showSearchView) {
                SearchView()
            }
        }.tint(.orange)
    }
}




#Preview {
    HomeScreen()
}
