//
//  FavoritesView.swift
//  Shopify-IOS
//
//  Created by Aya Emam on 24/06/2025.
//
import SwiftUI
import Kingfisher

struct FavoritesView: View {
    @ObservedObject var viewModel = FavoritesViewModel()
    @Binding var isTabBarHidden: Bool
    
    var body: some View {
        NavigationView {
            VStack{
                Group {
                    if viewModel.isLoading {
                        ProgressView("Loading favorites...")
                    } else if viewModel.favoriteProducts.isEmpty {
                        Text("No favorites yet.")
                            .font(.headline)
                            .foregroundColor(.gray)
                    } else {
                        Text("Favorites")
                            .font(.largeTitle.bold())
                            .foregroundStyle(Constants.AppColor.primaryColor)
                        ProductsView(
                            products: viewModel.favoriteProducts,
                            isTabBarHidden: $isTabBarHidden
                        )
                    }
                }
            }
            .onAppear {
                viewModel.fetchFavorites()
            }
        }
    }
}
