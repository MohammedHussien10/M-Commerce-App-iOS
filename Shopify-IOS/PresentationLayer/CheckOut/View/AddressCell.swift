//
//  AddressCell.swift
//  Shopify-IOS
//
//  Created by Noha Ali Gomaa on 23/06/2025.
//

import SwiftUI

struct AddressCell: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Shipping Address")
                .font(.system(size: 18, weight: .semibold))
                .foregroundColor(.black)
            
            Divider()

            VStack(alignment: .leading, spacing: 6) {
                HStack {
                    Text("Street:")
                        .font(.custom(Constants.AppFont.regularFont, size: 13))
                        .foregroundColor(.gray)
                    Text("123 Main Street")
                        .font(.system(size: 13))
                }
                
                HStack {
                    Text("Apartment:")
                        .font(.custom(Constants.AppFont.regularFont, size: 13))
                        .foregroundColor(.gray)
                    Text("Apt 4B")
                        .font(.system(size: 13))
                }
                
                HStack {
                    Text("City:")
                        .font(.custom(Constants.AppFont.regularFont, size: 13))
                        .foregroundColor(.gray)
                    Text("Cairo")
                        .font(.system(size: 13))
                }
                
                HStack {
                    Text("State:")
                        .font(.custom(Constants.AppFont.regularFont, size: 13))
                        .foregroundColor(.gray)
                    Text("Giza")
                        .font(.system(size: 13))
                }
            }

            Spacer()
        }
        .padding()
        .frame(width: 250, height: 180)
        .background(Color.white)
        .cornerRadius(25)
        .overlay(
            RoundedRectangle(cornerRadius: 25)
                .stroke(Color.orange, lineWidth: 1.5)
        )
        .shadow(color: .gray.opacity(0.2), radius: 4, x: 0, y: 2)
    }
}

#Preview {
    AddressCell()
}
