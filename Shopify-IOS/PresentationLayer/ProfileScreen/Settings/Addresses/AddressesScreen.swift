//
//  Addresses.swift
//  Shopify-IOS
//
//  Created by Macos on 09/06/2025.
//

import SwiftUI

struct Addresses: View {
    @StateObject private var viewModel = AddressViewModel(repository: RepositoryImp())

    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(viewModel.addresses) { address in
                        VStack(alignment: .leading) {
                            Text(address.addressName ?? "")
                                .font(.headline)
                            Text(address.phoneNumber ?? "")
                                .font(.subheadline)
                        }
                    }
                    .onDelete(perform: delete)
                }
                
                Button("➕ Add Dummy Address") {
                    viewModel.addAddress(addressName: "AinShams", city: "Cairo", country: "Egypt", detailedAddress: "18 Afifi St", personName: "Mohammed", phoneNumber: "0115414096")              
                }
                .padding(.bottom,100)
            }
            .navigationTitle("Addresses")
        }
    }.onAppear {
        viewModel.fetchProducts()
    }
    
    func delete(at offsets: IndexSet) {
        offsets.forEach { index in
            let address = viewModel.addresses[index]
            viewModel.deleteAddress(address)
        }
    }
}
