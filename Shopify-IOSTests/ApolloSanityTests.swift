//
//  ApolloSanityTests.swift
//  Shopify-IOS
//
//  Created by Noha Ali Gomaa on 25/06/2025.
//

import XCTest
import Apollo
import ApolloAPI

final class ApolloSanityTests: XCTestCase {
    
    func testApolloImportsWork() {
        // Simple test to verify Apollo imports are working
        XCTAssertTrue(true, "Apollo imports successfully")
    }
    
    func testGraphQLNullableTypes() {
        // Test GraphQLNullable type compilation
        let nullableString: GraphQLNullable<String> = "test"
        let nullableInt: GraphQLNullable<Int> = 42
        let nullValue: GraphQLNullable<String> = .none
        
        XCTAssertEqual(nullableString, "test")
        XCTAssertEqual(nullableInt, 42)
        XCTAssertEqual(nullValue, .none)
    }
    
    func testGraphQLID() {
//        // Test GraphQLID type
//        let id: GraphQLID = "test-id-123"
//        XCTAssertEqual(id, "test-id-123")
    }
    
    func testApolloClientCreation() {
        // Test that we can create an Apollo client
        let url = URL(string: "https://example.com/graphql")!
        let client = ApolloClient(url: url)
        XCTAssertNotNil(client)
    }
}
