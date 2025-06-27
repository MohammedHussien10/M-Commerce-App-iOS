//
//  View+Extensions.swift
//  Shopify-IOS
//
//  Created by Noha Ali Gomaa on 24/06/2025.
//
import SwiftUI

// MARK: - Loading View Extension
extension View {
    /// Shows a loading overlay on the view
    /// - Parameters:
    ///   - isLoading: Binding to control loading state
    ///   - loadingText: Optional text to show with loading spinner
    ///   - backgroundColor: Background color of loading overlay
    ///   - spinnerColor: Color of the loading spinner
    func loading(
        isLoading: Binding<Bool>,
        loadingText: String? = nil,
        backgroundColor: Color = Color.black.opacity(0.3),
        spinnerColor: Color = .blue
    ) -> some View {
        self
            .overlay(
                LoadingOverlay(
                    isLoading: isLoading.wrappedValue,
                    loadingText: loadingText,
                    backgroundColor: backgroundColor,
                    spinnerColor: spinnerColor
                )
            )
    }
    
    /// Shows a loading overlay with custom content
    /// - Parameters:
    ///   - isLoading: Binding to control loading state
    ///   - backgroundColor: Background color of loading overlay
    ///   - content: Custom loading content
    func loading<Content: View>(
        isLoading: Binding<Bool>,
        backgroundColor: Color = Color.black.opacity(0.3),
        @ViewBuilder content: () -> Content
    ) -> some View {
        self
            .overlay(
                Group {
                    if isLoading.wrappedValue {
                        ZStack {
                            backgroundColor
                                .ignoresSafeArea()
                            
                            content()
                        }
                        .transition(.opacity)
                        .animation(.easeInOut(duration: 0.3), value: isLoading.wrappedValue)
                    }
                }
            )
    }
}

// MARK: - Loading Overlay Component
struct LoadingOverlay: View {
    let isLoading: Bool
    let loadingText: String?
    let backgroundColor: Color
    let spinnerColor: Color
    
    var body: some View {
        Group {
            if isLoading {
                ZStack {
                    backgroundColor
                        .ignoresSafeArea()
                    
                    VStack(spacing: 16) {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: spinnerColor))
                            .scaleEffect(1.2)
                        
                        if let loadingText = loadingText {
                            Text(loadingText)
                                .foregroundColor(.primary)
                                .font(.body)
                                .multilineTextAlignment(.center)
                        }
                    }
                    .padding(24)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(.regularMaterial)
                            .shadow(radius: 8)
                    )
                }
                .transition(.opacity)
                .animation(.easeInOut(duration: 0.3), value: isLoading)
            }
        }
    }
}

// MARK: - Alternative Loading Styles
extension View {
    /// Shows a minimal loading spinner
    func loadingSpinner(
        isLoading: Binding<Bool>,
        color: Color = .blue
    ) -> some View {
        self
            .overlay(
                Group {
                    if isLoading.wrappedValue {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: color))
                            .scaleEffect(1.2)
                    }
                }
            )
    }
    
    /// Shows a full screen loading overlay
    func fullScreenLoading(
        isLoading: Binding<Bool>,
        loadingText: String = "Loading...",
        backgroundColor: Color = Color.black.opacity(0.4)
    ) -> some View {
        ZStack {
            self
            
            if isLoading.wrappedValue {
                backgroundColor
                    .ignoresSafeArea(.all)
                
                VStack(spacing: 20) {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .white))
                        .scaleEffect(1.5)
                    
                    Text(loadingText)
                        .foregroundColor(.white)
                        .font(.headline)
                }
                .transition(.opacity)
                .animation(.easeInOut(duration: 0.3), value: isLoading.wrappedValue)
            }
        }
    }
    
    /// Shows loading with a blur effect
    func loadingWithBlur(
        isLoading: Binding<Bool>,
        loadingText: String? = nil,
        blurRadius: CGFloat = 3
    ) -> some View {
        self
            .blur(radius: isLoading.wrappedValue ? blurRadius : 0)
            .overlay(
                Group {
                    if isLoading.wrappedValue {
                        VStack(spacing: 16) {
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle())
                                .scaleEffect(1.3)
                            
                            if let loadingText = loadingText {
                                Text(loadingText)
                                    .font(.headline)
                                    .foregroundColor(.primary)
                            }
                        }
                        .padding(32)
                        .background(.regularMaterial, in: RoundedRectangle(cornerRadius: 16))
                        .transition(.scale.combined(with: .opacity))
                    }
                }
            )
            .animation(.easeInOut(duration: 0.3), value: isLoading.wrappedValue)
    }
}
