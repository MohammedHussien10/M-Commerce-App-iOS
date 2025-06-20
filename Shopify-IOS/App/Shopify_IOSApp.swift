//
//  Shopify_IOSApp.swift
//  Shopify-IOS
//
//  Created by Macos on 01/06/2025.
//

import SwiftUI

@main
struct Shopify_IOSApp: App {

    let persistenceController = PersistenceController.shared

    @StateObject private var cartViewModel = CartViewModel(
         useCase: CartUseCase(
             repository: RepositoryImp(remoteDataSource: RemoteDataSource())
         )
     )

     var body: some Scene {
         WindowGroup {
             ViewsContainer()
                 .environment(\.managedObjectContext, persistenceController.container.viewContext)
                 .environmentObject(cartViewModel) 
         }
     }
}
