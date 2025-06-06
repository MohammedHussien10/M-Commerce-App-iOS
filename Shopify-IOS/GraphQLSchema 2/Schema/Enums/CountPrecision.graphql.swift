// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

extension GraphQLSchema {
  /// The precision of the value returned by a count field.
  enum CountPrecision: String, EnumType {
    /// The count is exactly the value.
    case exact = "EXACT"
    /// The count is at least the value. A limit was reached.
    case atLeast = "AT_LEAST"
  }

}