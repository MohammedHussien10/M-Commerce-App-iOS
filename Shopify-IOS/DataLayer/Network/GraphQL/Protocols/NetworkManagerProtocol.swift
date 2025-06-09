//
//  Untitled.swift
//  Shopify-IOS
//
//  Created by Noha Ali Gomaa on 07/06/2025.
//

import Apollo

protocol NetworkManagerProtocol {
    func queryGraphQLRequest<T: GraphQLQuery>(
        query: T,
        completion: @escaping (Result<T.Data, Error>) -> Void
    )

    func performGraphQLRequest<T: GraphQLMutation>(
        mutation: T,
        completion: @escaping (Result<T.Data, Error>) -> Void
    )
}

