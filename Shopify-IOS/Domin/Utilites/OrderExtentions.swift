//
//  OrderExtentions.swift
//  Shopify-IOS
//
//  Created by Noha Ali Gomaa on 23/06/2025.
//


import Foundation
import AdminNameSpace

// MARK: - GraphQL → Domain Model Mapping

extension AdminNameSpace.GetOrdersQuery.Data.Orders.Edge.Node: Mappable {
    typealias DomainModel = Order

    func toDomain() -> Order {
        return Order(
            id: id,
            name: name,
            phone: phone,
            createdAt: createdAt,
            displayFinancialStatus: displayFinancialStatus?.rawValue,
            displayFulfillmentStatus: displayFulfillmentStatus.rawValue,
            returnStatus: returnStatus.rawValue,
            totalPriceSet: totalPriceSet.toDomain(),
            billingAddress: billingAddress?.toDomain()
        )
    }
}

extension AdminNameSpace.GetOrdersQuery.Data.Orders.Edge.Node.TotalPriceSet: Mappable {
    func toDomain() -> TotalPriceSet {
        return TotalPriceSet(
            presentmentMoney: presentmentMoney.toDomain(),
            shopMoney: shopMoney.toDomain()
        )
    }
}

extension AdminNameSpace.GetOrdersQuery.Data.Orders.Edge.Node.TotalPriceSet.PresentmentMoney {
    func toDomain() -> Money {
        return Money(
            amount:Double( amount) ?? 0.0,
            currencyCode: currencyCode.rawValue
        )
    }
}

extension AdminNameSpace.GetOrdersQuery.Data.Orders.Edge.Node.TotalPriceSet.ShopMoney {
    func toDomain() -> Money {
        return Money(
            amount:Double( amount) ?? 0.0,
            currencyCode: currencyCode.rawValue
        )
    }
}

extension AdminNameSpace.GetOrdersQuery.Data.Orders.Edge.Node.BillingAddress {
    func toDomain() -> BillingAddress {
        return BillingAddress(
            address1: address1,
            firstName: firstName,
            lastName: lastName,
            city: city,
            country: country,
            zip: zip,
            phone: phone,
            id: id
        )
    }
}
