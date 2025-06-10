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
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("Your Profile").font(.title).bold().frame(maxWidth: .infinity, alignment: .center).padding(.bottom, 10)
                    ProfileHeader(personName: profileViewModel.personName, personEmail: profileViewModel.personEmail,personImg: profileViewModel.personImageURL)
                    Spacer(minLength: 50)
                    Divider()
                    
        
                      Text("Recent Orders")
                          .font(.headline)

                      ForEach(profileViewModel.orders.prefix(4)) { order in
                          Text(order.name)
                              .padding(.vertical, 4)
                              .padding(.horizontal)
                              .background(Color.gray.opacity(0.1))
                              .cornerRadius(8)
                      }

                    
                      if profileViewModel.orders.count > 4 {
                          NavigationLink(destination: Orders()) {
                              Text("More Orders")
                                  .font(.subheadline)
                                  .foregroundColor(.blue)
                          }
                          .padding(.top, 5)
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
                    }.padding(.top,10)
                    
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            
                            NavigationLink(destination: SettingsScreen()) {
                                
                                
                                Image(systemName: "gearshape") .foregroundColor(Color.orangeColor("FF7F00"))
                                
                            }
                        }
                    }
                }
            }     .padding()
        }.onAppear {
            profileViewModel.fetchUserData()
            profileViewModel.fetchOrders()
        }
    }
}

//#Preview {
//    ProfileScreen(personName: personName,personEmail: personEmail)
//}
