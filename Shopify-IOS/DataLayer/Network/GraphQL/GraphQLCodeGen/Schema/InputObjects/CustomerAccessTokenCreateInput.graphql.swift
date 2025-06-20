// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

extension GraphQLCodeGen {
  /// The input fields required to create a customer access token.
  struct CustomerAccessTokenCreateInput: InputObject {
    private(set) var __data: InputDict

    init(_ data: InputDict) {
      __data = data
    }

    init(
      email: String,
      password: String
    ) {
      __data = InputDict([
        "email": email,
        "password": password
      ])
    }

    /// The email associated to the customer.
    var email: String {
      get { __data["email"] }
      set { __data["email"] = newValue }
    }

    /// The login password to be used by the customer.
    var password: String {
      get { __data["password"] }
      set { __data["password"] = newValue }
    }
  }

}