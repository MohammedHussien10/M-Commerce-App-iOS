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
   @Binding var trailingText: String?
    var body: some View {
        HStack {
            Image(systemName: CellIcon)
                .foregroundColor(.forText)
            
            Text(nameOfCell)
                .font(.headline)                .foregroundColor(.forText)
            Spacer()
            if let trailingText = trailingText {
                            Text(trailingText)
                    .foregroundColor(.forText)
                        }
            
            if !dropIcon.isEmpty {
                Image(systemName: dropIcon)
                    .foregroundColor(.forText)
            }
        }
        .padding()
        .background(Color.forBackground)
    }
}

//#Preview {
//    SettingsCell(nameOfCell: "Addresses", CellIcon: "house", dropIcon: "chevron.down")
//    
//}

