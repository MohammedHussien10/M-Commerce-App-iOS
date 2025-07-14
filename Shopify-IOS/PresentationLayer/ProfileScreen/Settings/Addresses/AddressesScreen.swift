//
//  Addresses.swift
//  Shopify-IOS
//
//  Created by Macos on 09/06/2025.
//

import SwiftUI

struct AddressesScreen: View {
    @StateObject private var viewModel = AddressViewModel(
        useCase: AddressUseCase(repository: RepositoryImp(remoteDataSource: RemoteDataSource()))
    )
    @Environment(\.dismiss) private var dismiss
    @State private var showAddAddress = false
    @State private var selectedAddress: AddressModel? = nil
    @State private var showDeleteAlert = false
    @State private var addressToDelete: AddressModel? = nil
    @State private var showEditAddress = false
    let token = SessionManager.shared.accessToken
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    if viewModel.addresses.isEmpty {
                        Text("No addresses found.")
                            .foregroundColor(.forText.opacity(0.6))
                    } else {
                        List {
                            ForEach(viewModel.addresses) { address in
                                AddressRow(
                                    address: address,
                                    token: token,
                                    viewModel: viewModel,
                                    addressToDelete: $addressToDelete,
                                    showDeleteAlert: $showDeleteAlert,
                                    selectedAddress: $selectedAddress,
                                    showEditAddress: $showEditAddress
                                ) .listRowBackground(Color.forBackground)
                            }
                        }

                        .scrollContentBackground(.hidden)
                                              .background(Color.forBackground)
                                              .listStyle(.plain)
                    }

                    Button(action: {
                        showAddAddress = true
                    }) {
                        Text("+ Add New Address")
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.orange)
                            .cornerRadius(12)
                            .padding(.horizontal)
                    }
                    .padding(.bottom, 20)
                }

            }
            .background(Color.forBackground)
                        .navigationBarBackButtonHidden(true)
                        .navigationBarTitleDisplayMode(.inline)
                        .toolbarBackground(Color.forBackground, for: .navigationBar)
            .toolbar {
                
                ToolbarItem(placement: .principal) {
                    Text("Addresses")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.orange)
                }
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
            .onAppear {
                Task {
                  await viewModel.getAddresses(accessToken: token)
                }
            }
            .alert("Are you sure you want to delete this address?", isPresented: $showDeleteAlert) {
                Button("Delete", role: .destructive) {
                    if let address = addressToDelete {
                        viewModel.deleteAddress(id: address.id, token: token)
                    }
                }
                Button("Cancel", role: .cancel) {}
            }
            .sheet(isPresented: $showAddAddress) {
                AddAddressScreen(viewModel: viewModel)
            }
            .sheet(isPresented: $showEditAddress, onDismiss: {
                Task {
                    await viewModel.getAddresses(accessToken: token)
                }
            }) {
                if let address = selectedAddress {
                    EditAddressScreen(address: address, viewModel: viewModel)
                }
            }

            .alert(isPresented: Binding<Bool>(
                get: { viewModel.errorMessage != nil },
                set: { _ in viewModel.errorMessage = nil }
            )) {
                Alert(
                    title: Text("Error"),
                    message: Text(viewModel.errorMessage ?? ""),
                    dismissButton: .default(Text("OK"))
                )
            }
        }
    }
}
