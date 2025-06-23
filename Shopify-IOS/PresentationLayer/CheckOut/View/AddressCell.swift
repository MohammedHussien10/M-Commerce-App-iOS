//
//  AddressCell.swift
//  Shopify-IOS
//
//  Created by Noha Ali Gomaa on 23/06/2025.
//

import SwiftUI

struct AddressCell: View {
    var body: some View {
    
        HStack(alignment: .center, spacing: 8) {
                // Product Image
//            AsyncImage(url: URL(string: product.imageURL)) { image in
//                image
//                    .resizable()
//                    .aspectRatio(contentMode: .fill)
//            } placeholder: {
//                Color.gray.opacity(0.3)
//            }
//            .frame(width: 80, height: 80)
//            .cornerRadius(12)
          

            // Product Info
            VStack(alignment: .leading, spacing: 12) {
//                let parts = product.title.split(separator: "|")
                Text("Address")
                    .font(.system(size: 16))
                    .foregroundColor(.black)
                Divider()
                Text("Detials")
                    .font(.custom(Constants.AppFont.regularFont, size: 11))
                    .foregroundColor(.gray)
                    .padding(.horizontal, 5)


                Spacer()
            }
        }
        .padding()
        .frame(width: 250 ,height: 180)
        .cornerRadius(25)
        .overlay(
            RoundedRectangle(cornerRadius: 25)
                .stroke(Color.orange, lineWidth: 1.5) // Orange border
        )
       
    }
}

#Preview {
    AddressCell()
}
