//
//  Settings.swift
//  Shopify-IOS
//
//  Created by Macos on 06/06/2025.
//

import SwiftUI

struct SettingsScreen: View {
    
    @State private var selectedCurrency = "USD"
    @State private var showCurrencyPicker = false
    let currencies = ["USD", "EUR", "EGP"]
    var body: some View {
        NavigationStack{
            ScrollView {
                VStack {
                    Spacer().frame(height: 30)
                    SettingsCell(nameOfCell: "Addresses", CellIcon: "house", dropIcon: "chevron.down")
                    
                    Divider()
                    
                    
                    Button(action: {
                        withAnimation {
                            showCurrencyPicker.toggle()
                        }
                    }) {
                        SettingsCell(
                            nameOfCell: "Currency",
                            CellIcon: "dollarsign",
                            dropIcon: "chevron.down",
                            trailingText: selectedCurrency
                        )
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                    if showCurrencyPicker {
                        Picker("Select Currency", selection: $selectedCurrency) {
                            ForEach(currencies, id: \.self) { currency in
                                Text(currency)
                            }
                        }
                        .pickerStyle(WheelPickerStyle()) 
                        .frame(height: 120)
                    }
                    Divider()
                    NavigationLink(destination: ContactUS()) {
                        SettingsCell(nameOfCell: "Contact Us", CellIcon: "phone", dropIcon: "")
                    }
                    Divider()
                    NavigationLink(destination: AboutUs()) {
                        SettingsCell(nameOfCell: "About Us", CellIcon: "info.circle", dropIcon: "")
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
