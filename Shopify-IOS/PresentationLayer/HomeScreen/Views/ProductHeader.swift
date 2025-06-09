//
//  ProductHeader.swift
//  Shopify-IOS
//
//  Created by Noha Ali Gomaa on 08/06/2025.
//

import SwiftUI

struct ProductHeader: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Trending")
                    .font(.custom(Constants.AppFont.boldFont, size: UIScreen.main.bounds.width * 0.06))
                    .padding(.bottom, -1)
                Text("You have never seen it before")
                    .font(.custom(Constants.AppFont.boldFont, size: UIScreen.main.bounds.width * 0.04))
                    .foregroundColor(.gray)
            }
            Spacer()
            Image("fire")
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
        }
    }
}

#Preview {
    ProductHeader()
}
