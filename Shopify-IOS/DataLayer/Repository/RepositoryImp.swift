//
//  RepositoryImp.swift
//  Shopify-IOS
//
//  Created by Macos on 13/06/2025.
//

import Foundation
import StoreFrontNameSpace

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
    func getCart(cartId: String, completion: @escaping (Result<StoreFrontNameSpace.GetCartQuery.Data.Cart, Error>) -> Void) {
        remoteDataSource.getCart(cartId: cartId, completion: completion)
    }
    func removeCartLine(cartId: String, lineId: String, completion: @escaping (Result<Void, Error>) -> Void) {
        remoteDataSource.removeCartLine(cartId: cartId, lineId: lineId, completion: completion)
    }
    
    //address
 
    func createAddress(address: StoreFrontNameSpace.MailingAddressInput, token: String, completion: @escaping (Result<AddressModel, any Error>) -> Void) {
        remoteDataSource.createAddress(address: address, token: token, completion: completion)
    }
    
    func deleteAddress(id: String, token: String, completion: @escaping (Result<String, Error>) -> Void) {
        remoteDataSource.deleteAddress(id: id, token: token, completion: completion)
    }
    
    func updateAddress(id: String, address: MailingAddressInput, token: String, completion: @escaping (Result<AddressModel, Error>) -> Void) {
        remoteDataSource.updateAddress(id: id, address: address, token: token, completion: completion)
    }

    func setDefaultAddress(addressId id: String, accessToken: String, completion: @escaping (Result<Bool, Error>) -> Void) {
        remoteDataSource.setDefaultAddress(addressId: id, accessToken: accessToken, completion: completion)
        }
    

}
