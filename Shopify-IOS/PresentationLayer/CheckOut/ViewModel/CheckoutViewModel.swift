//
//  CheckoutViewModel.swift
//  Shopify-IOS
//
//  Created by Noha Ali Gomaa on 23/06/2025.

//
//import Foundation
//import AdminNameSpace
//import Apollo
//
//
//final class CheckoutViewModel: ObservableObject {
//    
//    // MARK: - Published Properties
//    @Published var draftOrder: DraftOrder?  // Your domain model
//    @Published var isLoading: Bool = false
//    @Published var errorMessage: String?
//    var  customerId = UserDefaults.standard.string(forKey: "CurrentCustomerID")
//    // MARK: - Create Draft Order
//    func createDraftOrder(
//        products : [CartProduct],
//        note: String? = nil,
//        email: String? = nil
//    ) {
//        isLoading = true
//        errorMessage = nil
//
//        let lineItemInputs = products.map { product in
//           InputDict(
//                quantity: String(product.quantity),
//                variantId:  product.Variantid
//            )
//        }
//
//        let draftOrderInput = DraftOrderInput(
//            customerId: customerId,
//            lineItems: lineItemInputs
//        )
//
//        let mutation = DraftOrderCreateMutation(input: draftOrderInput)
//        
//        NetworkManager.sharedAdmin.performGraphQLRequest(mutation: mutation) { [weak self] result in
//            DispatchQueue.main.async {
//                self?.isLoading = false
//                switch result {
//                case .success(let data):
//                    if let gqlDraftOrder = data.draftOrderCreate?.draftOrder {
//                        self?.draftOrder = gqlDraftOrder.toDomain()
//                    } else {
//                        self?.errorMessage = "No draft order returned"
//                    }
//                case .failure(let error):
//                    self?.errorMessage = error.localizedDescription
//                }
//            }
//        }
//    }
//
////    // MARK: - Update Draft Order
////    func updateDraftOrder(
////        draftOrderId: String,
////        input: DraftOrderInput
////    ) {
////        isLoading = true
////        errorMessage = nil
////
////        let mutation = DraftOrderUpdateMutation(id: draftOrderId, input: input)
////
////        NetworkManager.sharedAdmin.performGraphQLRequest(mutation: mutation) { [weak self] result in
////            DispatchQueue.main.async {
////                self?.isLoading = false
////                switch result {
////                case .success(let data):
////                    if let gqlDraftOrder = data.draftOrderUpdate?.draftOrder {
////                        self?.draftOrder = gqlDraftOrder.toDomain()
////                    } else {
////                        self?.errorMessage = "No updated draft order returned"
////                    }
////                case .failure(let error):
////                    self?.errorMessage = error.localizedDescription
////                }
////            }
////        }
////    }
//}
//
