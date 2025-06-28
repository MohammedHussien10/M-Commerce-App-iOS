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
import StoreFrontNameSpace

class AuthViewModel: ObservableObject {
    @Published var isLoggedIn = false
    @Published var isGuestMode = false
    @Published var alertMessage: String = ""
    @Published var showAlert: Bool = false
    @Published var showGuestPrompt: Bool = false

    private var cachedFirstName: String = ""
    private var cachedLastName: String = ""
    private var cachedPassword: String = ""

    init() {
        checkLoginStatus()
    }

    func checkLoginStatus() {
        if let user = Auth.auth().currentUser {
            isLoggedIn = user.isEmailVerified
            isGuestMode = false
            UserDefaults.standard.set(user.email, forKey: "CurrentCustomerEmail")
        } else {
            isLoggedIn = false
            isGuestMode = UserDefaults.standard.bool(forKey: "IsGuestMode")
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
                    print("Verification email sent successfully")
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
            
            UserDefaults.standard.set(user.email, forKey: "CurrentCustomerEmail")
            
            if user.isEmailVerified {
                self.isLoggedIn = true
                self.isGuestMode = false
                UserDefaults.standard.set(false, forKey: "IsGuestMode")
                self.createShopifyAccessToken(email: email, password: password) { token in
                    if let token = token {
                        print("Token saved: \(token)")
                        SessionManager.shared.saveToken(token)
                        self.fetchCustomerDetailsFromStoreFront(accessToken: token)
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
            UserDefaults.standard.removeObject(forKey: "ShopifyAccessToken")
            UserDefaults.standard.removeObject(forKey: "CurrentCustomerID")
            UserDefaults.standard.removeObject(forKey: "CurrentCustomerEmail")
            UserDefaults.standard.set(false, forKey: "IsGuestMode")
            
            NotificationCenter.default.post(name: NSNotification.Name("UserLoggedOut"), object: nil)
            
            isLoggedIn = false
            isGuestMode = false
        } catch {
            self.setAlert("Failed to logout . Please try again later ")
            print(error.localizedDescription)
        }
    }

    func refreshUserVerificationStatus(completion: @escaping () -> Void) {
        Auth.auth().currentUser?.reload(completion: { error in
            if let error = error {
                self.setAlert("Faild to refresh user")
                print("faild to refresh user \(error.localizedDescription)")
                return
            }
            
            if let user = Auth.auth().currentUser, user.isEmailVerified {
                UserDefaults.standard.set(user.email, forKey: "CurrentCustomerEmail")
                self.isLoggedIn = true
                self.isGuestMode = false
                UserDefaults.standard.set(false, forKey: "IsGuestMode")
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
    
    func continueAsGuest() {
        isGuestMode = true
        isLoggedIn = false
        UserDefaults.standard.set(true, forKey: "IsGuestMode")
        UserDefaults.standard.removeObject(forKey: "CurrentCustomerEmail")
        UserDefaults.standard.removeObject(forKey: "CurrentCustomerID")
    }

    func showAuthPrompt(for feature: String) {
        alertMessage = "To use \(feature), please sign in or create an account for the best experience."
        showGuestPrompt = true
    }
    
    private func setAlert(_ message: String) {
        self.alertMessage = message
        self.showAlert = true
    }
}

extension AuthViewModel {
    func createShopifyCustomer(email: String, password: String, firstName: String, lastName: String) {
        let input = StoreFrontNameSpace.CustomerCreateInput(
            firstName: .some(firstName),
            lastName: .some(lastName),
            email: email,
            password: password
        )

        let mutation = StoreFrontNameSpace.CustomerCreateMutation(input: input)

        NetworkManager.sharedStoreFront.performGraphQLRequest(mutation: mutation) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    
                    if let error = data.customerCreate?.customerUserErrors.first?.message {
                        self.setAlert("Something went wrong. Please try again later.")
                        print("Error for creating customer in shopify \(error)")
                    }
                    
                    if let email = data.customerCreate?.customer?.email {
                        print("Customer Created successfully with email : \(email)")
                        UserDefaults.standard.set(email, forKey: "CurrentCustomerEmail")
                    }
                    
                    if let customerID = data.customerCreate?.customer?.id {
                        UserDefaults.standard.set(customerID, forKey: "CurrentCustomerID")
                        print("Customer ID saved: \(customerID)")
                    }
                    if let firstName = data.customerCreate?.customer?.firstName {
                        UserDefaults.standard.set(firstName, forKey: "CustomerFirstName")
                    }
                    if let lastName = data.customerCreate?.customer?.lastName {
                        UserDefaults.standard.set(lastName, forKey: "CustomerLastName")
                                    }
                    let fullName = "\(firstName) \(lastName)"
                    
                    UserDefaults.standard.set(firstName, forKey: "CustomerFirstName")
                    
                    UserDefaults.standard.set(fullName, forKey: "CustomerFullName")
                case .failure(let error):
                    self.setAlert("Something went wrong. Please try again later.")
                    print("GraphQL error: \(error.localizedDescription)")
                }
            }
        }
    }
    
    func createShopifyAccessToken(email: String, password: String, completion: @escaping (String?) -> Void) {
        let input = StoreFrontNameSpace.CustomerAccessTokenCreateInput(
            email: email,
            password: password
        )

        let mutation = StoreFrontNameSpace.CustomerAccessTokenCreateMutation(input: input)

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
    
    func fetchCustomerDetailsFromStoreFront(accessToken: String) {
        let query = StoreFrontNameSpace.GetCustomerQuery(customerAccessToken: accessToken)

        NetworkManager.sharedStoreFront.queryGraphQLRequest(query: query) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    if let customer = data.customer {
                        let id = customer.id
                        UserDefaults.standard.set(id, forKey: "CurrentCustomerID")
                        print("Customer ID saved: \(id)")


                        if let email = customer.email {
                            UserDefaults.standard.set(email, forKey: "CurrentCustomerEmail")
                            print("Customer Email saved: \(email)")
                        }

                        NotificationCenter.default.post(name: NSNotification.Name("UserLoggedIn"), object: nil)
                    } else {
                        print("No customer data returned")
                    }

                case .failure(let error):
                    print("Failed to fetch customer: \(error.localizedDescription)")
                }
            }
        }
    }
}
