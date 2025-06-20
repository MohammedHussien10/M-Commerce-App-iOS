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
    // MARK: - Address
    func getAllAddresses() -> [AddressEntity]
    func addAddress(_ address: AddressEntity)
    func deleteAddress(_ address: AddressEntity)
    func deleteAllAddresses()
    
    // MARK: - Cart
    func createCart(completion: @escaping (Result<String, Error>) -> Void)
    func addToCart(cartId: String, productId: String, quantity: Int, completion: @escaping (Result<Void, Error>) -> Void)
    func updateCartLine(cartId: String, lineId: String, quantity: Int, completion: @escaping (Result<Void, Error>) -> Void)
    func getCart(cartId: String, completion: @escaping (Result<GraphQLCodeGen.GetCartQuery.Data.Cart, Error>) -> Void)
    func removeCartLine(cartId: String, lineId: String, completion: @escaping (Result<Void, Error>) -> Void)

}
