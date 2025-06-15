//
//  Settings.swift
//  Shopify-IOS
//
//  Created by Macos on 06/06/2025.
//

import SwiftUI

struct SettingsScreen: View {
    @StateObject var settingsViewModel = SettingsViewModel()
    @State private var showCurrencyPicker = false
    var body: some View {
        NavigationStack{
            ScrollView {
                VStack {
                    Spacer().frame(height: 30)
                    NavigationLink(destination: AddressesScreen()) {
                        SettingsCell(nameOfCell: "Addresses", CellIcon: "house", dropIcon: "chevron.right", trailingText: .constant(nil))
                    }
                    Divider()
                    
                    
                    Button(action: {
                        withAnimation {
                            showCurrencyPicker.toggle()
                        }
                    }) {
                        CurrencySettingsCell(
                            nameOfCell: "Currency",
                            CellIcon: "dollarsign",
                            dropIcon: "chevron.down",
                            trailingText: settingsViewModel.selectedCurrency
                        )
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                    if showCurrencyPicker {
                        Picker("Select Currency", selection: $settingsViewModel.selectedCurrency) {
                            ForEach(CurrencyOfProduct.allCases) { currency in
                                Text(currency.rawValue).tag(currency)
                            }
                        }
                        .pickerStyle(WheelPickerStyle()) 
                        .frame(height: 120)
                    }
                    Divider()
                    NavigationLink(destination: ContactUS()) {
                        SettingsCell(nameOfCell: "Contact Us", CellIcon: "phone", dropIcon: "", trailingText: .constant(nil))
                    }
                    Divider()
                    NavigationLink(destination: AboutUs()) {
                        SettingsCell(nameOfCell: "About Us", CellIcon: "info.circle", dropIcon: "", trailingText: .constant(nil))
                    }
                }
                .padding()
            }.navigationTitle("Settings")
        }
    }
}

#Preview {
    SettingsScreen()
}
