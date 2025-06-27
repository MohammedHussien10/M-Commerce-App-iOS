// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

/// The input fields for delivery address preferences.
public struct DeliveryAddressInput: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    deliveryAddress: GraphQLNullable<MailingAddressInput> = nil,
    oneTimeUse: GraphQLNullable<Bool> = nil,
    deliveryAddressValidationStrategy: GraphQLNullable<GraphQLEnum<DeliveryAddressValidationStrategy>> = nil,
    customerAddressId: GraphQLNullable<ID> = nil
  ) {
    __data = InputDict([
      "deliveryAddress": deliveryAddress,
      "oneTimeUse": oneTimeUse,
      "deliveryAddressValidationStrategy": deliveryAddressValidationStrategy,
      "customerAddressId": customerAddressId
    ])
  }

  /// A delivery address preference of a buyer that is interacting with the cart.
  public var deliveryAddress: GraphQLNullable<MailingAddressInput> {
    get { __data["deliveryAddress"] }
    set { __data["deliveryAddress"] = newValue }
  }

  /// Whether the given delivery address is considered to be a one-time use address. One-time use addresses do not
  /// get persisted to the buyer's personal addresses when checking out.
  public var oneTimeUse: GraphQLNullable<Bool> {
    get { __data["oneTimeUse"] }
    set { __data["oneTimeUse"] = newValue }
  }

  /// Defines what kind of address validation is requested.
  public var deliveryAddressValidationStrategy: GraphQLNullable<GraphQLEnum<DeliveryAddressValidationStrategy>> {
    get { __data["deliveryAddressValidationStrategy"] }
    set { __data["deliveryAddressValidationStrategy"] = newValue }
  }

  /// The ID of a customer address that is associated with the buyer that is interacting with the cart.
  public var customerAddressId: GraphQLNullable<ID> {
    get { __data["customerAddressId"] }
    set { __data["customerAddressId"] = newValue }
  }
}
