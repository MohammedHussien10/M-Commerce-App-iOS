//
//  ProductDetailsView.swift
//  Shopify-IOS
//
//  Created by Noha Ali Gomaa on 08/06/2025.
//

import SwiftUI

struct ProductDetailsView: View {
    @ObservedObject var viewModel: ProductDetailsViewModel
    @EnvironmentObject var cartViewModel: CartViewModel
    @Binding var isTabBarHidden: Bool
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        ScrollView {
            if viewModel.isLoading {
                ProgressView("Loading product details...")
            } else if let error = viewModel.errorMessage {
                Spacer()
                Text("Error: \(error)")
                    .foregroundColor(.red)
                    .multilineTextAlignment(.center)
                    .padding()
                Spacer()
            } else {
                VStack(alignment: .leading, spacing: 20) {
                    Section1(viewModel: viewModel)
                    Section3(viewModel: viewModel)
                }.padding(.bottom, 100)
            }
        }.navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .onAppear {
                viewModel.checkFavoriteStatus()
            }
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.orange)
                            .font(.system(size: 18, weight: .bold))
                    }
                }
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button(action: {
                        viewModel.toggleFavorite()
                    }) {
                        Image(systemName: viewModel.isFavorited ? "heart.fill" : "heart")
                            .foregroundColor(Color.orangeColor("FF7F00"))
                    }
                    ZStack(alignment: .topTrailing) {
                        NavigationLink(destination: ShoppingCartScreen( isTabBarHidden: $isTabBarHidden)) {
                            Image(systemName: "cart")
                                .foregroundColor(Color.orangeColor("FF7F00"))
                                .font(.title)
                        }
                    }
                }
        }
    }
}
