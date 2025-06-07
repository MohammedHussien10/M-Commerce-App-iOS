//
//  Settings.swift
//  Shopify-IOS
//
//  Created by Macos on 06/06/2025.
//

import SwiftUI

struct SettingsScreen: View {
    var body: some View {
        NavigationStack{
            ScrollView {
                VStack {
                    Spacer().frame(height: 30)
                    SettingsCell(nameOfCell: "Addresses", CellIcon: "house", dropIcon: "chevron.down")
                    Divider()
                    SettingsCell(nameOfCell: "Currency", CellIcon: "dollarsign", dropIcon: "chevron.down")
                    Divider()
                    SettingsCell(nameOfCell: "Contact Us", CellIcon: "phone", dropIcon: "chevron.down")
                    Divider()
                    SettingsCell(nameOfCell: "About Us", CellIcon: "info.circle", dropIcon: "chevron.down")
                }
                .padding()
            }.navigationTitle("Settings")
        }
    }
}

#Preview {
    SettingsScreen()
}
