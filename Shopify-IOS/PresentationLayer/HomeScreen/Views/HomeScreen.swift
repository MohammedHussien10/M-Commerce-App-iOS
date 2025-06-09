//
//  HomeScreen.swift
//  Shopify-IOS
//
//  Created by Macos on 07/06/2025.
//

import SwiftUI

struct HomeScreen: View {
    @StateObject private var viewModel = HomeViewModel()
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 16) {
                    HeaderWithIconAndLogo(
                        leftIcon: "magnifyingglass",
                        rightIcon: "panda",
                        onLeftIconTap: {
                            print("Search tapped")
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
                    
                    ProductHeader()
                
                    if viewModel.isLoading {
                        ProgressView("Loading products...")
                    } else if let error = viewModel.errorMessage {
                        Text("Error: \(error)")
                            .foregroundColor(.red)
                    } else {
                        ProductsView(products: viewModel.products)
                    }
                }
                .padding()
            }
            .onAppear {
                viewModel.fetchProducts()
            }
        }
    }
}




#Preview {
    HomeScreen()
}
