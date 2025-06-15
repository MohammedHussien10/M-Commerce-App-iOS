//
//  Currency.swift
//  Shopify-IOS
//
//  Created by Macos on 12/06/2025.
//

import Foundation

enum CurrencyOfProduct:String,CaseIterable,Identifiable{
    
    var id  : String {rawValue}
    
    case USD,EUR,EGP
    
}
