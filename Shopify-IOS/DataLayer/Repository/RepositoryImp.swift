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
    
    // MARK: - Remote
    private let remoteDataSource: RemoteDataSourceProtocol

      init(remoteDataSource: RemoteDataSourceProtocol) {
          self.remoteDataSource = remoteDataSource
      }
    
    
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
    


    

    func createCart(completion: @escaping (Result<String, Error>) -> Void) {
        remoteDataSource.createCart(completion: completion)
    }

    func addToCart(cartId: String, productId: String, quantity: Int, completion: @escaping (Result<Void, Error>) -> Void) {
        remoteDataSource.addToCart(cartId: cartId, productId: productId, quantity: quantity, completion: completion)
    }

    func updateCartLine(cartId: String, lineId: String, quantity: Int, completion: @escaping (Result<Void, Error>) -> Void) {
        remoteDataSource.updateCartLine(cartId: cartId, lineId: lineId, quantity: quantity, completion: completion)
    }
    func getCart(cartId: String, completion: @escaping (Result<GraphQLCodeGen.GetCartQuery.Data.Cart, Error>) -> Void) {
        remoteDataSource.getCart(cartId: cartId, completion: completion)
    }
    func removeCartLine(cartId: String, lineId: String, completion: @escaping (Result<Void, Error>) -> Void) {
        remoteDataSource.removeCartLine(cartId: cartId, lineId: lineId, completion: completion)
    }

}
