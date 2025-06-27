//
//  Taps.swift
//  Shopify-IOS
//
//  Created by Noha Ali Gomaa on 18/06/2025.
//

import SwiftUI

struct Taps: View {
    /// View Properties
     var tags: [String]
    @State  var activeTag: String
    /// For Matched Geometry Effect
    @Namespace private var animation // Added
    var body: some View {
        Text("Test")
    }
    
}

//#Preview {
//    let tags: [String] =   [
//        "all","man", "women", "kids"
//    ]
//    Taps(tags: tags, activeTag: tags[0])
//}
