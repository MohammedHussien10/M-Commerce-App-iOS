//
//  MockNetworkManager.swift
//  Shopify-IOS
//
//  Created by Noha Ali Gomaa on 25/06/2025.
//


import Apollo
import Foundation
import StoreFrontNameSpace
@testable import Shopify_IOS

final class MockNetworkManager {

    static let sharedStoreFront = MockNetworkManager()

    private var queryResponses: [String: Any] = [:]
    private var mutationResponses: [String: Any] = [:]
    var shouldReturnError: Bool = false
    var customError: Error?

    func resetMock() {
        shouldReturnError = false
        customError = nil
        queryResponses.removeAll()
        mutationResponses.removeAll()
    }

    func setMockQueryResponse<T: SimpleGraphQLQuery>(for queryType: T.Type, response: T.Data) {
        let key = String(describing: queryType)
        queryResponses[key] = response
    }

    func setMockMutationResponse<T: SimpleGraphQLQuery>(for mutationType: T.Type, response: T.Data) {
        let key = String(describing: mutationType)
        mutationResponses[key] = response
    }

    func queryGraphQLRequest<T: SimpleGraphQLQuery>(
        query: T,
        completion: @escaping (Result<T.Data, Error>) -> Void
    ) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            if self.shouldReturnError {
                let error = self.customError ?? NSError(domain: "MockNetworkManager", code: -1, userInfo: nil)
                completion(.failure(error))
                return
            }

            let key = String(describing: T.self)
            if let response = self.queryResponses[key] as? T.Data {
                completion(.success(response))
            } else {
                completion(.failure(NSError(domain: "MockNetworkManager", code: -2, userInfo: [NSLocalizedDescriptionKey: "No mock query response for \(key)"])))
            }
        }
    }

    func performGraphQLRequest<T: SimpleGraphQLQuery>(
        mutation: T,
        completion: @escaping (Result<T.Data, Error>) -> Void
    ) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            if self.shouldReturnError {
                let error = self.customError ?? NSError(domain: "MockNetworkManager", code: -1, userInfo: nil)
                completion(.failure(error))
                return
            }

            let key = String(describing: T.self)
            if let response = self.mutationResponses[key] as? T.Data {
                completion(.success(response))
            } else {
                completion(.failure(NSError(domain: "MockNetworkManager", code: -2, userInfo: [NSLocalizedDescriptionKey: "No mock mutation response for \(key)"])))
            }
        }
    }
}

protocol SimpleGraphQLQuery {
    associatedtype Data
}
struct MockQueryData {
    let id: String
    let name: String
}

struct MockMutationData {
    let success: Bool
    let message: String
}
class MockQuery: SimpleGraphQLQuery {
    typealias Data = MockQueryData
}

class MockMutation: SimpleGraphQLQuery {
    typealias Data = MockMutationData
}


// MARK: - Usage Example
/*
// Example usage in your tests:

// 1. Set up mock data
let mockManager = MockNetworkManager.sharedStoreFront
mockManager.setMockQueryResponse(for: YourQueryType.self, response: mockQueryData)

// 2. Use the mock manager in your tests
mockManager.queryGraphQLRequest(query: yourQuery) { result in
    switch result {
    case .success(let data):
        // Test success case
        print("Success: \(data)")
    case .failure(let error):
        // Test failure case
        print("Error: \(error)")
    }
}

// 3. Test error scenarios
mockManager.setMockError(NSError(domain: "Test", code: 404, userInfo: nil))
mockManager.queryGraphQLRequest(query: yourQuery) { result in
    // This will return the error you set
}

// 4. Reset mock for clean state
mockManager.resetMock()
*/
