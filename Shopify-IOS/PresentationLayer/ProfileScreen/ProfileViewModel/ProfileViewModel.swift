//
//  ProfileViewModel.swift
//  Shopify-IOS
//
//  Created by Macos on 10/06/2025.
//

import Foundation
import AdminNameSpace

class ProfileViewModel: ObservableObject {
    @Published var personName: String = ""
    @Published var personEmail: String = ""
    @Published var personImageURL: String = ""
//    @Published var orders: [Order] = []
    let token = UserDefaults.standard.string(forKey: "ShopifyAccessToken")
    func fetchUserData() {
//        
//            self.personName = user.displayName ?? "default name"
//            self.personEmail = user.email ?? "default email"
//            self.personImageURL = user.photoURL?.absoluteString ?? "profileAvatar"
//        
    }
    
    
//    func fetchOrders() {
//        let query = AdminNameSpace.GetOrdersQuery(first: 100, query: "email:amirashabana1968@gmail.com")
//        NetworkManager.sharedAdmin.queryGraphQLRequest(query: query) { result in
//            switch result {
//            case .success(let success):
////                self.orders = success.orders.edges.map { order in
//////                    Order(from: <#any Decoder#>, id: order.node.id, name: order.node.name)
////                }
//            case .failure(let error):
//                print("error : \(error.localizedDescription)")
//            }
//        }
//    }
}
