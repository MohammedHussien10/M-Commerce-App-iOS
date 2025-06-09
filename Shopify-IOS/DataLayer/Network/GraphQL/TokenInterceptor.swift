//
//  TokenInterceptor.swift
//  Shopify-IOS
//
//  Created by Noha Ali Gomaa on 07/06/2025.
//

import Apollo
import Foundation

struct TokenInterceptor: ApolloInterceptor {
    var id: String
    private let token: String?
    private let requestType: RequestType
    
    init(id: String = UUID().uuidString, token: String?, requestType: RequestType) {
        self.token = token
        self.requestType = requestType
        self.id = id
    }
    
    enum TokenError: Error {
        case noToken
    }
    
    private func addTokenAndProceed<Operation: GraphQLOperation>(
        token: String,
        to request: HTTPRequest<Operation>,
        chain: RequestChain,
        response: HTTPResponse<Operation>?,
        completion: @escaping (Result<GraphQLResult<Operation.Data>, Error>) -> Void) {
            
            switch requestType {
            case .admin:
                request.addHeader(name: NetworkConstants.keyAccessTokenAdmin, value: token)
            case .storeFront:
                request.addHeader(name: NetworkConstants.keyStoreFrontAccessToken, value: token)
            }
            
            request.addHeader(name: NetworkConstants.keyContentType, value: NetworkConstants.valueContentType)
            chain.proceedAsync(request: request, response: response, interceptor: self, completion: completion)
        }
    
    func interceptAsync<Operation: GraphQLOperation>(
        chain: RequestChain,
        request: HTTPRequest<Operation>,
        response: HTTPResponse<Operation>?,
        completion: @escaping (Result<GraphQLResult<Operation.Data>, Error>) -> Void) {
            
            guard let token = token else {
                chain.handleErrorAsync(TokenError.noToken, request: request, response: response, completion: completion)
                return
            }
            
            addTokenAndProceed(token: token, to: request, chain: chain, response: response, completion: completion)
        }
}
