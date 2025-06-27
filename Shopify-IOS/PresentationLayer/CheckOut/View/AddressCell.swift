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

            Text("Address: \(address.address1)")
                .font(.subheadline)

            Text("City: \(address.city)")
                .font(.subheadline)

            Text("Country: \(address.country)")
                .font(.subheadline)

            Text("Phone: \(address.phone)")
                .font(.subheadline)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(15)
        .shadow(radius: 3)
    }
}
