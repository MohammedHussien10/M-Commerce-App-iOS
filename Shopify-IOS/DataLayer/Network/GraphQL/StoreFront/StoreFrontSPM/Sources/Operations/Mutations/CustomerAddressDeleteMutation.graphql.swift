// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class CustomerAddressDeleteMutation: GraphQLMutation {
  public static let operationName: String = "customerAddressDelete"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"mutation customerAddressDelete($customerAccessToken: String!, $id: ID!) { customerAddressDelete(customerAccessToken: $customerAccessToken, id: $id) { __typename deletedCustomerAddressId customerUserErrors { __typename field message } userErrors { __typename field message } } }"#
    ))

  public var customerAccessToken: String
  public var id: ID

  public init(
    customerAccessToken: String,
    id: ID
  ) {
    self.customerAccessToken = customerAccessToken
    self.id = id
  }

  public var __variables: Variables? { [
    "customerAccessToken": customerAccessToken,
    "id": id
  ] }

  public struct Data: StoreFrontNameSpace.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { StoreFrontNameSpace.Objects.Mutation }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("customerAddressDelete", CustomerAddressDelete?.self, arguments: [
        "customerAccessToken": .variable("customerAccessToken"),
        "id": .variable("id")
      ]),
    ] }

    /// Permanently deletes the address of an existing customer.
    public var customerAddressDelete: CustomerAddressDelete? { __data["customerAddressDelete"] }

    /// CustomerAddressDelete
    ///
    /// Parent Type: `CustomerAddressDeletePayload`
    public struct CustomerAddressDelete: StoreFrontNameSpace.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: any ApolloAPI.ParentType { StoreFrontNameSpace.Objects.CustomerAddressDeletePayload }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("deletedCustomerAddressId", String?.self),
        .field("customerUserErrors", [CustomerUserError].self),
        .field("userErrors", [UserError].self),
      ] }

      /// ID of the deleted customer address.
      public var deletedCustomerAddressId: String? { __data["deletedCustomerAddressId"] }
      /// The list of errors that occurred from executing the mutation.
      public var customerUserErrors: [CustomerUserError] { __data["customerUserErrors"] }
      /// The list of errors that occurred from executing the mutation.
      @available(*, deprecated, message: "Use `customerUserErrors` instead.")
      public var userErrors: [UserError] { __data["userErrors"] }

      /// CustomerAddressDelete.CustomerUserError
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

      /// CustomerAddressDelete.UserError
      ///
      /// Parent Type: `UserError`
      public struct UserError: StoreFrontNameSpace.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { StoreFrontNameSpace.Objects.UserError }
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
