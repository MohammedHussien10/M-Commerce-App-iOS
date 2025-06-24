//
//  ViewsContainer .swift
//  Shopify-IOS
//
//  Created by Macos on 07/06/2025.
//

import SwiftUI
import Apollo

struct ViewsContainer: View {
    @State private var selectedTab: Tab = .home
    @ObservedObject var authViewModel: AuthViewModel
    enum Tab {
        case home, grid, cart, favorites, profile
    }
    @State private var isTabBarHidden: Bool = false
    @State private var path = NavigationPath()
    var body: some View {
        
        ZStack {
            // MARK: - Tab Content
            switch selectedTab {
            case .home:
                HomeScreen(isTabBarHidden: $isTabBarHidden, selectedTab: $selectedTab)
                
            case .grid:
                CategoriesScreen(isTabBarHidden: $isTabBarHidden)
                
            case .cart:
                VStack(spacing: 0) {
                    // Custom NavBar
                    ZStack {
                        // Centered Title
                        Text("Shopping Cart")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.orange)
                        
                        // Back Button
                        HStack {
                            Button(action: {
                                selectedTab = .home
                            }) {
                                Image(systemName: "chevron.left")
                                    .foregroundColor(.orange)
                                Text("Back")
                                    .foregroundColor(.orange)
                            }
                            .padding(.leading)
                            
                            Spacer()
                        }
                    }
                    .padding(.vertical, 12)
                    .background(Color.white)
                    .shadow(color: .gray.opacity(0.2), radius: 2, x: 0, y: 2)
                    
                    ShoppingCartScreen(isTabBarHidden: $isTabBarHidden)
                }
                
            case .profile:
                VStack(spacing: 0) {
                    ZStack {
                        // Centered Title
                        Text("Profile")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.orange)

                        // Back + Settings
                        HStack {
                            Button(action: {
                                selectedTab = .home
                            }) {
                                Image(systemName: "chevron.left")
                                    .foregroundColor(.orange)
                                Text("Back")
                                    .foregroundColor(.orange)
                            }
                            .padding(.leading)

                            Spacer()

                            NavigationLink(destination: SettingsScreen()) {
                                Image(systemName: "gearshape")
                                    .foregroundColor(Color.orange)
                            }
                            .padding(.trailing)
                        }
                    }
                    .padding(.vertical, 12)
                    .background(Color.white)
                    .shadow(color: .gray.opacity(0.2), radius: 2, x: 0, y: 2)

                    ProfileScreen(isTabBarHidden: $isTabBarHidden, authViewModel: authViewModel)
                }
            case .favorites:
                Text("Favorites View")
            }

            if !isTabBarHidden {
                VStack {
                    Spacer()
                    ZStack {
                        // MARK: - Background of Tab Bar
                        CustomTabBarShape()
                            .fill(Color.white)
                            .frame(height: 80)
                            .shadow(radius: 5)
                        // MARK: - Floating Center Button
                        HStack {
                            TabBarButtonswift(icon: "house", tab: .home, selectedTab: $selectedTab)
                            TabBarButtonswift(icon: "square.grid.2x2", tab: .grid, selectedTab: $selectedTab)
                            
                            Spacer(minLength: 50)
                            
                            TabBarButtonswift(icon: "heart", tab: .favorites, selectedTab: $selectedTab)
                            TabBarButtonswift(icon: "person", tab: .profile, selectedTab: $selectedTab)
                        }
                        .padding(.horizontal)
                        
                        // Center Floating Cart Button
                        Button(action: {
                            selectedTab = .cart
                        }) {
                            Image(systemName: "cart")
                                .font(.system(size: 24))
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.orangeColor("#FF7F00"))
                                .clipShape(Circle())
                                .shadow(radius: 5)
                        }
                        .offset(y: -40)
                    }
                }
            }
        }
        .edgesIgnoringSafeArea(.bottom)
    }
    
}





