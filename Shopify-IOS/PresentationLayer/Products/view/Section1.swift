//
//  Section1.swift
//  Shopify-IOS
//
//  Created by Aya Emam on 12/06/2025.
//

import SwiftUI
import Kingfisher
struct Section1: View {
    @ObservedObject var viewModel: ProductDetailsViewModel
    
    @State private var selectedImageIndex = 0
    @State private var selectedSize: String = ""
    @State private var selectedColor: String = ""
    var reviews: [String] = ["nice", "good", "bad", "awesome"]

    var body: some View {
        TabView(selection: $selectedImageIndex) {
            ForEach(viewModel.imageUrl.indices, id: \.self) { index in
                KFImage(viewModel.imageUrl[index])
                    .resizable()
                    .scaledToFill()
                    .tag(index)
                    .frame(height: 300)
                    .clipped()

            }
         
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
        .frame(height: 300)
        
        VStack(alignment: .leading, spacing: 12) {
            Text(viewModel.Title)
                .font(.title3)
                .bold()
            HStack(){
                HStack(spacing: 4) {
                    ForEach(0..<5) { i in
                        Image(systemName: i < Int(4) ? "star.fill" : "star")
                            .foregroundColor(Color.orangeColor("FF7F00"))
                    }
                    Text("(\(String(format: "%.1f", 4.6)))")
                        .font(.caption)
                }
                Spacer()
                Text(viewModel.price)
                    .font(.title2)
                    .foregroundColor(.orange)
            }
            if !viewModel.sizes.isEmpty /*&& viewModel.sizes.count > 1*/{
                            HStack {
                                Text("Sizes:")
                                    .font(.subheadline)

                                Picker("Sizes", selection: $selectedSize) {
                                    ForEach(viewModel.sizes, id: \.self) { size in
                                        Text(size).tag(size)
                                    }
                                }
                                .pickerStyle(.segmented)
                            }
                            .padding(.vertical)
                        }
            if !viewModel.colorOptions.isEmpty /*&& viewModel.colorOptions.count > 1*/{
                HStack {
                    Text("Available Colors:")
                        .font(.subheadline)
                    
                    Picker("Available Colors", selection: $selectedColor) {
                        ForEach(viewModel.colorOptions, id: \.self) { color in
                            Text(color).tag(color)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                .padding(.vertical)
            }
        }
        .padding(.horizontal)
    }
}

