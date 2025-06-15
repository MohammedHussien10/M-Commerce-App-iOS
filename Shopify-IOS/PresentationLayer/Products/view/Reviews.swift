//
//  Reviews.swift
//  Shopify-IOS
//
//  Created by Aya Emam on 12/06/2025.
//

import SwiftUI

struct Reviews: View {
    var reviews: [String]

    var body: some View {
        List(reviews, id: \.self) { review in
            Text(review)
        }
        .navigationTitle("All Reviews")
    }
}


