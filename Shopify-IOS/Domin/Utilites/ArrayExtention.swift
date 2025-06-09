//
//  Untitled.swift
//  Shopify-IOS
//
//  Created by Noha Ali Gomaa on 08/06/2025.
//

extension Array where Element: Mappable {
    func toDomain() -> [Element.DomainModel] {
        return map { $0.toDomain() }
    }
}
