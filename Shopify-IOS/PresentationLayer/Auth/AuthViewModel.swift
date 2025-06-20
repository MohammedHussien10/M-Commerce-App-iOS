//
//  AuthViewModel.swift
//  Shopify-IOS
//
//  Created by Aya Emam on 19/06/2025.
//
import Foundation
import Firebase
import SwiftUI
import FirebaseAuth

class AuthViewModel: ObservableObject {
    @Published var isLoggedIn = false
    @Published var alertMessage: String = ""
    @Published var showAlert: Bool = false

    private var cachedFirstName: String = ""
    private var cachedLastName: String = ""
    private var cachedPassword: String = ""


    init() {
        checkLoginStatus()
    }

    func checkLoginStatus() {
        if let user = Auth.auth().currentUser {
            isLoggedIn = user.isEmailVerified
        } else {
            isLoggedIn = false
        }
    }

    func signUp(firstName: String, lastName: String, email: String, password: String, confirmPassword: String, completion: @escaping () -> Void){
        guard password == confirmPassword else {
            self.setAlert("Passwords do not match")
            return
        }

        self.cachedFirstName = firstName
        self.cachedLastName = lastName
        self.cachedPassword = password

        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                self.setAlert(error.localizedDescription)
                return
            }

            result?.user.sendEmailVerification { error in
                if let error = error {
                    self.setAlert("Something went wrong while sending verification email. Please try again later")
                    print("faild to send verification email: \(error.localizedDescription)")
                } else {
                    self.setAlert("Verification email sent, Please verify your email")
                    completion()
                }
            }
        }
    }

    func login(email: String, password: String, completion: @escaping () -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                self.setAlert(error.localizedDescription)
                return
            }

            guard let user = result?.user else { return }

            if user.isEmailVerified {
                self.isLoggedIn = true
                self.createShopifyAccessToken(email: email, password: password) { token in
                    if let token = token {
                        print("Token saved: \(token)")
                    }
                }
                completion()
            } else {
                self.setAlert("Email not verified , Please check your inbox")
                self.isLoggedIn = false
            }
        }
    }

    func logout() {
        do {
            try Auth.auth().signOut()
            isLoggedIn = false
        } catch {
            self.setAlert("Failed to logout . Please try again later ")
            print(error.localizedDescription)
        }
    }
//    func resetPassword(email: String) {
//        Auth.auth().sendPasswordReset(withEmail: email) { error in
//            if let error = error {
//                self.setAlert("Failed to send reset email")
//                print("faild to send reset email \(error.localizedDescription)")
//            } else {
//                self.setAlert("Password reset email sent . Please check your inbox")
//            }
//        }
//    }

    func refreshUserVerificationStatus(completion: @escaping () -> Void) {
        Auth.auth().currentUser?.reload(completion: { error in
            if let error = error {
                self.setAlert("Something went wrong. Please try again later.")
                print("faild to refresh user \(error.localizedDescription)")
                return
            }
            
            if let user = Auth.auth().currentUser, user.isEmailVerified {
                self.isLoggedIn = true
                self.createShopifyCustomer(
                    email: user.email ?? "",
                    password: self.cachedPassword,
                    firstName: self.cachedFirstName,
                    lastName: self.cachedLastName
                )
                completion()
            } else {
                self.setAlert("Email is still not verified")
            }
        })
    }
    private func setAlert(_ message: String) {
        self.alertMessage = message
        self.showAlert = true
    }
}
extension AuthViewModel {
    
}

extension AuthViewModel {
    func createShopifyCustomer(email: String, password: String, firstName: String, lastName: String) {
        let input = GraphQLCodeGen.CustomerCreateInput(
            firstName: .some(firstName),
            lastName: .some(lastName),
            email: email,
            password: password
        )


        let mutation = GraphQLCodeGen.CustomerCreateMutation(input: input)

        NetworkManager.sharedStoreFront.performGraphQLRequest(mutation: mutation) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    if let error = data.customerCreate?.customerUserErrors.first?.message {
                        self.setAlert("Something went wrong. Please try again later.")
                        print("Errror for creating customer in shopify \(error)")
                    } else if let email = data.customerCreate?.customer?.email {
                        print("Customer Created successfully with email : \(email)")
                    }
                case .failure(let error):
                    self.setAlert("Something went wrong. Please try again later.")
                    print("GraphQL error: \(error.localizedDescription)")
                }
            }
        }
    }
    
    func createShopifyAccessToken(email: String, password: String, completion: @escaping (String?) -> Void) {
            let input = GraphQLCodeGen.CustomerAccessTokenCreateInput(
                email: email,
                password: password
            )

            let mutation = GraphQLCodeGen.CustomerAccessTokenCreateMutation(input: input)

            NetworkManager.sharedStoreFront.performGraphQLRequest(mutation: mutation) { result in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let data):
                        if let error = data.customerAccessTokenCreate?.customerUserErrors.first?.message {
                            self.setAlert("Something went wrong. Please try again later.")
                            print("Shopify Token Error: \(error)")
                            completion(nil)
                        } else if let token = data.customerAccessTokenCreate?.customerAccessToken?.accessToken {
                            UserDefaults.standard.set(token, forKey: "ShopifyAccessToken")
                            completion(token)
                        } else {
                            self.setAlert("error for token")
                            completion(nil)
                        }
                    case .failure(let error):
                        self.setAlert("Something went wrong. Please try again later.")
                        print("GraphQL error: \(error.localizedDescription)")
                        completion(nil)
                    }
                }
            }
        }
}
