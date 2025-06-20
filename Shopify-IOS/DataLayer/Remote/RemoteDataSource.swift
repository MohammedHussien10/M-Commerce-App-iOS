//
//  RemoteDataSource.swift
//  Shopify-IOS
//
//  Created by Macos on 18/06/2025.
//

import Foundation
class RemoteDataSource: RemoteDataSourceProtocol {
   
    
    func createCart(completion: @escaping (Result<String, Error>) -> Void) {
        let buyerIdentity = GraphQLCodeGen.CartBuyerIdentityInput(
            email: "mohammedhussien10101010@gmail.com"
        )

        let cartInput = GraphQLCodeGen.CartInput(
            buyerIdentity: GraphQLNullable(buyerIdentity)
        )

        let mutation = GraphQLCodeGen.CreateCartMutation(input: GraphQLNullable(cartInput))

        
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
        let line = GraphQLCodeGen.CartLineInput(quantity: GraphQLNullable<Int>(integerLiteral: quantity),merchandiseId: GraphQLCodeGen.ID(productId))

        let mutation = GraphQLCodeGen.AddToCartMutation(cartId: GraphQLCodeGen.ID(cartId), lines: [line])

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
        let lineUpdate = GraphQLCodeGen.CartLineUpdateInput(
            id: GraphQLCodeGen.ID(lineId),
            quantity: GraphQLNullable<Int>(integerLiteral: quantity)
        )

        let mutation = GraphQLCodeGen.UpdateCartLineMutation(
            cartId: GraphQLCodeGen.ID(cartId),
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


    func getCart(cartId: String, completion: @escaping (Result<GraphQLCodeGen.GetCartQuery.Data.Cart, Error>) -> Void) {
        let query = GraphQLCodeGen.GetCartQuery(cartId: GraphQLCodeGen.ID(cartId))
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
    
    }
    
  
  
    
    
    


