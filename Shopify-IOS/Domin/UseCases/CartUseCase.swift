//
//  CartUseCase.swift
//  Shopify-IOS
//
//  Created by Macos on 18/06/2025.
//

import Foundation
import StoreFrontNameSpace

final class CartUseCase: CartUseCaseProtocol {
    private let repository: RepositoryProtocol

       init(repository: RepositoryProtocol) {
           self.repository = repository
       }

       func createCart(completion: @escaping (Result<String, Error>) -> Void) {
           repository.createCart(completion: completion)
       }

       func addToCart(cartId: String, productId: String, quantity: Int, completion: @escaping (Result<Void, Error>) -> Void) {
           repository.addToCart(cartId: cartId, productId: productId, quantity: quantity, completion: completion)
       }

       func updateCartLine(cartId: String, lineId: String, quantity: Int, completion: @escaping (Result<Void, Error>) -> Void) {
           repository.updateCartLine(cartId: cartId, lineId: lineId, quantity: quantity, completion: completion)
       }
    
       func getCart(cartId: String, completion: @escaping (Result<StoreFrontNameSpace.GetCartQuery.Data.Cart, Error>) -> Void) {
                repository.getCart(cartId: cartId, completion: completion)
       }
    
       func removeCartLine(cartId: String, lineId: String, completion: @escaping (Result<Void, Error>) -> Void) {
            repository.removeCartLine(cartId: cartId, lineId: lineId, completion: completion)
       }
}
