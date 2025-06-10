//
//  AboutUs.swift
//  Shopify-IOS
//
//  Created by Macos on 07/06/2025.
//

import SwiftUI

struct AboutUs: View {
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
                       
                       Text("Genie Store is your go-to app for all your shopping needs and We provide a seamless and secure experience for finding the best deals on your favorite products.")
                           .font(.body)
                           .foregroundColor(.secondary)
                       
                       
                       Divider()
                       
                       VStack(alignment: .leading, spacing: 10) {
                           Text("Developers :")
                               .font(.title2)
                               .fontWeight(.semibold)
                           
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
                       }
                       
                       Divider()
                       
                       Text("App Version 1.0.0")
                           .font(.footnote)
                           .foregroundColor(.gray)
                           .padding(.bottom)
                       
                   }
                   .padding()
               }
               .navigationTitle("About Us")
           }
}

#Preview {
    AboutUs()
}
