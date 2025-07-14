//
//  AddressRow.swift
//  Shopify-IOS
//
//  Created by JETS Mobile Lab7 on 27/06/2025.
//

import SwiftUI

struct AddressRow: View {
    let address: AddressModel
    let token: String
    @ObservedObject var viewModel: AddressViewModel
    @Binding var addressToDelete: AddressModel?
    @Binding var showDeleteAlert: Bool
    @Binding var selectedAddress: AddressModel?
    @Binding var showEditAddress: Bool
    var body: some View {
        AddressCell(address: address)
            .swipeActions {
                Button(role: .destructive) {
                    addressToDelete = address
                    showDeleteAlert = true
                } label: {
                    Label("Delete", systemImage: "trash")
                }

                Button {
                    selectedAddress = address
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        showEditAddress = true
                        
                    }
                } label: {
                    Label("Edit", systemImage: "pencil")
                }


            }

    }
}
