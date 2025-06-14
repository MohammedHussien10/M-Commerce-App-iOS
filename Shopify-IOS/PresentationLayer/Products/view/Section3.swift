//
//  Section3.swift
//  Shopify-IOS
//
//  Created by Aya Emam on 12/06/2025.
//

import SwiftUI

struct Section3: View {
    @ObservedObject var viewModel: ProductDetailsViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Description")
                .font(.headline)

            ScrollView(.vertical) {
                Text(viewModel.description)
                    .font(.body)
            }
            .frame(minHeight: 100)
            Button(action: {
            }) {
                Text("Add to Cart")
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.orangeColor("FF7F00"))
                    .cornerRadius(8)
            }.padding(.top,10)

        }
        .padding(.horizontal)
    }
}


