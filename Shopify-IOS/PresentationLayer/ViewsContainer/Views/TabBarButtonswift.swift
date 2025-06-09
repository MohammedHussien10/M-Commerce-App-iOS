//
//  TabBarButtonswift.swift
//  Shopify-IOS
//
//  Created by Noha Ali Gomaa on 08/06/2025.
//

import SwiftUI

struct TabBarButtonswift: View {
    let icon: String
     let tab: ViewsContainer.Tab
     @Binding var selectedTab: ViewsContainer.Tab
    var body: some View {
            Button(action: {
                selectedTab = tab
            }) {
                Image(systemName: icon)
                    .font(.system(size: 22))
                    .foregroundColor(selectedTab == tab ? Color.orangeColor("#FF7F00") : .gray)
                    .frame(maxWidth: .infinity)
                    .bold()
            }.padding()
            Spacer()
        }
    
}
//
//#Preview {
//    TabBarButtonswift()
//}
