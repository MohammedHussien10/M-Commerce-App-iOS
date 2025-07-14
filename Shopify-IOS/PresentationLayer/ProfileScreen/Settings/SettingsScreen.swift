//
//  Settings.swift
//  Shopify-IOS
//
//  Created by Macos on 06/06/2025.
//

import SwiftUI

import SwiftUI

struct SettingsScreen: View {
    @StateObject var settingsViewModel = SettingsViewModel()
    @State private var showCurrencyPicker = false
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.forBackground.ignoresSafeArea()
                
                ScrollView {
                    VStack {
                        Spacer().frame(height: 30)
                        
                        NavigationLink(destination: AddressesScreen()) {
                            SettingsCell(nameOfCell: "Addresses", CellIcon: "house", dropIcon: "chevron.right", trailingText: .constant(nil))
                        }
                        Divider().background(Color.gray.opacity(0.3))
                        
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
                                    Text(currency.rawValue)
                                        .foregroundColor(.forText)
                                        .tag(currency)
                                }
                            }
                            .pickerStyle(WheelPickerStyle())
                            .frame(height: 120)
                            .background(Color.forBackground)
                        }
                        
                        Divider().background(Color.gray.opacity(0.3))
                        
                        NavigationLink(destination: ContactUS()) {
                            SettingsCell(nameOfCell: "Contact Us", CellIcon: "phone", dropIcon: "", trailingText: .constant(nil))
                        }
                        Divider().background(Color.gray.opacity(0.3))
                        
                        NavigationLink(destination: AboutUs()) {
                            SettingsCell(nameOfCell: "About Us", CellIcon: "info.circle", dropIcon: "", trailingText: .constant(nil))
                        }
                    }
                    .padding()
                }
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(Color.forBackground, for: .navigationBar)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Settings")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.orange)
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.orange)
                            .font(.system(size: 18, weight: .bold))
                    }
                }
            }
        }
    }
}



#Preview {
    SettingsScreen()
}
