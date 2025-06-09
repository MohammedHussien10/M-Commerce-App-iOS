//
//  ContactUsRow.swift
//  Shopify-IOS
//
//  Created by Macos on 07/06/2025.
//

import SwiftUI

struct ContactUsRow: View {
    let icon: String
        let title: String
        let subtitle: String
        
        var body: some View {
            HStack(alignment: .top, spacing: 12) {
                Image(systemName: icon)
                    .font(.system(size: 22))
                    .foregroundColor(Color.orangeColor("#FF7F00"))
                    .frame(width: 30)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(title)
                        .font(.headline)
                    Text(subtitle)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
        }
}

//#Preview {
//    ContactUsRow(icon: "envelope", title: "Email", subtitle: "MNAShop@2025@gmail.com")
//}
