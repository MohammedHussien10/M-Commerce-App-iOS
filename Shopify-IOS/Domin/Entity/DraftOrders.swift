//
//  DraftOrders.swift
//  Shopify-IOS
//
//  Created by Noha Ali Gomaa on 23/06/2025.
//

import Foundation

// MARK: - Root Response
struct DraftOrderUpdateResponse: Codable {
    let data: DraftOrderUpdateData?
}

// MARK: - Data Wrapper
struct DraftOrderUpdateData: Codable {
    let draftOrderUpdate: DraftOrderUpdateResult?
}

// MARK: - Update Result
struct DraftOrderUpdateResult: Codable {
    let draftOrder: DraftOrder?
}

// MARK: - Draft Order
struct DraftOrder: Codable {
    let id: String
    let name: String
    let email: String?
    let subtotalPrice: String?
    let note2: String?
    let totalPrice: String?
    let lineItems: LineItemConnection?
}
// MARK: - Line Items Wrapper
struct LineItemConnection: Codable {
    let nodes: [LineItem]
}

// MARK: - Line Item
struct LineItem: Codable {
    let quantity: Int
    let variant: OrderVariant?
    let product: OrderProduct?
}

// MARK: - Variant
struct OrderVariant: Codable {
    let id: String
    let price: String
    let availableForSale: Bool
    let title: String
}

// MARK: - Product
struct OrderProduct: Codable {
    let id: String
    let priceRangeV2: PriceRangeV2?
    let title: String
    let productType: String?
    let featuredImage: ProductImage?
}

// MARK: - Price Range
struct PriceRangeV2: Codable {
    let maxVariantPrice: Money
}

// MARK: - Image
struct ProductImage: Codable {
    let url: String
}
