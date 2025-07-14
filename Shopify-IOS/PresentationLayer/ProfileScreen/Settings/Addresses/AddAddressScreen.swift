//
//  AddAddressScreen.swift
//  Shopify-IOS
//
//  Created by Macos on 14/06/2025.
//

import SwiftUI
import StoreFrontNameSpace

struct AddAddressScreen: View {
    @Environment(\.dismiss) var dismiss
    @State private var showAlert = false
    @State private var alertMessage = ""
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var address1 = ""
    @State private var phone = ""
    @State private var city = LocationConstants.egyptGovernorates.first ?? ""
    @State private var country = LocationConstants.countries.first ?? ""


    @ObservedObject var viewModel: AddressViewModel
    let token = SessionManager.shared.accessToken

    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Personal Info")) {
                    TextField("First Name", text: $firstName)
                        .foregroundColor(.forText)
                    TextField("Last Name", text: $lastName)
                        .foregroundColor(.forText)
                    TextField("Phone", text: $phone)
                        .keyboardType(.phonePad)
                        .foregroundColor(.forText)
                }

                Section(header: Text("Address Info")) {
                                   TextField("Address", text: $address1)
                        .foregroundColor(.forText)
                                   Picker("City", selection: $city) {
                                       ForEach(LocationConstants.egyptGovernorates, id: \.self) { governorate in
                                           Text(governorate).tag(governorate)
                                       }
                                   }
                                   .pickerStyle(MenuPickerStyle())

                                       ForEach(LocationConstants.countries, id: \.self) { country in
                                           Text(country).tag(country)
                                       }
                                  
                                 
                               }

                Button(action: {
                    saveAddress()
                }) {
                    Text("Save Address")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.orange)
                        .cornerRadius(12)
                }   .listRowBackground(Color.clear)
            }
            .scrollContentBackground(.hidden)
            .background(Color.forBackground)
            .navigationTitle("Add New Address")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(Color.forBackground, for: .navigationBar)
            .toolbar {
                            ToolbarItem(placement: .navigationBarLeading) {
                                Button {
                                    dismiss()
                                } label: {
                                    Image(systemName: "chevron.left")
                                        .foregroundColor(.orange)
                                        .font(.system(size: 18, weight: .bold))
                                }
                            }
                            ToolbarItem(placement: .principal) {
                                Text("Add New Address")
                                    .font(.system(size: 20, weight: .bold))
                                    .foregroundColor(.orange)
                            }
                        }
                        .alert(isPresented: $showAlert) {
                            Alert(
                                title: Text("Missing Information"),
                                message: Text(alertMessage),
                                dismissButton: .default(Text("OK"))
                            )
                        }
                    }
    }

    func saveAddress() {
        if firstName.isEmpty || lastName.isEmpty || address1.isEmpty || phone.isEmpty {
             alertMessage = "Please fill in all fields."
             showAlert = true
             return
         }
        let input = MailingAddressInput(
            address1: address1.gql,
            city: city.gql,
            country: country.gql,
            firstName: firstName.gql,
            lastName: lastName.gql,
            phone: phone.gql
        )
        viewModel.createAddress(input: input, token: token) {
            Task {
                await viewModel.getAddresses(accessToken: token)
                dismiss()
            }
        }

    }


}

