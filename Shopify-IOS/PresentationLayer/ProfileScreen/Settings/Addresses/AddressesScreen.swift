//
//  Addresses.swift
//  Shopify-IOS
//
//  Created by Macos on 09/06/2025.
//

import SwiftUI

struct AddressesScreen: View {
    // MARK: - Properties
    @StateObject private var addressViewModel = AddressViewModel(repository: RepositoryImp())
    @State private var showAddAddress = false
    @State private var showDeleteAlert = false
    @State private var indexSetToDelete: IndexSet? = nil
    // MARK: - Body
    var body: some View {
        NavigationStack {
            VStack (spacing : 0){
                // MARK: - Address List
                List {
                    ForEach(addressViewModel.addresses) { address in
                        VStack(alignment: .leading) {
                            Text("Address Name : \(address.addressName ?? "")")
                                .font(.headline)
                            Text("Address Details : \(address.detailedAddress ?? "")")
                                .font(.subheadline)
                            Text("Country : \(address.country ?? "")")
                                .font(.subheadline)
                            Text("City : \(address.city ?? "")")
                                .font(.subheadline)
                            Text("Name of Customer : \(address.personName ?? "")")
                                .font(.subheadline)
                            Text("Number Phone of Customer : \(address.phoneNumber ?? "")")
                                .font(.subheadline)
                            
                        }.padding(.vertical, 8)
                        
                    }
                    .onDelete { indexSet in
                        self.indexSetToDelete = indexSet
                        self.showDeleteAlert = true
                    }
                } .listStyle(.plain)
                // MARK: - Add Address Button
                Spacer(minLength: 10)
                Button(action: {
                    showAddAddress = true
                }) {
                    Text(" + Add New Address")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.orangeColor("FF7F00"))
                        .cornerRadius(12)
                        .padding(.horizontal)
                }
                .padding(.bottom, 90)
                .sheet(isPresented: $showAddAddress) {
                    AddAddressScreen(viewModel: addressViewModel)
                }
            }
            .navigationTitle("Addresses")
        }.onAppear {
            addressViewModel.getAllAddresses()
        }
        
        // MARK: - Delete Alert
        .alert("Are you sure you want to delete this address?", isPresented: $showDeleteAlert) {
            Button("Delete", role: .destructive) {
                if let indexSet = indexSetToDelete {
                    delete(at: indexSet)
                    indexSetToDelete = nil
                }
            }
            Button("Cancel", role: .cancel) {
                indexSetToDelete = nil
            }
        }
    }
    
    // MARK: - Functions
    func delete(at offsets: IndexSet) {
        offsets.forEach { index in
            let address = addressViewModel.addresses[index]
            addressViewModel.deleteAddress(address)
        }
    }
}
