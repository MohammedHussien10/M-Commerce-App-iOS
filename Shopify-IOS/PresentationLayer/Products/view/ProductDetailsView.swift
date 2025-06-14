//
//  ProductDetailsView.swift
//  Shopify-IOS
//
//  Created by Noha Ali Gomaa on 08/06/2025.
//

import SwiftUI

struct ProductDetailsView: View {
    @ObservedObject var viewModel: ProductDetailsViewModel
    @State private var isFavorited = false
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
                    Section2()
                    Section3(viewModel: viewModel)
                }.padding(.bottom, 100)
            }
        }.navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .principal) {
                    Text(viewModel.Title)
                        .font(.caption)
                        .multilineTextAlignment(.center)
                        .lineLimit(nil)
                        .fixedSize(horizontal: false, vertical: true)
                }
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button(action: {
                        isFavorited.toggle()
                    }) {
                        Image(systemName: isFavorited ? "heart.fill" : "heart")
                            .foregroundColor(Color.orangeColor("FF7F00"))
                    }
                    ZStack(alignment: .topTrailing) {
                        Button {
                            print ("cart")
                        } label: {
                            Image(systemName: "cart")
                                .foregroundColor(Color.orangeColor("FF7F00"))
                        }
                    }
                }
        }
    }
}
