//
//  BrandsView.swift
//  Shopify-IOS
//
//  Created by Noha Ali Gomaa on 15/06/2025.
//

import SwiftUI

struct BrandsView: View {
    @Environment(\.dismiss) private var dismiss
    let collection: CollectionModel
    @StateObject private var viewModel = BrandViewModel()
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            VStack(alignment: .leading, spacing: 16) {
                LazyVGrid(columns: columns, spacing: 16) {
                    if viewModel.isLoading {
                        ProgressView("Loading \(collection.title) products...")
                            .frame(maxWidth: .infinity, alignment: .center)
                    } else if let error = viewModel.errorMessage {
                        Text("Error: \(error)")
                            .foregroundColor(.red)
                            .padding()
                    } else {
                        ForEach(viewModel.products, id: \.id) { product in
                            
                            ProductItem(product: product).onAppear {
                                print(product.title)
                            }
                        }
                    }
                }
                Rectangle()
                  .fill(Color.white.opacity(0.2))
                  .frame(height: 50)
            }.onAppear{
                viewModel.fetchCollectionProducts(handle: collection.handle)
                let appearance = UINavigationBarAppearance()
                  appearance.titleTextAttributes = [
                      .foregroundColor: UIColor.orange,
                      .font: UIFont.boldSystemFont(ofSize: 20)
                  ]
                  UINavigationBar.appearance().standardAppearance = appearance
                  UINavigationBar.appearance().scrollEdgeAppearance = appearance
              
            }   .navigationTitle(collection.title)
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
