//
//   class.swift
//  Shopify-IOS
//
//  Created by JETS Mobile Lab7 on 25/06/2025.
//

import Foundation

class SessionManager {
    static let shared = SessionManager()
    
    private init() {}
    
    var accessToken: String {
        return UserDefaults.standard.string(forKey: "ShopifyAccessToken") ?? ""
    }
    
    func saveToken(_ token: String) {
        UserDefaults.standard.set(token, forKey: "ShopifyAccessToken")
    }
    
    func clearToken() {
        UserDefaults.standard.removeObject(forKey: "ShopifyAccessToken")
    }
}
