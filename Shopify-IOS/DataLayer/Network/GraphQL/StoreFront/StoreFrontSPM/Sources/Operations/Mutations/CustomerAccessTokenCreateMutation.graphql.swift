// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class CustomerAccessTokenCreateMutation: GraphQLMutation {
  public static let operationName: String = "CustomerAccessTokenCreate"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"mutation CustomerAccessTokenCreate($input: CustomerAccessTokenCreateInput!) { customerAccessTokenCreate(input: $input) { __typename customerAccessToken { __typename accessToken expiresAt } customerUserErrors { __typename field message } } }"#
    ))

  public var input: CustomerAccessTokenCreateInput

  public init(input: CustomerAccessTokenCreateInput) {
    self.input = input
  }

  public var __variables: Variables? { ["input": input] }

  public struct Data: StoreFrontNameSpace.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { StoreFrontNameSpace.Objects.Mutation }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("customerAccessTokenCreate", CustomerAccessTokenCreate?.self, arguments: ["input": .variable("input")]),
    ] }

    /// Creates a customer access token.
    /// The customer access token is required to modify the customer object in any way.
    public var customerAccessTokenCreate: CustomerAccessTokenCreate? { __data["customerAccessTokenCreate"] }

    /// CustomerAccessTokenCreate
    ///
    /// Parent Type: `CustomerAccessTokenCreatePayload`
    public struct CustomerAccessTokenCreate: StoreFrontNameSpace.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: any ApolloAPI.ParentType { StoreFrontNameSpace.Objects.CustomerAccessTokenCreatePayload }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("customerAccessToken", CustomerAccessToken?.self),
        .field("customerUserErrors", [CustomerUserError].self),
      ] }

      /// The newly created customer access token object.
      public var customerAccessToken: CustomerAccessToken? { __data["customerAccessToken"] }
      /// The list of errors that occurred from executing the mutation.
      public var customerUserErrors: [CustomerUserError] { __data["customerUserErrors"] }

      /// CustomerAccessTokenCreate.CustomerAccessToken
      ///
      /// Parent Type: `CustomerAccessToken`
      public struct CustomerAccessToken: StoreFrontNameSpace.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { StoreFrontNameSpace.Objects.CustomerAccessToken }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("accessToken", String.self),
          .field("expiresAt", StoreFrontNameSpace.DateTime.self),
        ] }

        /// The customer’s access token.
        public var accessToken: String { __data["accessToken"] }
        /// The date and time when the customer access token expires.
        public var expiresAt: StoreFrontNameSpace.DateTime { __data["expiresAt"] }
      }

      /// CustomerAccessTokenCreate.CustomerUserError
      ///
      /// Parent Type: `CustomerUserError`
      public struct CustomerUserError: StoreFrontNameSpace.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { StoreFrontNameSpace.Objects.CustomerUserError }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("field", [String]?.self),
          .field("message", String.self),
        ] }

        /// The path to the input field that caused the error.
        public var field: [String]? { __data["field"] }
        /// The error message.
        public var message: String { __data["message"] }
      }
    }
  }
}
