//
//  File.swift
//  Shopify-IOS
//
//  Created by Macos on 12/06/2025.
//

import Foundation

extension Double {
    func formattedPrice(with currency: String, maxFractionDigits: Int = 2) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = maxFractionDigits
        formatter.maximumFractionDigits = maxFractionDigits

        if let formatted = formatter.string(from: NSNumber(value: self)) {
            return "\(currency) \(formatted)"
        }

        return "\(currency) \(self)"
    }
}
