//
//  ProfileHeader.swift
//  Shopify-IOS
//
//  Created by Macos on 09/06/2025.
//

import SwiftUI
import Kingfisher
struct ProfileHeader: View {
    var personName:String
    var personEmail:String
    var personImg:String?
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            if let profileImg = personImg, let url = URL(string: profileImg){
                KFImage(url).placeholder{
                    Image("profileAvatar").resizable()
                    
                }.resizable()
                    .frame(width: 200,height: 150)
            }else{
                Image("profileAvatar")
                    .resizable()
                    .frame(width: 180,height: 150)
            }
                
            
            Text(personName.isEmpty ? "Person Name" : personName)
                .font(.headline)
            Text(personEmail.isEmpty ? "Person Email" : personEmail)
                .font(.subheadline)
                .foregroundColor(.gray)
            
            
        }.frame(maxWidth: .infinity, alignment: .center)

    }
}

//#Preview {
//    ProfileHeader()
//}
