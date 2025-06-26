//
//  RootView.swift
//  Shopify-IOS
//
//  Created by Aya Emam on 20/06/2025.
//
import Foundation
import SwiftUI

struct RootView: View {
    @State private var showSplash = true
    @StateObject var authViewModel = AuthViewModel()
    
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()

            if showSplash {
                SplashScreenView {
                    withAnimation {
                        showSplash = false
                    }
                }
            } else {
                NavigationStack {
                    if authViewModel.isLoggedIn {
                        ViewsContainer(authViewModel: authViewModel)
                    } else {
                        LoginView(authViewModel: authViewModel)
                    }
                }
            }
        }
    }
}

