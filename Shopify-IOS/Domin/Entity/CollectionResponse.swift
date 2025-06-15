//
//  CollectionResponse.swift
//  Shopify-IOS
//
//  Created by Noha Ali Gomaa on 15/06/2025.
//

struct CollectionResponse: Codable {
    let data: CollectionData
}
struct CollectionData: Codable {
    let collection: Collection?
}

struct Collection: Codable {
    let products: ProductConnection
}

struct ProductConnection: Codable {
    let nodes: [Product]
}
