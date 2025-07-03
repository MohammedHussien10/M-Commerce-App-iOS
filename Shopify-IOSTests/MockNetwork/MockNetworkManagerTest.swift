
import Apollo
import Foundation
import StoreFrontNameSpace
import XCTest
@testable import Shopify_IOS



final class MockNetworkManagerTests: XCTestCase {

    override func tearDown() {
        MockNetworkManager.sharedStoreFront.resetMock()
        super.tearDown()
    }

    func testPlainMockQueryReturnsData() {
        let expectation = XCTestExpectation(description: "Returns mock query data")

        let mockData = MockQueryData(id: "42", name: "Banana")
        let query = MockQuery()

        MockNetworkManager.sharedStoreFront.setMockQueryResponse(for: MockQuery.self, response: mockData)

        MockNetworkManager.sharedStoreFront.queryGraphQLRequest(query: query) { result in
            switch result {
            case .success(let data):
                XCTAssertEqual(data.id, "42")
                XCTAssertEqual(data.name, "Banana")
                expectation.fulfill()
            case .failure(let error):
                XCTFail("Expected success but got error: \(error)")
            }
        }

        wait(for: [expectation], timeout: 1.0)
    }

    func testPlainMockMutationReturnsData() {
        let expectation = XCTestExpectation(description: "Returns mock mutation data")

        let mutation = MockMutation()
        let mockData = MockMutationData(success: true, message: "Product created!")

        MockNetworkManager.sharedStoreFront.setMockMutationResponse(for: MockMutation.self, response: mockData)

        MockNetworkManager.sharedStoreFront.performGraphQLRequest(mutation: mutation) { result in
            switch result {
            case .success(let data):
                XCTAssertTrue(data.success)
                XCTAssertEqual(data.message, "Product created!")
                expectation.fulfill()
            case .failure(let error):
                XCTFail("Expected success but got error: \(error)")
            }
        }

        wait(for: [expectation], timeout: 1.0)
    }
}

