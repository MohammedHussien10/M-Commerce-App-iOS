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
    @StateObject private var themeViewModel = ThemeViewModel() // add dark mode
    var body: some Scene {
        WindowGroup {
            RootView()
                .preferredColorScheme(themeViewModel.isDarkMode ? .dark : .light)
                          .animation(.easeInOut, value: themeViewModel.isDarkMode)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(cartViewModel)
                .environmentObject(themeViewModel)
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
