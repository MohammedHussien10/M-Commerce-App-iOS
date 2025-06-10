//
//  ProfileViewModel.swift
//  Shopify-IOS
//
//  Created by Macos on 10/06/2025.
//

import Foundation

class ProfileViewModel: ObservableObject {
    @Published var personName: String = ""
    @Published var personEmail: String = ""
    @Published var personImageURL: String = ""
    @Published var orders: [Order] = []
    func fetchUserData() {
//        
//            self.personName = user.displayName ?? "default name"
//            self.personEmail = user.email ?? "default email"
//            self.personImageURL = user.photoURL?.absoluteString ?? "profileAvatar"
//        
    }
    
    
    func fetchOrders() {
        self.orders = [
            Order(id: "1", name: "Order 1"),
            Order(id: "2", name: "Order 2"),
            Order(id: "3", name: "Order 3"),
            Order(id: "4", name: "Order 4"),
            Order(id: "5", name: "Order 5")
        ]
    }
    
  
}
struct Order: Identifiable {
    let id: String
    var name: String
}
