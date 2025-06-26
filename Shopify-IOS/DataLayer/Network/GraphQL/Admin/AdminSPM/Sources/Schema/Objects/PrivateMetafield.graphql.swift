// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public extension Objects {
  /// Private metafields represent custom metadata that is attached to a resource.
  /// Private metafields are accessible only by the application that created them and only from the GraphQL Admin API.
  ///
  /// An application can create a maximum of 10 private metafields per shop resource.
  ///
  /// Private metafields are deprecated. Metafields created using a reserved namespace are private by default. See our guide for
  /// [migrating private metafields](https://shopify.dev/docs/apps/custom-data/metafields/migrate-private-metafields).
  static let PrivateMetafield = ApolloAPI.Object(
    typename: "PrivateMetafield",
    implementedInterfaces: [Interfaces.Node.self],
    keyFields: nil
  )
}