//
//  ProfileViewModel.swift
//  Shopify-IOS
//
//  Created by Macos on 10/06/2025.
//

import Foundation
import AdminNameSpace

class ProfileViewModel: ObservableObject {
    @Published var personImageURL: String = ""
    @Published var orders: [Order] = []
    let token = UserDefaults.standard.string(forKey: "ShopifyAccessToken")
    let name = UserDefaults.standard.string(forKey: "CustomerFullName") ?? "Guest"
    let email = UserDefaults.standard.string(forKey:  "CurrentCustomerEmail") ?? "Guest@guest.com"
    func fetchUserData() {
        
//            self.personName = user.displayName ?? "default name"
//            self.personEmail = user.email ?? "default email"
//            self.personImageURL = user.photoURL?.absoluteString ?? "profileAvatar"
        
    }
    
    
    func fetchOrders() {
        guard let email = UserDefaults.standard.string(forKey: "CustomerEmail") else {
            return
        }
        let query = AdminNameSpace.GetOrdersQuery(first: 100, query: GraphQLNullable.some("email:\(email)"))
        NetworkManager.sharedAdmin.queryGraphQLRequest(query: query) { result in
            switch result {
            case .success(let success):
                self.orders = success.orders.edges.map { order in
                    Order(
                        id: order.node.id,
                        name: order.node.name,
                        phone: order.node.phone,
                        createdAt: order.node.createdAt,
                        displayFinancialStatus: order.node.displayFinancialStatus?.rawValue,
                        displayFulfillmentStatus: order.node.displayFulfillmentStatus.rawValue,
                        returnStatus: order.node.returnStatus.rawValue,
                        totalPriceSet: order.node.totalPriceSet.toDomain(),
                        billingAddress: order.node.billingAddress?.toDomain()
                    )
                }
            case .failure(let error):
                print("error : \(error.localizedDescription)")
            }
        }
    }
}
