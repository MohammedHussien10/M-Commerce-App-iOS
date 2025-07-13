//
//  themeColor.swift
//  Shopify-IOS
//
//  Created by Macos on 13/07/2025.
//

import Foundation

import SwiftUI

extension Color {
    static var forBackground: Color {
        Color(UIColor { traitCollection in
            traitCollection.userInterfaceStyle == .dark
            ? UIColor(red: 28/255, green: 28/255, blue: 30/255, alpha: 1) // Dark gray
            : .white
        })
    }

    static var forText: Color {
        Color(UIColor { traitCollection in
            traitCollection.userInterfaceStyle == .dark
            ? .white
            : .black
        })
    }
    
    static var forToggleButtonBackground: Color {
        Color(UIColor { trait in
            trait.userInterfaceStyle == .dark
            ? UIColor.white.withAlphaComponent(0.1)
            : UIColor.orange.withAlphaComponent(0.1)
        })
    }
}
