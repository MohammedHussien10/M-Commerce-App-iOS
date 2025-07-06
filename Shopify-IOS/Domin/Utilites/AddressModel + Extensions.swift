//
//  Untitled.swift
//  Shopify-IOS
//
//  Created by JETS Mobile Lab7 on 24/06/2025.
//
import StoreFrontNameSpace
import AdminNameSpace

extension AddressModel {
    
    init(from address: StoreFrontNameSpace.CustomerAddressCreateMutation.Data.CustomerAddressCreate.CustomerAddress) {
        self.id = address.id
        self.firstName = address.firstName ?? ""
        self.lastName = address.lastName ?? ""
        self.address1 = address.address1 ?? ""
        self.city = address.city ?? ""
        self.country = address.country ?? ""
        self.phone = address.phone ?? ""
    }

    init(from address: StoreFrontNameSpace.CustomerAddressUpdateMutation.Data.CustomerAddressUpdate.CustomerAddress) {
        self.id = address.id
        self.firstName = address.firstName ?? ""
        self.lastName = address.lastName ?? ""
        self.address1 = address.address1 ?? ""
        self.city = address.city ?? ""
        self.country = address.country ?? ""
        self.phone = address.phone ?? ""
       
    }
    init(from node: GetAddressesQuery.Data.Customer.Addresses.Edge.Node, isDefault: Bool) {
        self.id = node.id
        self.firstName = node.firstName ?? ""
        self.lastName = node.lastName ?? ""
        self.address1 = node.address1 ?? ""
        self.city = node.city ?? ""
        self.country = node.country ?? ""
        self.phone = node.phone ?? ""
        self.isDefault = isDefault
    }
    
    


}

extension GetAddressesQuery.Data.Customer.Addresses: Mappable {
    typealias DomainModel = [AddressModel]
    
    func toDomain() -> [AddressModel] {
        return toDomain(defaultId: nil)
    }
    
    func toDomain(defaultId: String?) -> [AddressModel] {
        return self.edges.map { edge in
            edge.node.toDomain(isDefault: edge.node.id == defaultId)
        }
    }
}

extension GetAddressesQuery.Data.Customer.Addresses.Edge.Node {
    func toDomain(isDefault: Bool = false) -> AddressModel {
        return AddressModel(
            id: id,
            firstName: firstName ?? "",
            lastName: lastName ?? "",
            address1: address1 ?? "",
            city: city ?? "",
            country: country ?? "",
            phone: phone ?? "",
            isDefault: isDefault
        )
    }
}

extension String {
    var gql: GraphQLNullable<String> {
        return .some(self)
    }
}


extension AddressModel {
    func toAdminMailingAddressInput() -> AdminNameSpace.MailingAddressInput {
        return AdminNameSpace.MailingAddressInput(
            address1: self.address1.gql,
            city: self.city.gql,
            firstName: self.firstName.gql,
            lastName: self.lastName.gql,
            phone: self.phone.gql
        )
    }
}
