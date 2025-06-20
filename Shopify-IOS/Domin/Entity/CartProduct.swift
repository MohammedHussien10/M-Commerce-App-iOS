//
//  CartProduct.swift
//  Shopify-IOS
//
//  Created by Macos on 18/06/2025.
//

import Foundation

struct CartProduct: Identifiable {
    let id: String
    let quantity: Int
    let title: String
    let imageURL: String
    let price: Double
}
