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

       enum Tab {
           case home, grid, cart, favorites, profile
       }

    var body: some View {
        ZStack {
                // MARK: - Tab Content
                switch selectedTab {
                case .home:
                    HomeScreen()
                case .grid:
                    CategoriesScreen()
                case .cart:
                    Text("Cart View")
                case .favorites:
                    Text("Favorites View")
                case .profile:
                    ProfileScreen()
                }

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
            .edgesIgnoringSafeArea(.bottom)
        }

}





