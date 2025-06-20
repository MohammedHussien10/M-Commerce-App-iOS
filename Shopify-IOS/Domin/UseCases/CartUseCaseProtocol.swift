//
//  CartUseCaseProtocol.swift
//  Shopify-IOS
//
//  Created by Macos on 18/06/2025.
//

import Foundation

protocol CartUseCaseProtocol {
    func createCart(completion: @escaping (Result<String, Error>) -> Void)
    func addToCart(cartId: String, productId: String, quantity: Int, completion: @escaping (Result<Void, Error>) -> Void)
    func updateCartLine(cartId: String, lineId: String, quantity: Int, completion: @escaping (Result<Void, Error>) -> Void)
    func getCart(cartId: String, completion: @escaping (Result<GraphQLCodeGen.GetCartQuery.Data.Cart, Error>) -> Void)

}
