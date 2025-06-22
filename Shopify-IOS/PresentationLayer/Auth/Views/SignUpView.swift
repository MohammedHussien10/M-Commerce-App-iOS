//
//  SignUpView.swift
//  Shopify-IOS
//
//  Created by Aya Emam on 18/06/2025.
//

import SwiftUI

struct SignUpView: View {
    @ObservedObject var authViewModel: AuthViewModel
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var isPasswordVisible: Bool = false
    @State private var isConfirmPasswordVisible: Bool = false
    @State private var navigateToVerify = false
    @Environment(\.dismiss) private var dismiss

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

                Spacer().frame(height: 60)

                VStack(spacing: 16) {
                    Text("Get Started")
                        .font(.title2)
                        .bold().foregroundColor(.white)
                    
                    Text("Enter your details")
                        .font(.subheadline)
                        .foregroundColor(.gray)

                    CustomTextField(icon: "person", placeholder: "First Name", text: $firstName, isSecure: false)
                    CustomTextField(icon: "person", placeholder: "Last Name", text: $lastName, isSecure: false)
                    CustomTextField(icon: "envelope", placeholder: "Email", text: $email, isSecure: false)
                    
                    CustomTextField(icon: isPasswordVisible ? "eye" : "eye.slash", placeholder: "Password", text: $password, isSecure: !isPasswordVisible)
                        .onTapGesture {
                            isPasswordVisible.toggle()
                        }

                    CustomTextField(icon: isConfirmPasswordVisible ? "eye" : "eye.slash", placeholder: "Confirm Password", text: $confirmPassword, isSecure: !isConfirmPasswordVisible)
                        .onTapGesture {
                            isConfirmPasswordVisible.toggle()
                        }

                    Button(action: {
                        authViewModel.signUp(
                            firstName: firstName,
                            lastName: lastName,
                            email: email,
                            password: password,
                            confirmPassword: confirmPassword
                        ) {
                            navigateToVerify = true
                        }
                    }) {
                        Text("Sign Up")
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
                        Text("Already have an account?")
                            .foregroundColor(.gray)
                        Button(action: {
                            dismiss()
                        }) {
                            Text("Sign In")
                                .foregroundColor(.white)
                                .bold()
                        }
                    }
                    Spacer(minLength: 20)

                }.frame(maxWidth: .infinity , maxHeight: 650)
                .padding()
                .background(Color.black)
                .cornerRadius(30)
               

                
            }
            .background(Color.white.ignoresSafeArea())
            .navigationDestination(isPresented: $navigateToVerify) {
                EmailVerificationView(authViewModel: authViewModel)
                
            }
        }
    }
}

