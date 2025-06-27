//
//  AppConstant.swift
//  Shopify-IOS
//
//  Created by Noha Ali Gomaa on 08/06/2025.
//
import Foundation
import SwiftUI
struct Constants {
    struct AppColor {
        static let primaryBlack = Color.init("1F1F1F")
        static let secondaryBlack = Color.init("464B5F")
        static let primaryColor = Color.orangeColor("#FF7F00")
        static let secondaryRed = Color.init("EF473A")
    
    }
    
    struct AppFont {
        static let extraBoldFont = "OpenSans-ExtraBold"
        static let boldFont = "OpenSans-Bold"
        static let semiBoldFont = "OpenSans-SemiBold"
        static let regularFont = "OpenSans-Regular"
        static let lightFont = "OpenSans-Light"
    }
}
func getTags(products: [Product])->[String]{
    var tags :[String] = ["men", "women", "kid"]
    products.forEach { Product in
        Product.tags.forEach { Substring in
           tags.append(String(Substring))
        }
    }
    let set = Set(tags)
    tags = Array(set)
   return tags
}

func getType(products: [Product])->[String]{
    let types = products.compactMap { $0.productType }
    return Array(Set(types))
}
let columnSpacing: CGFloat = 10
let rowSpacing: CGFloat = 10
