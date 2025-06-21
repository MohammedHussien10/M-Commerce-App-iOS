//
//  Shopify_IOSApp.swift
//  Shopify-IOS
//
//  Created by Macos on 01/06/2025.
//

import SwiftUI
import Firebase

@main
struct Shopify_IOSApp: App {
    let persistenceController = PersistenceController.shared
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject private var cartViewModel = CartViewModel(
         useCase: CartUseCase(
             repository: RepositoryImp(remoteDataSource: RemoteDataSource())
         )
     )

     var body: some Scene {
         WindowGroup {
             RootView()
                 .environment(
                    \.managedObjectContext,
                     persistenceController.container.viewContext
                 )
                 .environmentObject(cartViewModel)
         }
     }
}

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
      FirebaseApp.configure()
      print("config firebase")
    return true
  }
}
