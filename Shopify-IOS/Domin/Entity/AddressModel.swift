//
//  Untitled.swift
//  Shopify-IOS
//
//  Created by JETS Mobile Lab7 on 24/06/2025.
//

struct AddressModel: Identifiable, Equatable {
    let id: String
    let firstName: String
    let lastName: String
    let address1: String
    let city: String
    let country: String
    let phone: String
    var isDefault: Bool = false
}
