//
//  AddressUseCase.swift
//  Shopify-IOS
//
//  Created by JETS Mobile Lab7 on 24/06/2025.
//

import StoreFrontNameSpace

class AddressUseCase: AddressUseCaseProtocol {
    private let repository: RepositoryProtocol

       init(repository: RepositoryProtocol) {
           self.repository = repository
       }

    
    func createAddress(address: StoreFrontNameSpace.MailingAddressInput, token: String, completion: @escaping (Result<AddressModel, any Error>) -> Void) {
        repository.createAddress(address: address, token: token, completion: completion)
    }
    
    func updateAddress(id: String, address: StoreFrontNameSpace.MailingAddressInput, token: String, completion: @escaping (Result<AddressModel, any Error>) -> Void) {
        repository.updateAddress(id: id, address: address, token: token, completion: completion)
    }
    
 

    
    func delete(id: String, token: String, completion: @escaping (Result<String, Error>) -> Void) {
        repository.deleteAddress(id: id, token: token, completion: completion)
    }
    
    
    

    
    func updateDefaultAddress(id: String, accessToken: String, completion: @escaping (Result<Bool, any Error>) -> Void) {
        repository.setDefaultAddress(addressId: id, accessToken: accessToken, completion: completion)
    }

}
