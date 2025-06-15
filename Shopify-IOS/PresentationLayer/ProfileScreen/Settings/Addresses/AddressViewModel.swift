//
//  AddressViewModel.swift
//  Shopify-IOS
//
//  Created by Macos on 13/06/2025.
//

import Foundation


// MARK: - AddressViewModel

class AddressViewModel:ObservableObject{
    
    // MARK: - Published Properties
    @Published var addresses:[AddressEntity] = []
    // MARK: - Dependencies
    private let repository: RepositoryProtocol
    // MARK: - Initialization
    init(repository: RepositoryProtocol) {
        self.repository = repository
    }
    // MARK: - Public Methods
    func getAllAddresses(){
        addresses = repository.getAllAddresses()
    }
    
    
    func addAddress(addressName: String, city: String, country: String, detailedAddress: String, personName: String, phoneNumber: String){
        let newAddress = CoreDataManager.shared.create(entity: AddressEntity.self)
        
        newAddress.id = UUID()
        newAddress.addressName = addressName
        newAddress.city = city
        newAddress.country = country
        newAddress.detailedAddress = detailedAddress
        newAddress.personName = personName
        newAddress.phoneNumber = phoneNumber
        
        repository.addAddress(newAddress)
        getAllAddresses()
    }
    
    
    func deleteAddress(_ address: AddressEntity) {
        repository.deleteAddress(address)
        getAllAddresses()
    }
    
    func deleteAllAddresses() {
        repository.deleteAllAddresses()
        getAllAddresses()
    }
    
    
}
