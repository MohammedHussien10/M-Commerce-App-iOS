// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class CustomerAddressCreateMutation: GraphQLMutation {
  public static let operationName: String = "customerAddressCreate"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"mutation customerAddressCreate($address: MailingAddressInput!, $customerAccessToken: String!) { customerAddressCreate( address: $address customerAccessToken: $customerAccessToken ) { __typename customerAddress { __typename id address1 city country firstName lastName phone } customerUserErrors { __typename field message } } }"#
    ))

  public var address: MailingAddressInput
  public var customerAccessToken: String

  public init(
    address: MailingAddressInput,
    customerAccessToken: String
  ) {
    self.address = address
    self.customerAccessToken = customerAccessToken
  }

  public var __variables: Variables? { [
    "address": address,
    "customerAccessToken": customerAccessToken
  ] }

  public struct Data: StoreFrontNameSpace.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { StoreFrontNameSpace.Objects.Mutation }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("customerAddressCreate", CustomerAddressCreate?.self, arguments: [
        "address": .variable("address"),
        "customerAccessToken": .variable("customerAccessToken")
      ]),
    ] }

    /// Creates a new address for a customer.
    public var customerAddressCreate: CustomerAddressCreate? { __data["customerAddressCreate"] }

    /// CustomerAddressCreate
    ///
    /// Parent Type: `CustomerAddressCreatePayload`
    public struct CustomerAddressCreate: StoreFrontNameSpace.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: any ApolloAPI.ParentType { StoreFrontNameSpace.Objects.CustomerAddressCreatePayload }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("customerAddress", CustomerAddress?.self),
        .field("customerUserErrors", [CustomerUserError].self),
      ] }

      /// The new customer address object.
      public var customerAddress: CustomerAddress? { __data["customerAddress"] }
      /// The list of errors that occurred from executing the mutation.
      public var customerUserErrors: [CustomerUserError] { __data["customerUserErrors"] }

      /// CustomerAddressCreate.CustomerAddress
      ///
      /// Parent Type: `MailingAddress`
      public struct CustomerAddress: StoreFrontNameSpace.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { StoreFrontNameSpace.Objects.MailingAddress }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("id", StoreFrontNameSpace.ID.self),
          .field("address1", String?.self),
          .field("city", String?.self),
          .field("country", String?.self),
          .field("firstName", String?.self),
          .field("lastName", String?.self),
          .field("phone", String?.self),
        ] }

        /// A globally-unique ID.
        public var id: StoreFrontNameSpace.ID { __data["id"] }
        /// The first line of the address. Typically the street address or PO Box number.
        public var address1: String? { __data["address1"] }
        /// The name of the city, district, village, or town.
        public var city: String? { __data["city"] }
        /// The name of the country.
        public var country: String? { __data["country"] }
        /// The first name of the customer.
        public var firstName: String? { __data["firstName"] }
        /// The last name of the customer.
        public var lastName: String? { __data["lastName"] }
        /// A unique phone number for the customer.
        ///
        /// Formatted using E.164 standard. For example, _+16135551111_.
        public var phone: String? { __data["phone"] }
      }

      /// CustomerAddressCreate.CustomerUserError
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
