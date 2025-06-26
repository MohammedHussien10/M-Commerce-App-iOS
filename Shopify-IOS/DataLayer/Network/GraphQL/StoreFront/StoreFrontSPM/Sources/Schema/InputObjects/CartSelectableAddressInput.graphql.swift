// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

/// The input fields for a selectable delivery address in a cart.
public struct CartSelectableAddressInput: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    address: CartAddressInput,
    selected: GraphQLNullable<Bool> = nil,
    oneTimeUse: GraphQLNullable<Bool> = nil,
    validationStrategy: GraphQLNullable<GraphQLEnum<DeliveryAddressValidationStrategy>> = nil
  ) {
    __data = InputDict([
      "address": address,
      "selected": selected,
      "oneTimeUse": oneTimeUse,
      "validationStrategy": validationStrategy
    ])
  }

  /// Exactly one kind of delivery address.
  public var address: CartAddressInput {
    get { __data["address"] }
    set { __data["address"] = newValue }
  }

  /// Sets exactly one address as pre-selected for the buyer.
  public var selected: GraphQLNullable<Bool> {
    get { __data["selected"] }
    set { __data["selected"] = newValue }
  }

  /// When true, this delivery address will not be associated with the buyer after a successful checkout.
  public var oneTimeUse: GraphQLNullable<Bool> {
    get { __data["oneTimeUse"] }
    set { __data["oneTimeUse"] = newValue }
  }

  /// Defines what kind of address validation is requested.
  public var validationStrategy: GraphQLNullable<GraphQLEnum<DeliveryAddressValidationStrategy>> {
    get { __data["validationStrategy"] }
    set { __data["validationStrategy"] = newValue }
  }
}
