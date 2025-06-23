//
//  Orders.swift
//  Shopify-IOS
//
//  Created by Noha Ali Gomaa on 23/06/2025.
//

import Foundation

// MARK: - Root Response
struct OrdersResponse: Codable {
    let data: OrdersData?
}

// MARK: - Data Wrapper
struct OrdersData: Codable {
    let orders: OrderConnection?
}

// MARK: - Orders Connection
struct OrderConnection: Codable {
    let edges: [OrderEdge]
}

// MARK: - Order Edge
struct OrderEdge: Codable {
    let node: Order
}

// MARK: - Order
struct Order: Codable ,Identifiable{
    let id: String
    let name: String
    let phone: String?
    let createdAt: String
    let displayFinancialStatus: String?
    let displayFulfillmentStatus: String?
    let returnStatus: String?
    let totalPriceSet: TotalPriceSet?
    let billingAddress: BillingAddress?
}

// MARK: - Total Price Set
struct TotalPriceSet: Codable {
    let presentmentMoney: Money
    let shopMoney: Money
}


// MARK: - Billing Address
struct BillingAddress: Codable {
    let address1: String?
    let firstName: String?
    let lastName: String?
    let city: String?
    let country: String?
    let zip: String?
    let phone: String?
    let id: String?
}
