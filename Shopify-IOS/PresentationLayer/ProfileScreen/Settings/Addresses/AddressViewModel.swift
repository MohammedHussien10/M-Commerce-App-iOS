//
//  AddressViewModel.swift
//  Shopify-IOS
//
//  Created by Macos on 13/06/2025.
//

import Foundation
import StoreFrontNameSpace

// MARK: - AddressViewModel

class AddressViewModel: ObservableObject {
    private let useCase: AddressUseCaseProtocol
    @Published var isLoading = false
    @Published var errorMessage: String?
    @Published var addresses: [AddressModel] = []
    
    init(useCase: AddressUseCaseProtocol) {
        self.useCase = useCase
    }
    
    func createAddress(input: MailingAddressInput, token: String, completion: @escaping () -> Void) {
        useCase.createAddress(address: input, token: token) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let newAddress):
                    let model = AddressModel(
                        id: newAddress.id,
                        firstName: newAddress.firstName,
                        lastName: newAddress.lastName ,
                        address1: newAddress.address1,
                        city: newAddress.city,
                        country: newAddress.country,
                        phone: newAddress.phone
                    )
                    self.addresses.append(model)
                    completion()
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                }
            }
        }
    }


    
    func deleteAddress(id: String, token: String) {
            useCase.delete(id: id, token: token) { result in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let deletedId):
                        self.addresses.removeAll { $0.id == deletedId }
                    case .failure(let error):
                        self.errorMessage = error.localizedDescription
                    }
                }
            }
        }
    
    func updateAddress(id: String, newAddress: MailingAddressInput, token: String) {
            useCase.updateAddress(id: id, address: newAddress, token: token) { result in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let updatedAddress):
                        let model = AddressModel(
                            id: updatedAddress.id,
                            firstName: updatedAddress.firstName,
                            lastName: updatedAddress.lastName,
                            address1: updatedAddress.address1 ,
                            city: updatedAddress.city,
                            country: updatedAddress.country,
                            phone: updatedAddress.phone
                        )

                        if let index = self.addresses.firstIndex(where: { $0.id == model.id }) {
                            self.addresses[index] = model
                        }
                    case .failure(let error):
                        self.errorMessage = error.localizedDescription
                    }
                }
            }
        }

    
    func makeDefaultAddress(id: String, accessToken: String) {
            isLoading = true
            useCase.updateDefaultAddress(id: id, accessToken: accessToken) { [weak self] result in
                DispatchQueue.main.async {
                    self?.isLoading = false
                    switch result {
                    case .success:
                        print("Default address updated")
                    case .failure(let error):
                        self?.errorMessage = error.localizedDescription
                    }
                }
            }
        }
    
    @MainActor
    func getAddresses(accessToken: String) async {
        let query = GetAddressesQuery(accessToken: accessToken)

        await withCheckedContinuation { continuation in
            NetworkManager.sharedStoreFront.queryGraphQLRequest(query: query) { [weak self] result in
                guard let self = self else {
                    continuation.resume()
                    return
                }
                switch result {
                case .success(let data):
                    if let customer = data.customer {
                        let defaultId = customer.defaultAddress?.id
                        self.addresses = customer.addresses.toDomain(defaultId: defaultId)
                    } else {
                        self.addresses = []
                    }
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                }

                continuation.resume()
            }
        }
    }
}
