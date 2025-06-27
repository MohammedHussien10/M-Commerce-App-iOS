//
//  AddressUseCase.swift
//  Shopify-IOS
//
//  Created by JETS Mobile Lab7 on 24/06/2025.
//
import Foundation
import StoreFrontNameSpace

protocol AddressUseCaseProtocol{
    
    func createAddress(
        address: MailingAddressInput,
        token: String,
        completion: @escaping (
            Result<AddressModel, Error>
        ) -> Void
    )


    func updateAddress(
        id: String,
        address: MailingAddressInput,
        token: String,
        completion: @escaping (
            Result<AddressModel, Error>
        ) -> Void
    )

    func delete(id: String, token: String, completion: @escaping (Result<String, Error>) -> Void)
    
    func updateDefaultAddress(id: String, accessToken: String, completion: @escaping (Result<Bool, Error>) -> Void)
    
}
