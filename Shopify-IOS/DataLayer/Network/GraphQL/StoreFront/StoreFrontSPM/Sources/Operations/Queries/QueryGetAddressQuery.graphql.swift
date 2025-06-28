// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class QueryGetAddressQuery: GraphQLQuery {
  public static let operationName: String = "QueryGetAddress"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query QueryGetAddress($customerAccessToken: String!, $first: Int) { customer(customerAccessToken: $customerAccessToken) { addresses(first: $first) { __typename nodes { __typename address1 address2 city country id zip phone } } __typename email firstName lastName phone id displayName } }"#
    ))

  public var customerAccessToken: String
  public var first: GraphQLNullable<Int>

  public init(
    customerAccessToken: String,
    first: GraphQLNullable<Int>
  ) {
    self.customerAccessToken = customerAccessToken
    self.first = first
  }

  public var __variables: Variables? { [
    "customerAccessToken": customerAccessToken,
    "first": first
  ] }

  public struct Data: StoreFrontNameSpace.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { StoreFrontNameSpace.Objects.QueryRoot }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("customer", Customer?.self, arguments: ["customerAccessToken": .variable("customerAccessToken")]),
    ] }

    /// The customer associated with the given access token. Tokens are obtained by using the
    /// [`customerAccessTokenCreate` mutation](https://shopify.dev/docs/api/storefront/latest/mutations/customerAccessTokenCreate).
    public var customer: Customer? { __data["customer"] }

    /// Customer
    ///
    /// Parent Type: `Customer`
    public struct Customer: StoreFrontNameSpace.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: any ApolloAPI.ParentType { StoreFrontNameSpace.Objects.Customer }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("addresses", Addresses.self, arguments: ["first": .variable("first")]),
        .field("email", String?.self),
        .field("firstName", String?.self),
        .field("lastName", String?.self),
        .field("phone", String?.self),
        .field("id", StoreFrontNameSpace.ID.self),
        .field("displayName", String.self),
      ] }

      /// A list of addresses for the customer.
      public var addresses: Addresses { __data["addresses"] }
      /// The customer’s email address.
      public var email: String? { __data["email"] }
      /// The customer’s first name.
      public var firstName: String? { __data["firstName"] }
      /// The customer’s last name.
      public var lastName: String? { __data["lastName"] }
      /// The customer’s phone number.
      public var phone: String? { __data["phone"] }
      /// A unique ID for the customer.
      public var id: StoreFrontNameSpace.ID { __data["id"] }
      /// The customer’s name, email or phone number.
      public var displayName: String { __data["displayName"] }

      /// Customer.Addresses
      ///
      /// Parent Type: `MailingAddressConnection`
      public struct Addresses: StoreFrontNameSpace.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { StoreFrontNameSpace.Objects.MailingAddressConnection }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("nodes", [Node].self),
        ] }

        /// A list of the nodes contained in MailingAddressEdge.
        public var nodes: [Node] { __data["nodes"] }

        /// Customer.Addresses.Node
        ///
        /// Parent Type: `MailingAddress`
        public struct Node: StoreFrontNameSpace.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: any ApolloAPI.ParentType { StoreFrontNameSpace.Objects.MailingAddress }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("address1", String?.self),
            .field("address2", String?.self),
            .field("city", String?.self),
            .field("country", String?.self),
            .field("id", StoreFrontNameSpace.ID.self),
            .field("zip", String?.self),
            .field("phone", String?.self),
          ] }

          /// The first line of the address. Typically the street address or PO Box number.
          public var address1: String? { __data["address1"] }
          /// The second line of the address. Typically the number of the apartment, suite, or unit.
          public var address2: String? { __data["address2"] }
          /// The name of the city, district, village, or town.
          public var city: String? { __data["city"] }
          /// The name of the country.
          public var country: String? { __data["country"] }
          /// A globally-unique ID.
          public var id: StoreFrontNameSpace.ID { __data["id"] }
          /// The zip or postal code of the address.
          public var zip: String? { __data["zip"] }
          /// A unique phone number for the customer.
          ///
          /// Formatted using E.164 standard. For example, _+16135551111_.
          public var phone: String? { __data["phone"] }
        }
      }
    }
  }
}
