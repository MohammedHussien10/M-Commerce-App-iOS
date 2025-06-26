//
//  DraftOrderManager.swift
//  Shopify-IOS
//
//  Created by Aya Emam on 24/06/2025.
//

import Foundation
import Apollo
import ApolloAPI
import AdminNameSpace

final class DraftOrderManager {

    static let shared = DraftOrderManager()
    private init() {}

    // MARK: - Fetch all draft orders
    func fetchDraftOrders(completion: @escaping (Result<[DraftOrdersQuery.Data.DraftOrders.Node], Error>) -> Void) {
        NetworkManager.sharedAdmin.queryGraphQLRequest(query: DraftOrdersQuery(first: 100)) { result in
            switch result {
            case .success(let data):
                let orders = data.draftOrders.nodes.compactMap { $0 }
                completion(.success(orders))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }


    // MARK: - Create new draft order
    func createDraftOrder(
        customerEmail: String,
        customerID: String,
        variantID: String,
        retryCount: Int = 1,
        completion: @escaping (Result<AdminNameSpace.DraftOrderCreateMutation.Data.DraftOrderCreate.DraftOrder, Error>) -> Void
    ) {
        print("📦 Sending draft order with:")
        print("CustomerID: \(customerID)")
        print("Email: \(customerEmail)")
        print("VariantID: \(variantID)")

        let lineItemInput = AdminNameSpace.DraftOrderLineItemInput(
            quantity: 1,
            variantId: .some(variantID)
        )

        let input = AdminNameSpace.DraftOrderInput(
            email: .some(customerEmail),
            lineItems: .some([lineItemInput]),
            note: .some(customerID)
        )

        let mutation = AdminNameSpace.DraftOrderCreateMutation(input: input)

        NetworkManager.sharedAdmin.performGraphQLRequest(mutation: mutation) { result in
            switch result {
            case .success(let data):
                if let order = data.draftOrderCreate?.draftOrder {
                    completion(.success(order))
                } else {
                    completion(.failure(NSError(domain: "DraftOrder", code: -1, userInfo: [NSLocalizedDescriptionKey: "No draft order returned"])))
                }

            case .failure(let error):
                if retryCount > 0 {
                    print(" Connection lost. Retrying createDraftOrder... (\(retryCount) left)")
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        self.createDraftOrder(customerEmail: customerEmail, customerID: customerID, variantID: variantID, retryCount: retryCount - 1, completion: completion)
                    }
                } else {
                    completion(.failure(error))
                }
            }
        }
    }


    // MARK: - Update existing draft order (add/remove)
    func updateDraftOrder(
        draftOrderID: String,
        updatedLineItems: [AdminNameSpace.DraftOrderLineItemInput],
        completion: @escaping (Result<AdminNameSpace.DraftOrderUpdateMutation.Data.DraftOrderUpdate.DraftOrder, Error>) -> Void
    ) {
        let input = AdminNameSpace.DraftOrderInput(
            lineItems: .some(updatedLineItems)
        )

        let mutation = AdminNameSpace.DraftOrderUpdateMutation(
            id: draftOrderID,
            input: input
        )

        NetworkManager.sharedAdmin.performGraphQLRequest(mutation: mutation) { result in
            switch result {
            case .success(let data):
                if let order = data.draftOrderUpdate?.draftOrder {
                    completion(.success(order))
                } else {
                    completion(.failure(NSError(domain: "DraftOrder", code: -2, userInfo: [NSLocalizedDescriptionKey: "Failed to update draft order"])))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }


    // MARK: - Delete a draft order
    func deleteDraftOrder(
        draftOrderID: String,
        completion: @escaping (Result<Bool, Error>) -> Void
    ) {
        let input = DraftOrderDeleteInput(id: draftOrderID)
        let mutation = DraftOrderDeleteMutation(input: input)

        NetworkManager.sharedAdmin.performGraphQLRequest(mutation: mutation) { result in
            switch result {
            case .success(let data):
                if data.draftOrderDelete?.deletedId != nil {
                    completion(.success(true))
                } else {
                    completion(.failure(NSError(domain: "DraftOrder", code: -3, userInfo: [NSLocalizedDescriptionKey: "Failed to delete draft order"])))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
