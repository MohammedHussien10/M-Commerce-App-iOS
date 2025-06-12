//
//  SettingsViewModel.swift
//  Shopify-IOS
//
//  Created by Macos on 12/06/2025.
//

import Foundation
class SettingsViewModel: ObservableObject {
    @Published var selectedCurrency: CurrencyOfProduct {
        didSet {
            UserDefaults.standard.set(selectedCurrency.rawValue, forKey: "selectedCurrency")
        }
    }

    init() {
        let saved = UserDefaults.standard.string(forKey: "selectedCurrency")
        selectedCurrency = CurrencyOfProduct(rawValue: saved ?? "USD") ?? .USD
    }
}
