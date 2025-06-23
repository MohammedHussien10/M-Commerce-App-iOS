//
//  EmailVerificationView.swift
//  Shopify-IOS
//
//  Created by Aya Emam on 19/06/2025.
//
import SwiftUI

struct EmailVerificationView: View {
    @ObservedObject var authViewModel: AuthViewModel
    @State private var navigateToLogin = false

    var body: some View {
        NavigationStack {
            VStack(spacing: 24) {
                Text("✔️").foregroundStyle(.green).font(.largeTitle)
                Text("The verification link sent suscessfully")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                Text("Please check your email and tap the verification link")
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black)
                    .font(.title).bold()
                Button("I Verified My Email") {
                    authViewModel.refreshUserVerificationStatus {
                        navigateToLogin = true
                    }
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.green)
                .foregroundColor(.white)
                .cornerRadius(12)

                NavigationLink(destination: LoginView(authViewModel: authViewModel), isActive: $navigateToLogin) {
                    EmptyView()
                }
            }
            .padding()
            .alert(" ", isPresented: $authViewModel.showAlert) {
                Button("OK", role: .cancel) {}
            } message: {
                Text(authViewModel.alertMessage)
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}

