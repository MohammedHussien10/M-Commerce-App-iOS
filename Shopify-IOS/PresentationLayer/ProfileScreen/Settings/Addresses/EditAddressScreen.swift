//
//  EditAddressScreen.swift
//  Shopify-IOS
//
//  Created by JETS Mobile Lab7 on 25/06/2025.
//

import SwiftUI
import StoreFrontNameSpace

struct EditAddressScreen: View {
    @Environment(\.dismiss) var dismiss

    @State private var firstName: String
    @State private var lastName: String
    @State private var address1: String
    @State private var city: String
    @State private var country: String
    @State private var phone: String

    let address: AddressModel
    @ObservedObject var viewModel: AddressViewModel
    let userToken = SessionManager.shared.accessToken


    init(address: AddressModel, viewModel: AddressViewModel) {
        self.address = address
        self.viewModel = viewModel
        _firstName = State(initialValue: address.firstName)
        _lastName = State(initialValue: address.lastName)
        _address1 = State(initialValue: address.address1)
        _city = State(initialValue: address.city)
        _country = State(initialValue: address.country)
        _phone = State(initialValue: address.phone)
    }

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

                                   Picker("Country", selection: $country) {
                                       ForEach(LocationConstants.countries, id: \.self) { country in
                                           Text(country).tag(country)
                                       }
                                   }
                                   .pickerStyle(MenuPickerStyle())
                               }

                Button(action: {
                    updateAddress()
                }) {
                    Text("Update Address")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.orange)
                        .cornerRadius(12)
                }
                .listRowBackground(Color.clear)
            }
            .scrollContentBackground(.hidden)
            .background(Color.forBackground)
            .navigationTitle("Edit Address")
            .navigationBarTitleDisplayMode(.inline)
                     .toolbarBackground(Color.forBackground, for: .navigationBar)
                     .toolbar {
                                  ToolbarItem(placement: .principal) {
                                      Text("Edit Address")
                                          .font(.system(size: 20, weight: .bold))
                                          .foregroundColor(.orange)
                                  }
                                  ToolbarItem(placement: .navigationBarLeading) {
                                      Button {
                                          dismiss()
                                      } label: {
                                          Image(systemName: "chevron.left")
                                              .foregroundColor(.orange)
                                              .font(.system(size: 18, weight: .bold))
                                      }
                                  }
                              }
        }
    }

    func updateAddress() {
        let input = MailingAddressInput(
            address1: address1.gql,
            city: city.gql,
            country: country.gql,
            firstName: firstName.gql,
            lastName: lastName.gql,
            phone: phone.gql
        )

        viewModel.updateAddress(id: address.id, newAddress: input, token: userToken)

        Task {
            await viewModel.getAddresses(accessToken: userToken)
            DispatchQueue.main.async {
                dismiss()
            }
        }


    }
}

