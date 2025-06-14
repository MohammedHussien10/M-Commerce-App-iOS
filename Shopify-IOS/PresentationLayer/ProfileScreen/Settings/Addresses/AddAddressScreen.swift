//
//  AddAddressScreen.swift
//  Shopify-IOS
//
//  Created by Macos on 14/06/2025.
//

import SwiftUI

// MARK: - AddAddressScreen

struct AddAddressScreen: View {
    // MARK: - Environment
    @Environment(\.presentationMode) var presentationMode
    // MARK: - State Properties
    @State private var addressName = ""
    @State private var city = ""
    @State private var country = ""
    @State private var detailedAddress = ""
    @State private var personName = ""
    @State private var phoneNumber = ""
    // MARK: - ViewModel
    @ObservedObject var viewModel: AddressViewModel
    // MARK: - Body
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                // MARK: - Address Form
                Form {
                    Section(header: Text("Personal Info")) {
                        TextField("Name", text: $personName)
                        TextField("Phone", text: $phoneNumber)
                    }
                    
                    Section(header: Text("Address Info")) {
                        TextField("Address Name", text: $addressName)
                        TextField("Details Address", text: $detailedAddress)
                        TextField("Country", text: $country)
                        TextField("City", text: $city)
                        
                    }
                    
                }
                // MARK: - Save Button
                Button(action: {
                    saveAddress()
                }) {
                    Text("Save Address")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.orangeColor("FF7F00"))
                        .cornerRadius(12)
                        .padding(.horizontal)
                }.padding(.vertical, 10)
            }
            .navigationTitle("Add New Address")
        }
    }
    // MARK: - Helper Methods
    func saveAddress() {
        viewModel.addAddress(
            addressName: addressName,
            city: city,
            country: country,
            detailedAddress: detailedAddress,
            personName: personName,
            phoneNumber: phoneNumber
        )
        
        presentationMode.wrappedValue.dismiss()
    }
    
}
