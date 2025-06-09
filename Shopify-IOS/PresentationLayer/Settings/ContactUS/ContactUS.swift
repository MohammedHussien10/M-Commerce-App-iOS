//
//  ContactUS.swift
//  Shopify-IOS
//
//  Created by Macos on 07/06/2025.
//

import SwiftUI

struct ContactUS: View {
        @State private var name = ""
        @State private var email = ""
        @State private var message = ""
        
        var body: some View {
            ScrollView {
                VStack(spacing: 16) {
                    TextField("Name", text: $name)
                        .textFieldStyle(.roundedBorder)
                    
                    TextField("Email address", text: $email)
                        .textFieldStyle(.roundedBorder)
                        .keyboardType(.emailAddress)
                    
                    TextField("Message", text: $message)
                        .textFieldStyle(.roundedBorder)
                    
                    Button(action: {
                    }) {
                        Text("SEND NOW")
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.orangeColor("FF7F00"))
                            .cornerRadius(8)
                    }
                    .padding(.top, 10)
                    VStack(alignment: .leading, spacing: 20) {
                        ContactUsRow(icon: "phone.fill", title: "Call", subtitle: "17002")
                        ContactUsRow(icon: "envelope.fill", title: "Email", subtitle: "genie2025@gmail.com")
                        ContactUsRow(icon: "map.fill", title: "Location", subtitle: "Ismailia, Egypt")
                    }
                    .padding(.top, 30)
                }
                .padding()
            }
            .navigationTitle("Contact Us")
        }
    }


#Preview {
    ContactUS()
}
