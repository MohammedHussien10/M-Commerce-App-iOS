//
//  LoginView.swift
//  Shopify-IOS
//
//  Created by Aya Emam on 18/06/2025.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var authViewModel: AuthViewModel
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isPasswordVisible: Bool = false
    @State private var navigateToSign = false

    var body: some View {
        NavigationStack
        {
            VStack {
               
                
                Spacer().frame(height: 100)
                
                HStack{
                    // Logo (center)
                    Text("Gen")
                        .font(.largeTitle).bold()
                        .foregroundColor(Constants.AppColor.primaryColor)
                        .bold()
                    Image("genie")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 60, height: 60)
                    Text("ie")
                        .font(.largeTitle).bold()
                        .foregroundColor(Constants.AppColor.primaryColor)
                        .bold()
                }
                
                Spacer().frame(height: 120)
                
                VStack(spacing: 16) {
                    Text("🔥Welcome Back🔥")
                        .font(.title2)
                        .bold().foregroundColor(.white)
                    
                    Text("Enter your details")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Spacer().frame(height: 40)

                    CustomTextField(icon: "envelope", placeholder: "E-mail", text: $email, isSecure: false)
                    
                    CustomTextField(icon: isPasswordVisible ? "eye" : "eye.slash", placeholder: "Password", text: $password, isSecure: !isPasswordVisible)
                        .onTapGesture {
                            isPasswordVisible.toggle()
                        }
                    Spacer().frame(height: 20)
                    Button(action: {
                        authViewModel.login(email: email, password: password){}
                    }) {
                        Text("Login")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .foregroundColor(.white)
                            .background(Constants.AppColor.primaryColor)
                            .cornerRadius(12)
                    }
                    .alert(authViewModel.alertMessage, isPresented: $authViewModel.showAlert) {
                        Button("OK", role: .cancel) { }
                    }

                    HStack {
                        Text("Don't have an account?")
                            .foregroundColor(.gray)
                        Button(action: {
                            navigateToSign = true
                        }) {
                            Text("Sign Up")
                                .foregroundColor(.white)
                                .bold()
                        }


                    }
                }.frame(maxWidth: .infinity , maxHeight: .infinity)
                    .padding()
                    .background(Color.black)
                    .cornerRadius(30)
                    .ignoresSafeArea(edges: .bottom)
                    .navigationDestination(isPresented: $navigateToSign) {
                        SignUpView(authViewModel: authViewModel)
                        
                    }
            }
            .background(Color.white.ignoresSafeArea())
        }
    }
}
