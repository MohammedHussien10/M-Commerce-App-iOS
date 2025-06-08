//
//  Header.swift
//  Shopify-IOS
//
//  Created by Noha Ali Gomaa on 08/06/2025.
//

import SwiftUI

struct HeaderWithIconAndLogo: View {
    var leftIcon: String = "magnifyingglass"
    var rightIcon: String = "panda"


    var onLeftIconTap: (() -> Void)? = nil
    var onRightIconTap: (() -> Void)? = nil

    var body: some View {
        HStack {
            // Left Icon (e.g. menu)
            Button(action: {
                onLeftIconTap?()
            }) {
                Image(systemName: leftIcon)
                    .resizable()
                    .frame(width: 25, height: 25)
                    .foregroundColor(Constants.AppColor.primaryColor)
            }

            Spacer()
            HStack{
                // Logo (center)
                Text("Gen")
                      .font(.title2)
                      .foregroundColor(Constants.AppColor.primaryColor)
                      .bold()
                Image("genie")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
                Text("ie")
                      .font(.title2)
                      .foregroundColor(Constants.AppColor.primaryColor)
                      .bold()
            }
            Spacer()

            // Right Icon (e.g. cart)
            Button(action: {
                onRightIconTap?()
            }) {
                Image(rightIcon)
                    .resizable()
                    .frame(width: 35, height: 35)
//                    .foregroundColor(Constants.AppColor.primaryColor)
            }
        }
        .frame(height: 40)
        .background(Color.white.shadow(radius: 2))
    }
}
