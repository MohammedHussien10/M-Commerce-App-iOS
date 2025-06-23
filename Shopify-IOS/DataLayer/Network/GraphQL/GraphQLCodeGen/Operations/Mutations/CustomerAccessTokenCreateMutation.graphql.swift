// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

extension GraphQLCodeGen {
  class CustomerAccessTokenCreateMutation: GraphQLMutation {
    static let operationName: String = "CustomerAccessTokenCreate"
    static let operationDocument: ApolloAPI.OperationDocument = .init(
      definition: .init(
        #"mutation CustomerAccessTokenCreate($input: CustomerAccessTokenCreateInput!) { customerAccessTokenCreate(input: $input) { __typename customerAccessToken { __typename accessToken expiresAt } customerUserErrors { __typename field message } } }"#
      ))

    public var input: CustomerAccessTokenCreateInput

    public init(input: CustomerAccessTokenCreateInput) {
      self.input = input
    }

    public var __variables: Variables? { ["input": input] }

    struct Data: GraphQLCodeGen.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: any ApolloAPI.ParentType { GraphQLCodeGen.Objects.Mutation }
      static var __selections: [ApolloAPI.Selection] { [
        .field("customerAccessTokenCreate", CustomerAccessTokenCreate?.self, arguments: ["input": .variable("input")]),
      ] }

      /// Creates a customer access token.
      /// The customer access token is required to modify the customer object in any way.
      var customerAccessTokenCreate: CustomerAccessTokenCreate? { __data["customerAccessTokenCreate"] }

      /// CustomerAccessTokenCreate
      ///
      /// Parent Type: `CustomerAccessTokenCreatePayload`
      struct CustomerAccessTokenCreate: GraphQLCodeGen.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: any ApolloAPI.ParentType { GraphQLCodeGen.Objects.CustomerAccessTokenCreatePayload }
        static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("customerAccessToken", CustomerAccessToken?.self),
          .field("customerUserErrors", [CustomerUserError].self),
        ] }

        /// The newly created customer access token object.
        var customerAccessToken: CustomerAccessToken? { __data["customerAccessToken"] }
        /// The list of errors that occurred from executing the mutation.
        var customerUserErrors: [CustomerUserError] { __data["customerUserErrors"] }

        /// CustomerAccessTokenCreate.CustomerAccessToken
        ///
        /// Parent Type: `CustomerAccessToken`
        struct CustomerAccessToken: GraphQLCodeGen.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: any ApolloAPI.ParentType { GraphQLCodeGen.Objects.CustomerAccessToken }
          static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("accessToken", String.self),
            .field("expiresAt", GraphQLCodeGen.DateTime.self),
          ] }

          /// The customer’s access token.
          var accessToken: String { __data["accessToken"] }
          /// The date and time when the customer access token expires.
          var expiresAt: GraphQLCodeGen.DateTime { __data["expiresAt"] }
        }

        /// CustomerAccessTokenCreate.CustomerUserError
        ///
        /// Parent Type: `CustomerUserError`
        struct CustomerUserError: GraphQLCodeGen.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: any ApolloAPI.ParentType { GraphQLCodeGen.Objects.CustomerUserError }
          static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("field", [String]?.self),
            .field("message", String.self),
          ] }

          /// The path to the input field that caused the error.
          var field: [String]? { __data["field"] }
          /// The error message.
          var message: String { __data["message"] }
        }
      }
    }
  }

}