//
//  NetworkConstants.swift
//  Shopify-IOS
//
//  Created by Noha Ali Gomaa on 07/06/2025.
//

import Foundation

enum NetworkConstants {
    static var baseUrlStoreFront: String {
        guard let config = getNetworkConfigsCofiguration(),
              let baseUrlStoreFront = config["baseUrlStoreFront"] as? String else {
            return ""
        }
        
        return baseUrlStoreFront
    }
    static var baseUrlAdmin: String {
        guard let config = getNetworkConfigsCofiguration(),
              let baseUrlStoreFront = config["baseUrlAdmin"] as? String else {
            return ""
        }
        
        return baseUrlStoreFront
    }
    static var keyStoreFrontAccessToken: String {
        guard let config = getNetworkConfigsCofiguration(),
              let baseUrlStoreFront = config["keyStoreFrontAccessToken"] as? String else {
            return ""
        }
        
        return baseUrlStoreFront
    }
    static var keyAccessTokenAdmin: String {
        guard let config = getNetworkConfigsCofiguration(),
              let baseUrlStoreFront = config["keyAccessTokenAdmin"] as? String else {
            return ""
        }
        
        return baseUrlStoreFront
    }
    static var valueStoreFrontAccessToken: String {
        guard let config = getNetworkConfigsCofiguration(),
              let baseUrlStoreFront = config["valueStoreFrontAccessToken"] as? String else {
            return ""
        }
        
        return baseUrlStoreFront
    }
    static var valueAccessTokenAdmin: String {
        guard let config = getNetworkConfigsCofiguration(),
              let baseUrlStoreFront = config["valueAccessTokenAdmin"] as? String else {
            return ""
        }
        
        return baseUrlStoreFront
    }
    
    static let keyContentType = "Content-Type"
    static let valueContentType = "application/json"
    
    private static func getNetworkConfigsCofiguration() -> [String:Any]? {
        guard let url = Bundle.main.url(forResource: "Configurations", withExtension: "plist"),
              let data = try? Data(contentsOf: url),
              let plist = try? PropertyListSerialization.propertyList(from: data, options: [], format: nil) as? [String: Any] else {
            return nil
        }
        
        return plist
    }
}
