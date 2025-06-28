import Foundation
import SwiftUI

struct RootView: View {
    @AppStorage("hasSeenOnboarding") private var hasSeenOnboarding = false
    @State private var showSplash = true
    @StateObject var authViewModel = AuthViewModel()

    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()

            if showSplash {
                SplashScreenView {
                    withAnimation {
                        showSplash = false
                    }
                }
            } else {
                if !hasSeenOnboarding {
                    OnboardingView()
                } else {
                    NavigationStack {
                        if authViewModel.isLoggedIn {
                            ViewsContainer(authViewModel: authViewModel)
                        } else if authViewModel.isGuestMode {
                            ViewsContainer(authViewModel: authViewModel)
                        } else {
                            AuthenticationChoiceView(authViewModel: authViewModel)
                        }
                    }
                }
            }
        }
    }
}
