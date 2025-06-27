//
//  RemoteDataSource.swift
//  Shopify-IOS
//
//  Created by Macos on 18/06/2025.
//

import Foundation
import StoreFrontNameSpace

class RemoteDataSource: RemoteDataSourceProtocol {
    
    
    func createCart(completion: @escaping (Result<String, Error>) -> Void) {
        let buyerIdentity = StoreFrontNameSpace.CartBuyerIdentityInput(
            email: "mohammedhussien10101010@gmail.com"
        )
        
        let cartInput = StoreFrontNameSpace.CartInput(
            buyerIdentity: GraphQLNullable(buyerIdentity)
        )
        
        let mutation = StoreFrontNameSpace.CreateCartMutation(input: GraphQLNullable(cartInput))
        
        
        NetworkManager.sharedStoreFront.performGraphQLRequest(mutation: mutation) { result in
            switch result {
            case .success(let data):
                if let cartId = data.cartCreate?.cart?.id {
                    completion(.success(cartId))
                } else {
                    completion(.failure(NSError(domain: "", code: -1, userInfo: nil)))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    
    // MARK: - Cart
    func addToCart(cartId: String, productId: String, quantity: Int, completion: @escaping (Result<Void, Error>) -> Void) {
        let line = StoreFrontNameSpace.CartLineInput(quantity: GraphQLNullable<Int>(integerLiteral: quantity),merchandiseId: StoreFrontNameSpace.ID(productId))
        
        let mutation = StoreFrontNameSpace.AddToCartMutation(cartId: StoreFrontNameSpace.ID(cartId), lines: [line])
        
        NetworkManager.sharedStoreFront.performGraphQLRequest(mutation: mutation) { result in
            switch result {
            case .success(let data):
                if let errors = data.cartLinesAdd?.userErrors, !errors.isEmpty {
                    let message = errors.first?.message ?? "Unknown error"
                    completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: message])))
                } else {
                    completion(.success(()))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    
    
    
    func updateCartLine(cartId: String, lineId: String, quantity: Int, completion: @escaping (Result<Void, Error>) -> Void) {
        let lineUpdate = StoreFrontNameSpace.CartLineUpdateInput(
            id: StoreFrontNameSpace.ID(lineId),
            quantity: GraphQLNullable<Int>(integerLiteral: quantity)
        )
        
        let mutation = StoreFrontNameSpace.UpdateCartLineMutation(
            cartId: StoreFrontNameSpace.ID(cartId),
            lines: [lineUpdate]
        )
        
        NetworkManager.sharedStoreFront.performGraphQLRequest(mutation: mutation) { result in
            switch result {
            case .success(let data):
                if let errors = data.cartLinesUpdate?.userErrors, !errors.isEmpty {
                    let message = errors.first?.message ?? "Unknown error"
                    completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: message])))
                } else {
                    completion(.success(()))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    
    func getCart(cartId: String, completion: @escaping (Result<StoreFrontNameSpace.GetCartQuery.Data.Cart, Error>) -> Void) {
        let query = StoreFrontNameSpace.GetCartQuery(cartId: StoreFrontNameSpace.ID(cartId))
        NetworkManager.sharedStoreFront.queryGraphQLRequest(query: query) { result in
            switch result {
            case .success(let data):
                if let cart = data.cart {
                    completion(.success(cart))
                } else {
                    completion(.failure(NSError(domain: "", code: -1, userInfo: nil)))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func removeCartLine(cartId: String, lineId: String, completion: @escaping (Result<Void, Error>) -> Void) {
        let mutation = StoreFrontNameSpace.RemoveFromCartMutation(
            cartId: StoreFrontNameSpace.ID(cartId),
            lineIds: [StoreFrontNameSpace.ID(lineId)]
        )
        
        NetworkManager.sharedStoreFront.performGraphQLRequest(mutation: mutation) { result in
            switch result {
            case .success(let data):
                if let errors = data.cartLinesRemove?.userErrors, !errors.isEmpty {
                    let message = errors.first?.message ?? "Unknown error"
                    completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: message])))
                } else {
                    completion(.success(()))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func setDefaultAddress(addressId: String, accessToken: String, completion: @escaping (Result<Bool, any Error>) -> Void) {
        print("test")
    }
    
    
    func createAddress(
        address: StoreFrontNameSpace.MailingAddressInput,
        token: String,
        completion: @escaping (
            Result<AddressModel, Error>
        ) -> Void
    ) {
        let mutation = CustomerAddressCreateMutation(address: address, customerAccessToken: token)
        NetworkManager.sharedStoreFront.performGraphQLRequest(mutation: mutation) { result in
            switch result {
            case .success(let graphQLResult):
                if let newAddress = graphQLResult.customerAddressCreate?.customerAddress {
                    let addressModel = AddressModel(from: newAddress)
                    completion(.success(addressModel))
                } else if let error = graphQLResult.customerAddressCreate?.customerUserErrors.first {
                    completion(.failure(NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: error.message])))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    
    
    func updateAddress(
        id: String,
        address: MailingAddressInput,
        token: String,
        completion: @escaping (
            Result<AddressModel, Error>
        ) -> Void
    ) {
        let mutation = CustomerAddressUpdateMutation(address: address, customerAccessToken: token, id: id)
        
        NetworkManager.sharedStoreFront.performGraphQLRequest(mutation: mutation) { result in
            switch result {
            case .success(let graphQLResult):
                if let updated = graphQLResult.customerAddressUpdate?.customerAddress {
                    let addressModel = AddressModel(from: updated)
                    completion(.success(addressModel))
                }
                else if let userError = graphQLResult.customerAddressUpdate?.customerUserErrors.first {
                    completion(.failure(NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: userError.message])))
                } else {
                    completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Unknown error occurred."])))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    
    
    
    
    func deleteAddress(id: String, token: String, completion: @escaping (Result<String, Error>) -> Void) {
        let mutation = CustomerAddressDeleteMutation(customerAccessToken: token, id: id)
        
        NetworkManager.sharedStoreFront.performGraphQLRequest(mutation: mutation) { result in
            switch result {
            case .success(let graphQLResult):
                if let deletedId = graphQLResult.customerAddressDelete?.deletedCustomerAddressId {
                    completion(.success(deletedId))
                } else if let userError = graphQLResult.customerAddressDelete?.customerUserErrors.first {
                    completion(.failure(NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: userError.message])))
                } else {
                    completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Unknown error occurred."])))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    
    
    func updateDefaultAddress(addressId: String, accessToken: String, completion: @escaping (Result<Bool, Error>) -> Void) {
        let mutation = CustomerDefaultAddressUpdateMutation(addressId: addressId, customerAccessToken: accessToken)
        
        NetworkManager.sharedStoreFront.performGraphQLRequest(mutation: mutation) { result in
            switch result {
            case .success(let graphQLResult):
                if let errors = graphQLResult.customerDefaultAddressUpdate?.customerUserErrors, !errors.isEmpty {
                    let errorMessages = errors.map { $0.message }.joined(separator: "\n")
                    completion(.failure(NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: errorMessages])))
                } else {
                    completion(.success(true))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    
}
    
  
  
    
    
    



    
  
  
    
    
    


