import SwiftUI

struct SplashScreenView: View {
    var onFinish: () -> Void

    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            LottieView(filename: "shopping_splash", loopMode: .loop)
                .frame(width: 300, height: 300)
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                onFinish()
            }
        }
    }
}
