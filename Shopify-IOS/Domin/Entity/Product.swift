//
//  Product.swift
//  Shopify-IOS
//
//  Created by Noha Ali Gomaa on 08/06/2025.
//

import Foundation
struct Product {
    let id: String
    let title: String
    let descriptionHtml: String
    let vendor: String
    let availableForSale: Bool
    let productType: String
    let totalInventory: Int
    let featuredImageURL: URL?
    let images: [URL]
    let category: ProductCategory?
    let variants: [Variant]
}
