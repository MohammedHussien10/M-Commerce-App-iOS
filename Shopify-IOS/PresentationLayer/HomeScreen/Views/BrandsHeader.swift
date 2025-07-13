//
//  BrandsHeader.swift
//  Shopify-IOS
//
//  Created by Noha Ali Gomaa on 15/06/2025.
//

import SwiftUI

struct BrandsHeader: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Brands")
                    .font(.custom(Constants.AppFont.boldFont, size: UIScreen.main.bounds.width * 0.065))
                    .padding(.bottom, -1)
                    .foregroundColor(Color.forText)
                    .bold()
                Text("Top picks for you")
                    .font(.custom(Constants.AppFont.boldFont, size: UIScreen.main.bounds.width * 0.04))
                    .foregroundColor(Color.gray)
            }
            Spacer()
            Image("brand")
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
        }.background(Color.forBackground)
    }
}

#Preview {
    BrandsHeader().environment(\.colorScheme, .dark)
}
