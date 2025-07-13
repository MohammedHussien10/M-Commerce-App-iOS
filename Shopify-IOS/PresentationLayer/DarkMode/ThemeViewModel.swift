//
//  ThemeViewModel.swift
//  Shopify-IOS
//
//  Created by Macos on 13/07/2025.
//

import Foundation
import SwiftUI
final class ThemeViewModel: ObservableObject {
    @AppStorage("isDarkMode") var isDarkMode: Bool = false
}
