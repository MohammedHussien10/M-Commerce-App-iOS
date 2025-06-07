//
//  SettingsCell.swift
//  Shopify-IOS
//
//  Created by Macos on 06/06/2025.
//

import SwiftUI

struct SettingsCell: View {
    var nameOfCell: String
    var CellIcon: String
    var dropIcon: String

    var body: some View {
        HStack {
            Image(systemName: CellIcon)
                .foregroundColor(.black)
            
            Text(nameOfCell)
                .font(.headline)
                .foregroundColor(.primary)

            Spacer()

       

            Image(systemName: dropIcon)
                .foregroundColor(.black)
        }
        .padding()
    }
}

#Preview {
    SettingsCell(nameOfCell: "Addresses", CellIcon: "house", dropIcon: "chevron.down")
    
}

