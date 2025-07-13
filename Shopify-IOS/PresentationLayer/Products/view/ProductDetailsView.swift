//
//  ProductDetailsView.swift
//  Shopify-IOS
//
//  Created by Noha Ali Gomaa on 08/06/2025.
//

import SwiftUI

struct ProductDetailsView: View {
    @ObservedObject var viewModel: ProductDetailsViewModel
    @EnvironmentObject var cartViewModel: CartViewModel
    @ObservedObject var authViewModel: AuthViewModel
    @Binding var isTabBarHidden: Bool
    @Environment(\.dismiss) private var dismiss
    @State private var showAuthAlert = false
    @State private var authAlertMessage = ""
    @State private var showLogin = false
    @State private var showSignUp = false
    
    var body: some View {
        ScrollView {
            if viewModel.isLoading {
                ProgressView("Loading product details...")
                    .foregroundColor(Color.forText)
            } else if let error = viewModel.errorMessage {
                Spacer()
                Text("Error: \(error)")
                    .foregroundColor(.red)
                    .multilineTextAlignment(.center)
                    .padding()
                Spacer()
            } else {
                VStack(alignment: .leading, spacing: 20) {
                    Section1(viewModel: viewModel)
                    Section3(viewModel: viewModel, authViewModel: authViewModel   )
                }.padding(.bottom, 100)
            }
        }
        .background(Color.forBackground.ignoresSafeArea()) 
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .onAppear {
            if authViewModel.isLoggedIn {
                viewModel.checkFavoriteStatus()
            }
        }
        .toolbar{
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    dismiss()
                }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.orange)
                        .font(.system(size: 18, weight: .bold))
                }
            }
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                Button(action: {
                    if authViewModel.isLoggedIn {
                        viewModel.toggleFavorite()
                    } else {
                        authAlertMessage = "To use Wishlist, please sign in or create an account for the best experience."
                        showAuthAlert = true
                    }
                }) {
                    Image(systemName: authViewModel.isLoggedIn && viewModel.isFavorited ? "heart.fill" : "heart")
                        .foregroundColor(Color.orangeColor("FF7F00"))
                }
            }
        }
        .alert("Sign In Required", isPresented: $showAuthAlert) {
            Button("Sign In") {
                showLogin = true
            }
            Button("Create Account") {
                showSignUp = true
            }
            Button("Cancel", role: .cancel) { }
        } message: {
            Text(authAlertMessage)
        }
        .navigationDestination(isPresented: $showLogin) {
            LoginView(authViewModel: authViewModel)
        }
        .navigationDestination(isPresented: $showSignUp) {
            SignUpView(authViewModel: authViewModel)
        }
    }
}
