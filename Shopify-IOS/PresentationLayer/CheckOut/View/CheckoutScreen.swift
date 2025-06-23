//
//  CheckoutScreen.swift
//  Shopify-IOS
//
//  Created by Noha Ali Gomaa on 23/06/2025.
//

import SwiftUI
import PassKit

struct CheckoutScreen: View {
    let products: [CartProduct]
    @Environment(\.dismiss) private var dismiss
    @State private var discountApplied = false
    @State private var selectedPaymentMethod: String? = nil
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading, spacing: 20) {
                    Rectangle()
                      .fill(Color.white.opacity(0.2))
                      .frame(height: 10)
                    // Address Section
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Shipping Address")
                            .font(.title2)
                            .bold()
                            .padding()
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 8) {
                                ForEach(products) { _ in
                                    AddressCell()
                                }
                            }
                            .padding(.horizontal, 16)
                        }
                    }
                    .padding(.horizontal, 10)
                    
                    // Items Section
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Cart Items")
                            .font(.title2)
                            .bold()
                        
                        if products.isEmpty {
                            VStack(spacing: 16) {
                                Image("out-of-stock")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 200, height: 200)
                                Text("No Products Found")
                                    .font(.headline)
                                    .foregroundColor(.gray)
                            }
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 40)
                        } else {
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 16) {
                                    ForEach(products, id: \.id) { product in
                                        CartProducts(product: product)
                                            .frame(height: 250)
                                            .onAppear {
                                                print(product.title)
                                            }
                                    }
                                }
                                .padding(.horizontal, 16)
                            }
                        }
                    }
                    .padding(.horizontal, 16)
                    Spacer()
                    // Discount Section
                    VStack(alignment: .leading, spacing: 10) {
                        HStack {
                            Text("Apply Discount Code")
                                .font(.title3)
                                .bold()
                            Spacer()
                            Button(action: {
                                discountApplied = true
                                print("Discount applied")
                            }) {
                                Text("Apply")
                                    .font(.body)
                                    .fontWeight(.medium)
                                    .frame(width: 120, height: 44)
                                    .background(Constants.AppColor.primaryColor)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                            }
                        }
                    }
                    .padding(.horizontal, 16)
                    // Payment Method Section
                    VStack(alignment: .leading, spacing: 10) {
                        HStack{
                            Text("Choose Payment Method ")
                                .font(.title3)
                                .bold()
                                .padding()
                            Spacer()
                            Image(systemName: "dollarsign.circle" )
                                .resizable()
                                .frame(width: 25, height: 25)
                                .foregroundColor(Constants.AppColor.primaryColor)
                        }
                        
                        HStack(spacing: 16) {
                            Button(action: {
                                selectedPaymentMethod = "Cash"
                                print("Selected Cash")
                            }) {
                                Text("Cash")
                                    .font(.body)
                                    .fontWeight(.medium)
                                    .frame(maxWidth: .infinity)
                                    .padding(.vertical, 12)
                                    .background(selectedPaymentMethod == "Cash" ? .orange : .gray.opacity(0.3))
                                    .foregroundColor(.white)
                                    .cornerRadius(12)
                            }
                            
                            Button(action: {
                                selectedPaymentMethod = "Apple Pay"
                                print("Selected Apple Pay")
                            }) {
                                Text("Apple Pay")
                                    .font(.body)
                                    .fontWeight(.medium)
                                    .frame(maxWidth: .infinity)
                                    .padding(.vertical, 12)
                                    .background(selectedPaymentMethod == "Apple Pay" ? .orange : .gray.opacity(0.3))
                                    .foregroundColor(.white)
                                    .cornerRadius(12)
                            }
                        }
                    }
                    .padding(.horizontal, 16)
                    
                    // Bottom spacing
                    Spacer()
                        .frame(height: 20)
                }
                .padding(.top, 10)
            }.onAppear(){
                print(products.first?.Variantid ?? "No Products")
                let appearance = UINavigationBarAppearance()
                  appearance.titleTextAttributes = [
                      .foregroundColor: UIColor.orange,
                      .font: UIFont.boldSystemFont(ofSize: 20)
                  ]
                  UINavigationBar.appearance().standardAppearance = appearance
                  UINavigationBar.appearance().scrollEdgeAppearance = appearance
            }
        } .navigationTitle("Check Out")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.orange)
                            .font(.system(size: 18, weight: .bold))
                    }
                }
            }
    }
}

