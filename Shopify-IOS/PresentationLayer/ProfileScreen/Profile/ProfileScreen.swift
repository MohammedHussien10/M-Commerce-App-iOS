//
//  Profile.swift
//  Shopify-IOS
//
//  Created by Macos on 09/06/2025.
//

import SwiftUI
import Kingfisher
struct ProfileScreen: View {
    @Binding var isTabBarHidden: Bool
    @ObservedObject var authViewModel: AuthViewModel
    @StateObject var profileViewModel = ProfileViewModel()
    @EnvironmentObject var cartViewModel: CartViewModel
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        GeometryReader { geo in
            VStack {
                ScrollView {
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Your Profile")
                            .font(.title)
                            .bold()
                            .frame(maxWidth: .infinity, alignment: .center)
                            .padding(.bottom, 10)

                        ProfileHeader(
                            personName: profileViewModel.name,
                            personEmail: profileViewModel.email,
                            personImg: profileViewModel.personImageURL
                        )

                        Spacer(minLength: 50)
                        Divider()

                        VStack(alignment: .leading, spacing: 12) {
                            // Header with icon
                            HStack(spacing: 8) {
                                Image(systemName: "shippingbox.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 20, height: 20)
                                    .foregroundColor(.orange)

                                Text("Recent Orders")
                                    .font(.headline)
                                    .foregroundColor(.black)
                            }

                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 12) {
                                    ForEach(profileViewModel.orders) { order in
                                        OrderCard(order: order)
                                    }
                                }
                                .padding(.vertical, 4)
                            }
                        }
                        .padding(.horizontal)

                        Divider()
                    }
                }

                Spacer()

                // Logout Button at Bottom
                Button(action: {
                    authViewModel.logout()
                }) {
                    Text("Logout")
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.orangeColor("FF7F00"))
                        .cornerRadius(8)
                }
                .padding(.horizontal)
                .padding(.bottom, geo.safeAreaInsets.bottom + 30)
                .alert(authViewModel.alertMessage, isPresented: $authViewModel.showAlert) {
                    Button("OK", role: .cancel) { }
                }
            }
            .padding(.top)
            .onAppear {
                profileViewModel.fetchUserData()
                profileViewModel.fetchOrders()
                isTabBarHidden = true
                configureNavBar()
            }
            .onDisappear {
                isTabBarHidden = false
            }
        }
    }

    func configureNavBar() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .white
        appearance.titleTextAttributes = [
            .foregroundColor: UIColor.orange,
            .font: UIFont.boldSystemFont(ofSize: 20)
        ]
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
}
