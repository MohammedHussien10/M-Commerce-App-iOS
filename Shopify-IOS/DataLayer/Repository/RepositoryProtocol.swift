//
//  Repository.swift
//  Shopify-IOS
//
//  Created by Macos on 13/06/2025.
//

import Foundation
// MARK: - RepositoryProtocol
// MARK: - CRUD Operations
protocol RepositoryProtocol{
     func getAllAddresses() -> [AddressEntity]
     func addAddress(_ address: AddressEntity)
     func deleteAddress(_ address: AddressEntity)
     func deleteAllAddresses()
}
