//
//  NetworkInterceptorProvider.swift
//  EasyBuy
//
//  Created by Macos on 02/06/2023.
//

import Apollo
import Foundation

struct NetworkInterceptorProvider: InterceptorProvider {
    private let store: ApolloStore
    private let client: URLSessionClient
    private let requestType: RequestType
    
    init(store: ApolloStore, client: URLSessionClient, requestType: RequestType) {
        self.store = store
        self.client = client
        self.requestType = requestType
    }
    
    func interceptors<Operation: GraphQLOperation>(for operation: Operation) -> [ApolloInterceptor] {
        [
            CacheReadInterceptor(store: store),
            TokenInterceptor(token: tokenForRequestType(), requestType: requestType),
            NetworkFetchInterceptor(client: client),
            ResponseCodeInterceptor(),
            JSONResponseParsingInterceptor(),
            AutomaticPersistedQueryInterceptor(),
            CacheWriteInterceptor(store: store)
        ]
    }
    
    private func tokenForRequestType() -> String? {
        switch requestType {
        case .admin:
            return NetworkConstants.valueAccessTokenAdmin
        case .storeFront:
            return NetworkConstants.valueStoreFrontAccessToken
        }
    }
}
