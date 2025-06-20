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

    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    var body: some Scene {
        WindowGroup {
            RootView()
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
