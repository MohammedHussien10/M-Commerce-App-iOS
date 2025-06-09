//
//  imge.swift
//  Shopify-IOS
//
//  Created by Noha Ali Gomaa on 08/06/2025.
//

import SwiftUI

struct imge: View {
    var CoverImage: CouponesImge
    @State var  isGoingTONextView = false
    @AppStorage("token") var token: String?
    @State var isPresented = false
    var body: some View {
        ZStack{
            Image(CoverImage.name)
                .resizable()
                .frame(width: UIScreen.main.bounds.width * 0.90 ,height: UIScreen.main.bounds.width * 0.50 )
                .scaledToFit()
                .cornerRadius(25)
            VStack{
                HStack{
                    Text(CoverImage.title)
                        .font(.custom(Constants.AppFont.boldFont, size: 30))
                    Spacer()
                }.padding(.leading,24)
                HStack{
                    Text(CoverImage.des)
                        .font(.custom(Constants.AppFont.regularFont, size: 20))
                    Spacer()
                }.padding(.leading,20)
                HStack{
                    Text("With code:")
                        .font(.custom(Constants.AppFont.lightFont, size: 15))
                    Text(CoverImage.code)
                        .font(.custom(Constants.AppFont.lightFont, size: 15))
                    Spacer()
                }.padding(.leading,26)
                HStack{
                    NavigationLink {
                        
                        //MARK: - write the logic for coupons here
                       
                    } label: {
                        
                        Text("Click Me")
                            .foregroundColor(.black)
                            .padding()
                            .background(.white)
                            .cornerRadius(25)
                            .frame(width: 150, height: 50)
                            .padding(.trailing,120)
                        
                    }
                    
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    imge(CoverImage: CouponesImge(id: 1, name: "women", title: "50% Off", des: " On everything today", code: "FSCREATION")).frame(width: 200, height: 200)
}
