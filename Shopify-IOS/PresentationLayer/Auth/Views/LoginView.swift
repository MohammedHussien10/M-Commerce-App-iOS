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
                    Spacer().frame(height: 20)

                    CustomTextField(icon: "envelope", placeholder: "E-mail", text: $email, isSecure: false)
                    
                    CustomTextField(icon: isPasswordVisible ? "eye" : "eye.slash", placeholder: "Password", text: $password, isSecure: !isPasswordVisible)
                        .onTapGesture {
                            isPasswordVisible.toggle()
                        }
                    
                    HStack {
                        Spacer()
                        Button(action: {
//                            if email.isEmpty {
//                                authViewModel.alertMessage = "Please enter your email first"
//                                authViewModel.showAlert = true
//                            } else {
//                                authViewModel.resetPassword(email: email)
//                            }
                        }) {
                            Text("Forget your password ?")
                                .font(.footnote)
                                .foregroundColor(Color.orange)
                        }
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
                        NavigationLink(destination: SignUpView(authViewModel: authViewModel)) {
                            Text("Sign Up")
                                .foregroundColor(.white)
                                .bold()
                        }

                    }
                }.frame(maxWidth: .infinity , maxHeight: 550)
                    .padding()
                    .background(Color.black)
                    .cornerRadius(30)
                    .ignoresSafeArea(edges: .bottom)
            }
            .background(Color.white.ignoresSafeArea())
        }
    }
}


//#Preview {
//    LoginView()
//}
