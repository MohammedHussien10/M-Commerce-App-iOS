//
//  Mappable.swift
//  Shopify-IOS
//
//  Created by Noha Ali Gomaa on 08/06/2025.
//

protocol Mappable {
    associatedtype DomainModel
    func toDomain() -> DomainModel
}
