//
//  RepositoryImp.swift
//  Shopify-IOS
//
//  Created by Macos on 13/06/2025.
//

import Foundation
// MARK: - Repository Implementation
class RepositoryImp: RepositoryProtocol{
    // MARK: - Properties
    private let coreDataManager = CoreDataManager.shared
    // MARK: - RepositoryProtocol Methods
     func getAllAddresses() -> [AddressEntity] {
         return coreDataManager.fetch(entity: AddressEntity.self)
     }
     
     func addAddress(_ address: AddressEntity) {
         coreDataManager.saveContext()
     }
     
     func deleteAddress(_ address: AddressEntity) {
         coreDataManager.delete(address)
     }
     
     func deleteAllAddresses() {
         coreDataManager.deleteAll(entity: AddressEntity.self)
     }
}
