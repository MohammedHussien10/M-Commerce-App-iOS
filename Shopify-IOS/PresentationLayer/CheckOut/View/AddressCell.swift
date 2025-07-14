//
//  AddressCell.swift
//  Shopify-IOS
//
//  Created by Noha Ali Gomaa on 23/06/2025.
//

import SwiftUI

struct AddressCell: View {
    let address: AddressModel

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text("\(address.firstName) \(address.lastName)")
                    .font(.headline)
                    .foregroundColor(.forText)
                Spacer()
                if address.isDefault {
                    Text("Default")
                        .font(.caption)
                        .foregroundColor(.white)
                        .padding(6)
                        .background(Color.yellow)
                        .cornerRadius(8)
                }
            }

            Group {
                            Text("Address: \(address.address1)")
                            Text("City: \(address.city)")
                            Text("Country: \(address.country)")
                            Text("Phone: \(address.phone)")
                        }
                        .font(.subheadline)
                        .foregroundColor(.forText)
        }
        .padding()
        .background(Color.forBackground)
        .cornerRadius(15)
        .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
    }
}
