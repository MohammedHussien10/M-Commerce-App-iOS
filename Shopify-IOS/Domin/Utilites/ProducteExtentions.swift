//
//  ProducteExtentions.swift
//  Shopify-IOS
//
//  Created by Noha Ali Gomaa on 08/06/2025.
//

import Foundation

extension GraphQLCodeGen.GetAllProductsQuery.Data.Products: Mappable{
    typealias DomainModel = [Product]
    
    func toDomain() -> DomainModel {
        return self.nodes.toDomain()
    }
}

extension GraphQLCodeGen.GetAllProductsQuery.Data.Products.Node: Mappable{
    typealias DomainModel = Product
    
    func toDomain() -> DomainModel {
        return Product(
                id: id,
                title: title,
                descriptionHtml: descriptionHtml,
                vendor: vendor,
                availableForSale: availableForSale,
                productType: productType,
                totalInventory: totalInventory ?? 0,
                featuredImageURL: URL(string: featuredImage?.url ?? ""),
                images: images.nodes.compactMap { URL(string: $0.url) },
                category: category.map { ProductCategory(id: $0.id, name: $0.name) },
                variants: variants.nodes.map { $0.toDomain() }
            )
    }
}
extension GraphQLCodeGen.GetAllProductsQuery.Data.Products.Node.Variants.Node.QuantityRule {
    func toDomain() -> QuantityRule {
        return QuantityRule(
            increment: increment,
            maximum: maximum ?? 1,
            minimum: minimum
        )
    }
}

extension GraphQLCodeGen.GetAllProductsQuery.Data.Products.Node.Variants.Node {
    func toDomain() -> Variant {
        return Variant(
            id: id,
            title: title,
            sku: sku ?? "",
            barcode: barcode ?? "",
            availableForSale: availableForSale,
            currentlyNotInStock: currentlyNotInStock,
            imageURL: URL(string: image?.url ?? ""),
            price: Money(
                amount: Double(price.amount) ?? 0,
                currencyCode: price.currencyCode.rawValue
            ),
            unitPrice: unitPrice.map {
                Money(
                    amount: Double($0.amount) ?? 0,
                    currencyCode: $0.currencyCode.rawValue
                )
            },
            quantityRule: quantityRule.toDomain()


        )
    }
}


