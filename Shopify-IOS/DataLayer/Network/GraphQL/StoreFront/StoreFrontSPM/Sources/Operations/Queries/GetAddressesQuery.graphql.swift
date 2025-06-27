// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class GetAddressesQuery: GraphQLQuery {
  public static let operationName: String = "GetAddresses"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query GetAddresses($accessToken: String!) { customer(customerAccessToken: $accessToken) { __typename addresses(first: 20) { __typename edges { __typename node { __typename id address1 city country firstName lastName phone } } } defaultAddress { __typename id } } }"#
    ))

  public var accessToken: String

  public init(accessToken: String) {
    self.accessToken = accessToken
  }

  public var __variables: Variables? { ["accessToken": accessToken] }

  public struct Data: StoreFrontNameSpace.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { StoreFrontNameSpace.Objects.QueryRoot }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("customer", Customer?.self, arguments: ["customerAccessToken": .variable("accessToken")]),
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
        .field("addresses", Addresses.self, arguments: ["first": 20]),
        .field("defaultAddress", DefaultAddress?.self),
      ] }

      /// A list of addresses for the customer.
      public var addresses: Addresses { __data["addresses"] }
      /// The customer’s default address.
      public var defaultAddress: DefaultAddress? { __data["defaultAddress"] }

      /// Customer.Addresses
      ///
      /// Parent Type: `MailingAddressConnection`
      public struct Addresses: StoreFrontNameSpace.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { StoreFrontNameSpace.Objects.MailingAddressConnection }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("edges", [Edge].self),
        ] }

        /// A list of edges.
        public var edges: [Edge] { __data["edges"] }

        /// Customer.Addresses.Edge
        ///
        /// Parent Type: `MailingAddressEdge`
        public struct Edge: StoreFrontNameSpace.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: any ApolloAPI.ParentType { StoreFrontNameSpace.Objects.MailingAddressEdge }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("node", Node.self),
          ] }

          /// The item at the end of MailingAddressEdge.
          public var node: Node { __data["node"] }

          /// Customer.Addresses.Edge.Node
          ///
          /// Parent Type: `MailingAddress`
          public struct Node: StoreFrontNameSpace.SelectionSet {
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
        }
      }

      /// Customer.DefaultAddress
      ///
      /// Parent Type: `MailingAddress`
      public struct DefaultAddress: StoreFrontNameSpace.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { StoreFrontNameSpace.Objects.MailingAddress }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("id", StoreFrontNameSpace.ID.self),
        ] }

        /// A globally-unique ID.
        public var id: StoreFrontNameSpace.ID { __data["id"] }
      }
    }
  }
}
