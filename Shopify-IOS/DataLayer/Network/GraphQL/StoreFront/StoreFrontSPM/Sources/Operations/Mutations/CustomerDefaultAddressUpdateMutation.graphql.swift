// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class CustomerDefaultAddressUpdateMutation: GraphQLMutation {
  public static let operationName: String = "customerDefaultAddressUpdate"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"mutation customerDefaultAddressUpdate($addressId: ID!, $customerAccessToken: String!) { customerDefaultAddressUpdate( addressId: $addressId customerAccessToken: $customerAccessToken ) { __typename customer { __typename id defaultAddress { __typename id address1 city country } } customerUserErrors { __typename field message } } }"#
    ))

  public var addressId: ID
  public var customerAccessToken: String

  public init(
    addressId: ID,
    customerAccessToken: String
  ) {
    self.addressId = addressId
    self.customerAccessToken = customerAccessToken
  }

  public var __variables: Variables? { [
    "addressId": addressId,
    "customerAccessToken": customerAccessToken
  ] }

  public struct Data: StoreFrontNameSpace.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { StoreFrontNameSpace.Objects.Mutation }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("customerDefaultAddressUpdate", CustomerDefaultAddressUpdate?.self, arguments: [
        "addressId": .variable("addressId"),
        "customerAccessToken": .variable("customerAccessToken")
      ]),
    ] }

    /// Updates the default address of an existing customer.
    public var customerDefaultAddressUpdate: CustomerDefaultAddressUpdate? { __data["customerDefaultAddressUpdate"] }

    /// CustomerDefaultAddressUpdate
    ///
    /// Parent Type: `CustomerDefaultAddressUpdatePayload`
    public struct CustomerDefaultAddressUpdate: StoreFrontNameSpace.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: any ApolloAPI.ParentType { StoreFrontNameSpace.Objects.CustomerDefaultAddressUpdatePayload }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("customer", Customer?.self),
        .field("customerUserErrors", [CustomerUserError].self),
      ] }

      /// The updated customer object.
      public var customer: Customer? { __data["customer"] }
      /// The list of errors that occurred from executing the mutation.
      public var customerUserErrors: [CustomerUserError] { __data["customerUserErrors"] }

      /// CustomerDefaultAddressUpdate.Customer
      ///
      /// Parent Type: `Customer`
      public struct Customer: StoreFrontNameSpace.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { StoreFrontNameSpace.Objects.Customer }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("id", StoreFrontNameSpace.ID.self),
          .field("defaultAddress", DefaultAddress?.self),
        ] }

        /// A unique ID for the customer.
        public var id: StoreFrontNameSpace.ID { __data["id"] }
        /// The customer’s default address.
        public var defaultAddress: DefaultAddress? { __data["defaultAddress"] }

        /// CustomerDefaultAddressUpdate.Customer.DefaultAddress
        ///
        /// Parent Type: `MailingAddress`
        public struct DefaultAddress: StoreFrontNameSpace.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: any ApolloAPI.ParentType { StoreFrontNameSpace.Objects.MailingAddress }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("id", StoreFrontNameSpace.ID.self),
            .field("address1", String?.self),
            .field("city", String?.self),
            .field("country", String?.self),
          ] }

          /// A globally-unique ID.
          public var id: StoreFrontNameSpace.ID { __data["id"] }
          /// The first line of the address. Typically the street address or PO Box number.
          public var address1: String? { __data["address1"] }
          /// The name of the city, district, village, or town.
          public var city: String? { __data["city"] }
          /// The name of the country.
          public var country: String? { __data["country"] }
        }
      }

      /// CustomerDefaultAddressUpdate.CustomerUserError
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
