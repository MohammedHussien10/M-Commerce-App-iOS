//
//  Variants.swift
//  Shopify-IOS
//
//  Created by Noha Ali Gomaa on 08/06/2025.
//
import Foundation

struct Variant: Identifiable,  Codable  {
    let id: String
    let title: String
    let sku: String
    let barcode: String
    let availableForSale: Bool
    let currentlyNotInStock: Bool
    let imageURL: URL?
    let price: Money
    let unitPrice: Money?
    let quantityRule: QuantityRule
}
