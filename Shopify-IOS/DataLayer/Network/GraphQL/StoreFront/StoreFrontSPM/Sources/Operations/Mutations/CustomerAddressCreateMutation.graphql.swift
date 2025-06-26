// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class CustomerAddressCreateMutation: GraphQLMutation {
  public static let operationName: String = "customerAddressCreate"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"mutation customerAddressCreate($customerAccessToken: String!, $address: MailingAddressInput!) { customerAddressCreate( customerAccessToken: $customerAccessToken address: $address ) { __typename customerAddress { __typename address1 address2 city country id phone zip } } }"#
    ))

  public var customerAccessToken: String
  public var address: MailingAddressInput

  public init(
    customerAccessToken: String,
    address: MailingAddressInput
  ) {
    self.customerAccessToken = customerAccessToken
    self.address = address
  }

  public var __variables: Variables? { [
    "customerAccessToken": customerAccessToken,
    "address": address
  ] }

  public struct Data: StoreFrontNameSpace.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { StoreFrontNameSpace.Objects.Mutation }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("customerAddressCreate", CustomerAddressCreate?.self, arguments: [
        "customerAccessToken": .variable("customerAccessToken"),
        "address": .variable("address")
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
      ] }

      /// The new customer address object.
      public var customerAddress: CustomerAddress? { __data["customerAddress"] }

      /// CustomerAddressCreate.CustomerAddress
      ///
      /// Parent Type: `MailingAddress`
      public struct CustomerAddress: StoreFrontNameSpace.SelectionSet {
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
          .field("phone", String?.self),
          .field("zip", String?.self),
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
        /// A unique phone number for the customer.
        ///
        /// Formatted using E.164 standard. For example, _+16135551111_.
        public var phone: String? { __data["phone"] }
        /// The zip or postal code of the address.
        public var zip: String? { __data["zip"] }
      }
    }
  }
}
