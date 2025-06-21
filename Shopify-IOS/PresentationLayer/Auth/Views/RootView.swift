//
//  RootView.swift
//  Shopify-IOS
//
//  Created by Aya Emam on 20/06/2025.
//
import Foundation
import SwiftUI

struct RootView: View {
    @StateObject var authViewModel = AuthViewModel()
    
    var body: some View {
        NavigationStack {
            if authViewModel.isLoggedIn {
                ViewsContainer(authViewModel: authViewModel)
            } else {
                LoginView(authViewModel: authViewModel)
            }
        }
    }
}

