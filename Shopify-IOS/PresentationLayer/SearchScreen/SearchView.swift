//
//  SearchView.swift
//  Shopify-IOS
//
//  Created by Aya Emam on 13/06/2025.
//

import SwiftUI

struct SearchView: View {
    @StateObject private var viewModel = SearchViewModel()
    @Environment(\.dismiss) private var dismiss
    @Binding var isTabBarHidden: Bool
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 8) {
                    HStack(spacing: 8) {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                        TextField("Search for products...", text: $viewModel.searchText)
                            .foregroundColor(.primary)
                            .padding(.vertical, 10)
                        
                        if !viewModel.searchText.isEmpty {
                            Button(action: {
                                withAnimation {
                                    viewModel.searchText = ""
                                }
                            }) {
                                Image(systemName: "xmark.circle.fill")
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                    .padding(.horizontal, 12)
                    .padding(.vertical, 6)
                    .background(Color(.systemGray6))
                    .cornerRadius(20)
                    .shadow(color: Color.black.opacity(0.05), radius: 4, x: 0, y: 2)
                VStack(alignment: .leading) {
                    Text("Max Price: \(Int(viewModel.currentMaxPrice)) ")
                        .font(.subheadline)
                        .padding(.horizontal)

                    Slider(value: $viewModel.currentMaxPrice, in: 0...viewModel.maxPrice, step: 1)
                        .accentColor(.orange)
                        .padding(.horizontal)
                }
                .padding(.vertical, 4)

                if viewModel.isLoading {
                    ProgressView("Loading...")
                        .padding()
                } else if let error = viewModel.errorMessage {
                    Spacer()
                    Text("Error: \(error)")
                        .foregroundColor(.red)
                        .multilineTextAlignment(.center)
                        .padding()
                    Spacer()
                } else if viewModel.products.isEmpty {
                    Spacer()
                    Text("No results found")
                        .foregroundColor(.gray)
                        .font(.body)
                    Spacer()
                } else {
                    ScrollView {
                        ProductsView(products: viewModel.products, isTabBarHidden: $isTabBarHidden)
                            .padding(.horizontal)
                    }
                }
            }
            .onAppear{
                let appearance = UINavigationBarAppearance()
                  appearance.titleTextAttributes = [
                      .foregroundColor: UIColor.orange,
                      .font: UIFont.boldSystemFont(ofSize: 26)
                  ]
                  UINavigationBar.appearance().standardAppearance = appearance
                  UINavigationBar.appearance().scrollEdgeAppearance = appearance
              
            }   .navigationTitle("Search")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarBackButtonHidden(true)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(action: {
                            dismiss()
                        }) {
                            Image(systemName: "chevron.left")
                                .foregroundColor(.orange)
                                .font(.system(size: 18, weight: .bold))
                        }
                    }
                }

        }
    }
}


    
