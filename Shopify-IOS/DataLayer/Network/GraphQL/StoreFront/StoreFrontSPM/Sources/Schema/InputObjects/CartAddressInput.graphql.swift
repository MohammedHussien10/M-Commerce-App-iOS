// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

/// The input fields to provide exactly one of a variety of delivery address types.
public struct CartAddressInput: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    deliveryAddress: GraphQLNullable<CartDeliveryAddressInput> = nil,
    copyFromCustomerAddressId: GraphQLNullable<ID> = nil
  ) {
    __data = InputDict([
      "deliveryAddress": deliveryAddress,
      "copyFromCustomerAddressId": copyFromCustomerAddressId
    ])
  }

  /// A delivery address stored on this cart.
  public var deliveryAddress: GraphQLNullable<CartDeliveryAddressInput> {
    get { __data["deliveryAddress"] }
    set { __data["deliveryAddress"] = newValue }
  }

  /// Copies details from the customer address to an address on this cart.
  public var copyFromCustomerAddressId: GraphQLNullable<ID> {
    get { __data["copyFromCustomerAddressId"] }
    set { __data["copyFromCustomerAddressId"] = newValue }
  }
}
