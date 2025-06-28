//
//  AuthenticationChoiceView.swift
//  Shopify-IOS
//
//  Created by Aya Emam on 28/06/2025.
//
import SwiftUI

struct AuthenticationChoiceView: View {
    @ObservedObject var authViewModel: AuthViewModel
    
    var body: some View {
        VStack(spacing: 30) {
            Spacer()
            
            VStack(spacing: 20) {
                Image("genie")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                
                Text("Welcome to Our Store")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                
                Text("Sign in for the best shopping experience with personalized features")
                    .font(.body)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
            }
            
            Spacer()
            
            VStack(spacing: 15) {
                NavigationLink(destination: LoginView(authViewModel: authViewModel)) {
                    Text("Sign In")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.orange)
                        .cornerRadius(10)
                }
                
                NavigationLink(destination: SignUpView(authViewModel: authViewModel)) {
                    Text("Create Account")
                        .font(.headline)
                        .foregroundColor(.orange)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.orange, lineWidth: 2)
                        )
                }
                
                Button(action: {
                    authViewModel.continueAsGuest()
                }) {
                    Text("Continue as Guest")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .underline()
                }
                .padding(.top, 10)
            }
            .padding(.horizontal, 30)
            
            Spacer()
            
        }
        .navigationBarHidden(true)
    }
}
