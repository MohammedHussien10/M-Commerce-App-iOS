//
//  Profile.swift
//  Shopify-IOS
//
//  Created by Macos on 09/06/2025.
//

import SwiftUI
import Kingfisher
struct ProfileScreen: View {
    
    @StateObject var profileViewModel = ProfileViewModel()
    var body: some View {
        NavigationStack{
        ScrollView {
    
                VStack(alignment: .leading, spacing: 20) {
                    ProfileHeader(personName: profileViewModel.personName, personEmail: profileViewModel.personEmail,personImg: profileViewModel.personImageURL)
                    
                    Divider()
                    NavigationLink(destination: Favourites()) {
                        SettingsCell(nameOfCell: "Contact Us", CellIcon: "phone", dropIcon: "")
                    }
                    Divider()
                    NavigationLink(destination: Orders()) {
                        SettingsCell(nameOfCell: "About Us", CellIcon: "info.circle", dropIcon: "")
                    }
                    Divider()
                    Button(action: {
                    }) {
                        Text("Logout")
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.orangeColor("FF7F00"))
                            .cornerRadius(8)
                    }
                }
            }
        }.onAppear {
            profileViewModel.fetchUserData()
        }
    }
}

//#Preview {
//    ProfileScreen(personName: personName,personEmail: personEmail)
//}
