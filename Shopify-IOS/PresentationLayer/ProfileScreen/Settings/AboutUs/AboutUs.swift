//
//  AboutUs.swift
//  Shopify-IOS
//
//  Created by Macos on 07/06/2025.
//

import SwiftUI

struct AboutUs: View {
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        ScrollView {
                   VStack(alignment: .leading, spacing: 20) {

                       Image("genie")
                           .resizable()
                           .frame(width: 200, height: 150)
                           .padding(.top)
                       
                       Text("Genie Store")
                           .font(.largeTitle)
                           .fontWeight(.bold)
                           .foregroundColor(.forText)
                       Text("Genie Store is your go-to app for all your shopping needs and We provide a seamless and secure experience for finding the best deals on your favorite products.")
                           .font(.body)
                           .foregroundColor(.forText)
                       
                       Divider().background(Color.gray.opacity(0.3))
                       
                       VStack(alignment: .leading, spacing: 10) {
                           Text("Developers :")
                               .font(.title2)
                               .fontWeight(.semibold)
                               .foregroundColor(.forText)
                           HStack {
                               
                               Image(systemName: "person")
                               Text("Noha Ail")

                           }
                           
                           HStack {
                               Image(systemName: "person")
                               Text("Mohammed Hussien")
                           }
                           
                           HStack {
                               Image(systemName: "person")
                               Text("Aya Elsayed")
                           }
                       }     .foregroundColor(.forText)
                       
                       Divider().background(Color.gray.opacity(0.3))
                       
                       Text("App Version 1.0.0")
                           .font(.footnote)
                           .foregroundColor(.gray)
                           .padding(.bottom)
                       
                   }
                   .padding()
                   .background(Color.forBackground)
               }
        .background(Color.forBackground)
                .navigationBarBackButtonHidden(true)
                .navigationBarTitleDisplayMode(.inline)
                .toolbarBackground(Color.forBackground, for: .navigationBar)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text("About Us")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.orange)
                    }
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(action: {
                            dismiss()
                        }) {
                            Image(systemName: "chevron.left")
                                .foregroundColor(.orange)
                                .font(.system(size: 18, weight: .bold))
                        }
                    }
                }


           }
}

#Preview {
    NavigationStack {
         AboutUs()
     }
     .preferredColorScheme(.dark)
}
