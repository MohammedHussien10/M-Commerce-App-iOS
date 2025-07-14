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
    var cartCount: Int = 0
    var body: some View {
        ZStack(alignment: .topTrailing) {
                  Button(action: {
                      selectedTab = tab
                  }) {
                      Image(systemName: icon)
                          .font(.system(size: 22))
                          .foregroundColor(selectedTab == tab ? Color.orangeColor("#FF7F00") : Color.forText.opacity(0.7))
                          .frame(maxWidth: .infinity)
                          .bold()
                  }
                  .padding()
            if tab == .cart && cartCount > 0 {
                           Text("\(cartCount)")
                               .font(.caption2)
                               .foregroundColor(.white)
                               .padding(6)
                               .background(Color.red)
                               .clipShape(Circle())
                               .offset(x: 10, y: -10)
                       }
               }
            Spacer()
        }
    
}
//
//#Preview {
//    TabBarButtonswift()
//}
