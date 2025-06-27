//
//  CollectionExtentions.swift
//  Shopify-IOS
//
//  Created by Noha Ali Gomaa on 15/06/2025.
//

import Foundation
import StoreFrontNameSpace

extension StoreFrontNameSpace.GetCollectionsQuery.Data.Collections.Node: Mappable {
    typealias DomainModel = CollectionModel

    func toDomain() -> CollectionModel {
        return CollectionModel(
            id: self.id,
            title: self.title,
            handle: self.handle,
            description: self.description,
            imageUrl: self.image?.url
           
        )
    }
}

extension StoreFrontNameSpace.GetCollectionQuery.Data{
    func toDomainProducts() -> [Product] {
        return collection?.products.nodes.map { $0.toDomain() } ?? []
    }
}

extension StoreFrontNameSpace.GetCollectionQuery.Data.Collection.Products.Node: Mappable {
    func toDomain() -> Product {
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
            variants: variants.nodes.map { $0.toDomain() },
            tags: tags
        )
    }
}
extension StoreFrontNameSpace.GetCollectionQuery.Data.Collection.Products.Node.Variants.Node: Mappable {
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
            quantityRule: quantityRule.toDomain(),
            selectedOptions: selectedOptions.map { $0.toDomain() }


        )
    }
}
extension StoreFrontNameSpace.GetCollectionQuery.Data.Collection.Products.Node.Variants.Node.QuantityRule {
    func toDomain() -> QuantityRule {
        return QuantityRule(
            increment: increment,
            maximum: maximum ?? 1,
            minimum: minimum
        )
    }
}
extension StoreFrontNameSpace.GetCollectionQuery.Data.Collection.Products.Node.Variants.Node.SelectedOption {
    func toDomain() -> SelectedOption {
        return SelectedOption(
            name: name ,
            value: value
        )
    }
}

