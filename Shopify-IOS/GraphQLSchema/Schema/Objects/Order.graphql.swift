// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

extension GraphQLSchema.Objects {
  /// An order is a customer’s completed request to purchase one or more products from a shop. An order is created when a customer completes the checkout process, during which time they provides an email address, billing address and payment information.
  static let Order = ApolloAPI.Object(
    typename: "Order",
    implementedInterfaces: [
      GraphQLSchema.Interfaces.HasMetafields.self,
      GraphQLSchema.Interfaces.Node.self
    ],
    keyFields: nil
  )
}