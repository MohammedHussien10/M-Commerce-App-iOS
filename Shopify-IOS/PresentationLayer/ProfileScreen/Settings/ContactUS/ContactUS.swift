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
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                CustomTextFields(placeholder: "Name", text: $name)
                CustomTextFields(placeholder: "Email address", text: $email)
                CustomTextFields(placeholder: "Message", text: $message)

                Button(action: {
                    // Send action
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
                    ContactUsRow(icon: "envelope.fill", title: "Email", subtitle: "genieStore2025@gmail.com")
                    ContactUsRow(icon: "map.fill", title: "Location", subtitle: "Ismailia, Egypt")
                }
                .padding(.top, 70)
            }
            .padding()
        }
        .background(Color.forBackground)
        .navigationBarBackButtonHidden(true)
        .toolbarBackground(Color.forBackground, for: .navigationBar)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Contact Us")
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
    ContactUS()
}

struct CustomTextFields: View {
    var placeholder: String
    @Binding var text: String

    var body: some View {
        TextField(placeholder, text: $text)
            .padding(12)
            .background(Color.forBackground.opacity(0.2))
            .cornerRadius(10)
            .foregroundColor(.forText)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray.opacity(0.3), lineWidth: 1)
            )
    }
}
