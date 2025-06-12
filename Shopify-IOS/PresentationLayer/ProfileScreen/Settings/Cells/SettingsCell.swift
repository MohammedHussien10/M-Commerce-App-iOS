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
                .foregroundColor(.black)
            
            Text(nameOfCell)
                .font(.headline)                .foregroundColor(.primary)
            Spacer()
            if let trailingText = trailingText {
                            Text(trailingText)
                                .foregroundColor(.gray)
                        }
            
            if !dropIcon.isEmpty {
                Image(systemName: dropIcon)
                    .foregroundColor(.black)
            }
        }
        .padding()
    }
}

//#Preview {
//    SettingsCell(nameOfCell: "Addresses", CellIcon: "house", dropIcon: "chevron.down")
//    
//}

