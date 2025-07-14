//
//  OrderCart.swift
//  Shopify-IOS
//
//  Created by Noha Ali Gomaa on 24/06/2025.
//

import SwiftUI

struct OrderCard: View {
    let order : Order
    let exchangeRate: Double
    let currency: String
    
    var body: some View {
        HStack(spacing: 12) {
            // Static Image
            Image(systemName: "cart.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 100)
                .padding(8)
                .background(Color.orange.opacity(0.2))
                .cornerRadius(10)
            
            // Order Info
            VStack(alignment: .leading, spacing: 4) {
                Text(order.name)
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(.primary)
                
                if let amount = order.totalPriceSet?.presentmentMoney.amount {
                    let convertedAmount = amount * exchangeRate
                    Text("Total: \(convertedAmount.priceFormatter(with: currency))")
                        .font(.custom(Constants.AppFont.regularFont, size: 14))
                        .foregroundColor(.secondary)
                } else {
                    Text("Total: N/A")
                        .font(.custom(Constants.AppFont.regularFont, size: 14))
                        .foregroundColor(.gray)
                }
                
                Text("Order ID: \(order.id)")
                    .font(.custom(Constants.AppFont.regularFont, size: 12))
                    .foregroundColor(.secondary)
                
                
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding()
        .frame(width: 200, height: 150)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(UIColor.systemBackground))
                .shadow(color: Color.black.opacity(0.05), radius: 4, x: 0, y: 2)
        )
        .cornerRadius(20)
        .overlay(
                 RoundedRectangle(cornerRadius: 16)
                     .stroke(Color.orange, lineWidth: 1)
             )
    }
}
