//
//  CartProduct.swift
//  Shopify-IOS
//
//  Created by Macos on 18/06/2025.
//

import Foundation

struct CartProduct: Identifiable {
    let id: String
    let Variantid: String
    var quantity: Int
    let title: String
    let VariantTitle :String
    let imageURL: String
    let price: Double
}
