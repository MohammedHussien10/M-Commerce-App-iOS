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
                    .foregroundColor(Color.orange)
                    .frame(width: 30)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(title)
                        .font(.headline)
                        .foregroundColor(.forText)
                    Text(subtitle)
                        .font(.subheadline)
                        .foregroundColor(.forText.opacity(0.7))
                }
            }
        }
}

