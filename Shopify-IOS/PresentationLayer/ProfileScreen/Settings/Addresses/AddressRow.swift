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
                } label: {
                    Label("Edit", systemImage: "pencil")
                }

                Button {
                    viewModel.makeDefaultAddress(id: address.id, accessToken: token)
                } label: {
                    Label("Default", systemImage: "star")
                }
                .tint(.yellow)
            }
    }
}
