//
//  ProfileCell.swift
//  Shopify-IOS
//
//  Created by Macos on 10/06/2025.
//

import SwiftUI

struct ProfileCell: View {
    var nameOfCell: String
    var CellIcon: String
    var dropIcon: String
    var trailingText: String? = nil
    var body: some View {
        HStack {
            Image(systemName: CellIcon)
                .foregroundColor(.primary)
            
            Text(nameOfCell)
                .font(.headline) 
                .foregroundColor(.primary)
            Spacer()
            if let trailingText = trailingText {
                            Text(trailingText)
                    .foregroundColor(.secondary)
                        }
            
            if !dropIcon.isEmpty {
                Image(systemName: dropIcon)
                    .foregroundColor(.primary)
            }
        }
        .padding()
        .background(Color.forBackground)
    }
}

//#Preview {
//    ProfileCell()
//}
