//
//  SearchView.swift
//  Shopify-IOS
//
//  Created by Aya Emam on 13/06/2025.
//

import SwiftUI

struct SearchView: View {
    @StateObject private var viewModel = SearchViewModel()

    var body: some View {
        NavigationView {
            VStack(spacing: 8) {
                TextField("Search", text: $viewModel.searchText)
                    .padding(12)
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal)

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
                        ProductsView(products: viewModel.products)
                            .padding(.horizontal)
                    }
                }
            }
            .navigationTitle("Search")
        }
    }
}
