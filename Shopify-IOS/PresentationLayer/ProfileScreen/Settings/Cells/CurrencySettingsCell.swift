//
//  File.swift
//  Shopify-IOS
//
//  Created by Macos on 12/06/2025.
//

import Foundation
import SwiftUI

struct import SwiftUI

struct CurrencySettingsCell: View {
    var nameOfCell: String
    var CellIcon: String
    var dropIcon: String
    var currency: CurrencyOfProduct

    var body: some View {
        HStack {
            Image(systemName: CellIcon)
                .foregroundColor(.black)

            Text(nameOfCell)
                .font(.headline)
                .foregroundColor(.primary)

            Spacer()

            Text(currency.rawValue)
                .foregroundColor(.gray)

            if !dropIcon.isEmpty {
                Image(systemName: dropIcon)
                    .foregroundColor(.black)
            }
        }
        .padding()
    }
}
: View {
    var nameOfCell: String
    var CellIcon: String
    var dropIcon: String
    var currency: CurrencyOfProduct

    var body: some View {
        HStack {
            Image(systemName: CellIcon)
                .foregroundColor(.black)

            Text(nameOfCell)
                .font(.headline)
                .foregroundColor(.primary)

            Spacer()

            Text(currency.rawValue)
                .foregroundColor(.gray)

            if !dropIcon.isEmpty {
                Image(systemName: dropIcon)
                    .foregroundColor(.black)
            }
        }
        .padding()
    }
}
