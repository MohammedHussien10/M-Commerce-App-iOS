//
//  Currency.swift
//  Shopify-IOS
//
//  Created by Noha Ali Gomaa on 24/06/2025.
//

import Foundation

// MARK: - String Currency Formatting Extension
extension String {
    
    /// Formats a string containing a number as currency using stored or provided currency
    func formatAsCurrency(
        currencyCode: String? = nil,
        locale: Locale? = nil
    ) -> String {
        let currency = currencyCode ?? CurrencyHelper.currentCurrency
        let usedLocale = locale ?? Locale(identifier: Locale.identifierForCurrencyCode(currency))
        
        guard let number = Double(self) else {
            return self
        }
        
        return number.formatAsCurrency(currencyCode: currency, locale: usedLocale)
    }
    
    /// Formats a string as currency with custom symbol
    func formatAsCurrency(
        symbol: String,
        position: CurrencySymbolPosition = .prefix
    ) -> String {
        guard let number = Double(self) else {
            return self
        }
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        formatter.groupingSeparator = ","
        formatter.decimalSeparator = "."
        
        guard let formattedNumber = formatter.string(from: NSNumber(value: number)) else {
            return self
        }
        
        switch position {
        case .prefix:
            return "\(symbol)\(formattedNumber)"
        case .suffix:
            return "\(formattedNumber) \(symbol)"
        }
    }
    
    /// Removes currency formatting and returns a clean numeric string
    func removeCurrencyFormatting() -> String {
        let symbols = CurrencyHelper.currencySymbols.values + ["$", "€", "£", "¥", ",", " "]
        var cleanString = self
        for symbol in symbols {
            cleanString = cleanString.replacingOccurrences(of: symbol, with: "")
        }
        return cleanString.trimmingCharacters(in: .whitespaces)
    }
}

// MARK: - Double Currency Formatting Extension
extension Double {
    
    /// Formats a Double as currency using currency code and locale
    func formatAsCurrency(
        currencyCode: String = CurrencyHelper.currentCurrency,
        locale: Locale = Locale(identifier: Locale.identifierForCurrencyCode(CurrencyHelper.currentCurrency))
    ) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = currencyCode
        formatter.locale = Locale(identifier: Locale.identifierForCurrencyCode(currencyCode))
        return formatter.string(from: NSNumber(value: self)) ?? "\(self)"
    }
    
    /// Formats using the stored currency in UserDefaults
    func formatAsCurrency() -> String {
        formatAsCurrency(currencyCode: CurrencyHelper.currentCurrency)
    }
    
    /// Formats a Double with custom symbol and position
    func formatAsCurrency(
        symbol: String,
        position: CurrencySymbolPosition = .prefix
    ) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        formatter.groupingSeparator = ","
        formatter.decimalSeparator = "."
        
        guard let formattedNumber = formatter.string(from: NSNumber(value: self)) else {
            return "\(self)"
        }
        
        switch position {
        case .prefix:
            return "\(symbol)\(formattedNumber)"
        case .suffix:
            return "\(formattedNumber) \(symbol)"
        }
    }
}

// MARK: - Int Currency Formatting Extension
extension Int {
    
    func formatAsCurrency(
        currencyCode: String = CurrencyHelper.currentCurrency,
        locale: Locale = Locale(identifier: Locale.identifierForCurrencyCode(CurrencyHelper.currentCurrency))
    ) -> String {
        return Double(self).formatAsCurrency(currencyCode: currencyCode, locale: locale)
    }
    
    func formatAsCurrency() -> String {
        return Double(self).formatAsCurrency(currencyCode: CurrencyHelper.currentCurrency)
    }
}

// MARK: - Supporting Types
enum CurrencySymbolPosition {
    case prefix
    case suffix
}

// MARK: - Currency Helper
struct CurrencyHelper {
    
    static var currentCurrency: String {
        return UserDefaults.standard.string(forKey: "selectedCurrency") ?? "USD"
    }
    
    static func setCurrency(_ currency: String) {
        UserDefaults.standard.set(currency, forKey: "selectedCurrency")
    }
    
    static let currencySymbols: [String: String] = [
        "USD": "$", "EUR": "€", "GBP": "£", "JPY": "¥",
        "CAD": "C$", "AUD": "A$", "CHF": "Fr", "CNY": "¥",
        "INR": "₹", "KRW": "₩", "MXN": "$", "BRL": "R$",
        "RUB": "₽", "ZAR": "R", "SGD": "S$", "HKD": "HK$",
        "SEK": "kr", "NOK": "kr", "DKK": "kr", "PLN": "zł",
        "CZK": "Kč", "HUF": "Ft", "ILS": "₪", "CLP": "$",
        "PHP": "₱", "AED": "د.إ", "SAR": "﷼", "THB": "฿",
        "EGP": "£"
    ]
    
    static func symbol(for currencyCode: String) -> String {
        return currencySymbols[currencyCode] ?? currencyCode
    }
}

// MARK: - Locale Helper
extension Locale {
    
    static func identifierForCurrencyCode(_ currencyCode: String) -> String {
        switch currencyCode {
        case "USD": return "en_US"
        case "EUR": return "de_DE"
        case "GBP": return "en_GB"
        case "JPY": return "ja_JP"
        case "CAD": return "en_CA"
        case "AUD": return "en_AU"
        case "CHF": return "de_CH"
        case "CNY": return "zh_CN"
        case "INR": return "en_IN"
        case "KRW": return "ko_KR"
        case "MXN": return "es_MX"
        case "BRL": return "pt_BR"
        case "RUB": return "ru_RU"
        case "ZAR": return "en_ZA"
        case "SGD": return "en_SG"
        case "HKD": return "zh_HK"
        case "SEK": return "sv_SE"
        case "NOK": return "nb_NO"
        case "DKK": return "da_DK"
        case "PLN": return "pl_PL"
        case "CZK": return "cs_CZ"
        case "HUF": return "hu_HU"
        case "ILS": return "he_IL"
        case "CLP": return "es_CL"
        case "PHP": return "en_PH"
        case "AED": return "ar_AE"
        case "SAR": return "ar_SA"
        case "THB": return "th_TH"
        case "EGP": return "ar_EG"
        default: return Locale.current.identifier
        }
    }
}
