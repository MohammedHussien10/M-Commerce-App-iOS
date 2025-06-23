//
//  RemoteDataSourceProtocol.swift
//  Shopify-IOS
//
//  Created by Macos on 18/06/2025.
//

import Foundation
import StoreFrontNameSpace

protocol RemoteDataSourceProtocol {
    
    
    // MARK: - Cart
    func createCart(completion: @escaping (Result<String, Error>) -> Void)
    func addToCart(cartId: String, productId: String, quantity: Int, completion: @escaping (Result<Void, Error>) -> Void)
    func updateCartLine(cartId: String, lineId: String, quantity: Int, completion: @escaping (Result<Void, Error>) -> Void)
    func getCart(cartId: String, completion: @escaping (Result<StoreFrontNameSpace.GetCartQuery.Data.Cart, Error>) -> Void)
    func removeCartLine(cartId: String, lineId: String, completion: @escaping (Result<Void, Error>) -> Void)
}
