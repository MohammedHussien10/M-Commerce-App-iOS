import SwiftUI

struct OnboardingView: View {
    @State private var currentPage = 0
    @AppStorage("hasSeenOnboarding") private var hasSeenOnboarding = false

    private let pages = [
        OnboardingPage(
            image: "first", // use assets (e.g. onboarding1.png in Assets.xcassets)
            title: "Shop the Best",
            subtitle: "Discover top products at the best prices."
        ),
        OnboardingPage(
            image: "two",
            title: "Secure Payment",
            subtitle: "Fast and safe checkout with multiple options."
        ),
        OnboardingPage(
            image: "three",
            title: "Easy Pick",
            subtitle: "Convenient pickup options tailored to your needs."
        )
    ]

    var body: some View {
        VStack {
            TabView(selection: $currentPage) {
                ForEach(Array(pages.enumerated()), id: \.element.id) { index, page in
                    VStack(spacing: 20) {
                        Spacer()
                        Image(page.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 240, height: 240)
                            .padding(.bottom, 10)

                        Text(page.title)
                            .font(.title.bold())
                            .padding(.top)

                        Text(page.subtitle)
                            .font(.body)
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)

                        Spacer()
                    }
                    .tag(index)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .frame(height: 500)

            // Custom Page Indicator
            HStack(spacing: 8) {
                ForEach(0..<pages.count, id: \.self) { index in
                    Circle()
                        .fill(index == currentPage ? Color.orange : Color.gray.opacity(0.4))
                        .frame(width: 10, height: 10)
                }
            }
            .padding(.bottom, 20)

            Button(action: {
                if currentPage == pages.count - 1 {
                    hasSeenOnboarding = true
                } else {
                    withAnimation {
                        currentPage += 1
                    }
                }
            }) {
                Text(currentPage == pages.count - 1 ? "Get Started" : "Next")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.orange)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding(.horizontal)
            }

            if currentPage < pages.count - 1 {
                Button("Skip") {
                    hasSeenOnboarding = true
                }
                .foregroundColor(.gray)
                .padding(.bottom, 20)
            }
        }
    }
}
