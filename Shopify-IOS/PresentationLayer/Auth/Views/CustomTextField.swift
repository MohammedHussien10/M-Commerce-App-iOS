//
//  CustomTextField.swift
//  Shopify-IOS
//
//  Created by Aya Emam on 18/06/2025.
//

import SwiftUI

struct CustomTextField: View {
    var icon: String
    var placeholder: String
    @Binding var text: String
    var isSecure: Bool

    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.gray)
            if isSecure {
                SecureField(placeholder, text: $text)
                    .foregroundColor(.white)
            } else {
                TextField(placeholder, text: $text)
                    .foregroundColor(.white)
            }
        }
        .padding()
        .background(Color(.darkGray).opacity(0.4))
        .cornerRadius(12)
    }
}

