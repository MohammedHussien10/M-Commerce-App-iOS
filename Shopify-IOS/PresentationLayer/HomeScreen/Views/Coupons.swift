//
//  Coupons.swift
//  Shopify-IOS
//
//  Created by Noha Ali Gomaa on 08/06/2025.
//

import SwiftUI
import Combine
struct Coupons: View {
    var coverImages: [CouponesImge] = [
        CouponesImge(id: 2, name: "Everything", title:   "Up to 50% ", des: "On  items today", code: "SUMMER50%"),
        CouponesImge(id: 2, name: "Men", title:   "Up to 30% ", des: "On  items today", code: "SUMMER30%"),  CouponesImge(id: 3, name: "women", title: "Up to 50% ", des: "On items today", code: "SUMMER50%")
    ]

    @State private var selectedIndex = 0
    @State private var timer: Publishers.Autoconnect<Timer.TimerPublisher>?
    // MARK: - BODY
    var body: some View {
   ScrollViewReader { proxy in
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: Array(repeating: GridItem(.flexible(), spacing: rowSpacing), count: 1), alignment: .center, spacing: 15, pinnedViews: [], content: {
                    ForEach(coverImages, id:\.self) { item in
                        
                        HStack {

                            imge(CoverImage: item).padding(.horizontal, 10)
                        }
                    }
                    .onAppear {
                        withAnimation {
                            proxy.scrollTo(coverImages[selectedIndex])
                        }
                    }
                    .onReceive(timer ??  Timer.publish(every: 5, on: .main, in: .common)
                        .autoconnect()) { _ in
                        withAnimation {
                            if selectedIndex < coverImages.count - 1 {
                                selectedIndex += 1
                                proxy.scrollTo(coverImages[selectedIndex])
                            }else{
                                selectedIndex = 0
                            }
                        }
                    }
                }
                ).padding(.horizontal)
                  
                 
            }
   }.onAppear{
       startTimer()
   }
   .onDisappear{
       stopTimer()
   }
    }
    
    func startTimer() {
           timer = Timer.publish(every: 3, on: .main, in: .common)
               .autoconnect()
               
       }
       
       func stopTimer() {
           timer?.upstream.connect().cancel()
       }

}

#Preview {
    Coupons()
      .previewLayout(.fixed(width: 400, height: 300))
}
