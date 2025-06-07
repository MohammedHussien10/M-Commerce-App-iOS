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

    var body: some Scene {
        WindowGroup {
            ViewsContainer()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
