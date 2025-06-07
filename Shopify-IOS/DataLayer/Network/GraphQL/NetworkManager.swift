//
//  NetworkManager.swift
//  Shopify-IOS
//
//  Created by Noha Ali Gomaa on 07/06/2025.
//

import Apollo
import Foundation

final class NetworkManager: NetworkManagerProtocol {
    private let requestType: RequestType
    static var sharedAdmin: NetworkManager = NetworkManager(requestType: .admin)
    static var sharedStoreFront: NetworkManager = NetworkManager(requestType: .storeFront)

    private init(requestType: RequestType) {
        self.requestType = requestType
    }

    private lazy var service: ApolloClient = {
        let store = ApolloStore()
        let client = URLSessionClient()
        let provider = NetworkInterceptorProvider(store: store, client: client, requestType: requestType)
        let url: URL
        
        switch requestType {
        case .admin:
            url = URL(string: NetworkConstants.baseUrlAdmin)!
        case .storeFront:
            url = URL(string: NetworkConstants.baseUrlStoreFront)!
        }

        return ApolloClient(
            networkTransport: RequestChainNetworkTransport(
                interceptorProvider: provider,
                endpointURL: url
            ) ,
            store: store
        )
    }()

    func queryGraphQLRequest<T: GraphQLQuery>(
        query: T,
        completion: @escaping (Result<T.Data, Error>) -> Void
    ) {
        service.fetch(query: query, cachePolicy: .fetchIgnoringCacheData) { result in
            switch result {
            case .success(let graphQLResult):
                if let data = graphQLResult.data {
                    completion(.success(data))
                } else if let error = graphQLResult.errors?.first {
                    completion(.failure(error))
                } else {
                    completion(.failure(NSError(domain: "GraphQL", code: -1, userInfo: [NSLocalizedDescriptionKey: "Unknown error"])))
                }

            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    func performGraphQLRequest<T: GraphQLMutation>(
        mutation: T,
        completion: @escaping (Result<T.Data, Error>) -> Void
    ) {
        service.perform(mutation: mutation) { result in
            switch result {
            case .success(let graphQLResult):
                if let data = graphQLResult.data {
                    completion(.success(data))
                } else if let error = graphQLResult.errors?.first {
                    completion(.failure(error))
                } else {
                    completion(.failure(NSError(domain: "GraphQL", code: -1, userInfo: [NSLocalizedDescriptionKey: "Unknown error"])))
                }

            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}



