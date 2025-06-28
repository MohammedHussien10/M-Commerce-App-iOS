//
//  GuestModePromptView.swift
//  Shopify-IOS
//
//  Created by Aya Emam on 28/06/2025.
//
import SwiftUI

struct GuestModePromptView: View {
    let feature: String
    let icon: String
    @ObservedObject var authViewModel: AuthViewModel
    let onBack: () -> Void
    @State private var showLoginSheet = false
    @State private var showSignUpSheet = false
    
    var body: some View {
        VStack(spacing: 30) {
            Spacer()
            
            Image(systemName: icon)
                .font(.system(size: 80))
                .foregroundColor(.orange.opacity(0.7))
            
            VStack(spacing: 16) {
                Text("Sign In Required")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                
                Text("To use \(feature), please sign in or create an account for the best experience.")
                    .font(.body)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 32)
            }
            
            VStack(spacing: 16) {
                Button(action: {
                    showLoginSheet = true
                }) {
                    Text("Sign In")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.orange)
                        .cornerRadius(12)
                }
                
                Button(action: {
                    showSignUpSheet = true
                }) {
                    Text("Create Account")
                        .font(.headline)
                        .foregroundColor(.orange)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.orange.opacity(0.1))
                        .cornerRadius(12)
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color.orange, lineWidth: 1)
                        )
                }
                
                Button(action: onBack) {
                    Text("Continue as Guest")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
            }
            .padding(.horizontal, 32)
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.systemBackground))
        .navigationDestination(isPresented: $showLoginSheet) {
            LoginView(authViewModel: authViewModel)
        }
        .navigationDestination(isPresented: $showSignUpSheet) {
            SignUpView(authViewModel: authViewModel)
        }
    }
}
