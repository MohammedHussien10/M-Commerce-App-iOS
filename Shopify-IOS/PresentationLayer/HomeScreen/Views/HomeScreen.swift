//
//  HomeScreen.swift
//  Shopify-IOS
//
//  Created by Macos on 07/06/2025.
//

import SwiftUI

struct HomeScreen: View {
    @StateObject private var viewModel = HomeViewModel()
    @EnvironmentObject var cartViewModel: CartViewModel
    @State private var showSearchView = false
    @Binding var isTabBarHidden: Bool
    @Binding var selectedTab: ViewsContainer.Tab
    @State private var showCategoryView = false
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 16) {
                    HeaderWithIconAndLogo(
                        leftIcon: "magnifyingglass",
                        rightIcon: "panda", selectedTab: $selectedTab,
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
                        BrandList(collections: viewModel.collections, isTabBarHidden: $isTabBarHidden)
                        ProductHeader()
                        HStack {
                            Spacer()
                            Button(action: {
                                selectedTab = .grid
                            }) {
                                Text("See more...")
                                    .font(.system(size: 18, weight: .semibold))
                                    .foregroundColor(.orange)
                                    .bold()
                            }
                        }
                        .padding(.trailing)
                        .ignoresSafeArea(.container)
                        ProductsView(products:  Array(viewModel.products.prefix(4)), isTabBarHidden: $isTabBarHidden)
                     
                    }
                }
                .padding()
            }
            Rectangle()
              .fill(Color.white.opacity(0.2))
              .frame(height: 65)
                             
            .onAppear {
                isTabBarHidden = false
                cartViewModel.loadCartProducts()
                viewModel.getAllDiscountCodes()
                viewModel.fetchProducts()
                viewModel.fetchCollections()
            }
            .navigationDestination(isPresented: $showSearchView) {
                SearchView(isTabBarHidden: $isTabBarHidden)
            }
            
        }.tint(.orange)
    }
}



