//
//  Section2.swift
//  Shopify-IOS
//
//  Created by Aya Emam on 12/06/2025.
//

import SwiftUI

struct Section2: View {
    var reviews: [String] = ["nice", "good", "bad", "awesome" , "very good" , "not bad"]
    @State private var showAllReviews = false

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Reviews")
                .font(.headline)

            ForEach(reviews.prefix(3), id: \.self) { review in
                Text("• \(review)")
                    .font(.subheadline)
                    .padding(.bottom, 2)
            }
            NavigationLink(destination: Reviews(reviews: reviews)) {
                           Text("View More")
                               .font(.caption)
                               .foregroundColor(Color.orangeColor("FF7F00"))
                       }
            
        }
        .padding(.horizontal)
    }
}

#Preview {
    Section2()
}
