// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class GetOrdersQuery: GraphQLQuery {
  public static let operationName: String = "getOrders"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query getOrders($first: Int, $query: String) { orders(first: $first, query: $query) { __typename edges { __typename node { __typename id name phone createdAt displayFinancialStatus displayFulfillmentStatus returnStatus phone totalPriceSet { __typename presentmentMoney { __typename amount currencyCode } shopMoney { __typename amount currencyCode } } billingAddress { __typename address1 firstName lastName city country zip phone id } } } } }"#
    ))

  public var first: GraphQLNullable<Int>
  public var query: GraphQLNullable<String>

  public init(
    first: GraphQLNullable<Int>,
    query: GraphQLNullable<String>
  ) {
    self.first = first
    self.query = query
  }

  public var __variables: Variables? { [
    "first": first,
    "query": query
  ] }

  public struct Data: AdminNameSpace.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { AdminNameSpace.Objects.QueryRoot }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("orders", Orders.self, arguments: [
        "first": .variable("first"),
        "query": .variable("query")
      ]),
    ] }

    /// Returns a list of [orders](https://shopify.dev/api/admin-graphql/latest/objects/Order) placed in the store, including data such as order status, customer, and line item details.
    /// Use the `orders` query to build reports, analyze sales performance, or automate fulfillment workflows. The `orders` query supports [pagination](https://shopify.dev/docs/api/usage/pagination-graphql),
    /// [sorting](https://shopify.dev/docs/api/admin-graphql/latest/queries/orders#argument-sortkey), and [filtering](https://shopify.dev/docs/api/admin-graphql/latest/queries/orders#argument-query).
    public var orders: Orders { __data["orders"] }

    /// Orders
    ///
    /// Parent Type: `OrderConnection`
    public struct Orders: AdminNameSpace.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: any ApolloAPI.ParentType { AdminNameSpace.Objects.OrderConnection }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("edges", [Edge].self),
      ] }

      /// The connection between the node and its parent. Each edge contains a minimum of the edge's cursor and the node.
      public var edges: [Edge] { __data["edges"] }

      /// Orders.Edge
      ///
      /// Parent Type: `OrderEdge`
      public struct Edge: AdminNameSpace.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { AdminNameSpace.Objects.OrderEdge }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("node", Node.self),
        ] }

        /// The item at the end of OrderEdge.
        public var node: Node { __data["node"] }

        /// Orders.Edge.Node
        ///
        /// Parent Type: `Order`
        public struct Node: AdminNameSpace.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: any ApolloAPI.ParentType { AdminNameSpace.Objects.Order }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("id", AdminNameSpace.ID.self),
            .field("name", String.self),
            .field("phone", String?.self),
            .field("createdAt", AdminNameSpace.DateTime.self),
            .field("displayFinancialStatus", GraphQLEnum<AdminNameSpace.OrderDisplayFinancialStatus>?.self),
            .field("displayFulfillmentStatus", GraphQLEnum<AdminNameSpace.OrderDisplayFulfillmentStatus>.self),
            .field("returnStatus", GraphQLEnum<AdminNameSpace.OrderReturnStatus>.self),
            .field("totalPriceSet", TotalPriceSet.self),
            .field("billingAddress", BillingAddress?.self),
          ] }

          /// A globally-unique ID.
          public var id: AdminNameSpace.ID { __data["id"] }
          /// The unique identifier for the order that appears on the order page in the Shopify admin and the <b>Order status</b> page.
          /// For example, "#1001", "EN1001", or "1001-A".
          /// This value isn't unique across multiple stores.
          public var name: String { __data["name"] }
          /// The phone number associated with the customer.
          public var phone: String? { __data["phone"] }
          /// Date and time when the order was created in Shopify.
          public var createdAt: AdminNameSpace.DateTime { __data["createdAt"] }
          /// The financial status of the order that can be shown to the merchant.
          /// This field doesn't capture all the details of an order's financial state. It should only be used for display summary purposes.
          public var displayFinancialStatus: GraphQLEnum<AdminNameSpace.OrderDisplayFinancialStatus>? { __data["displayFinancialStatus"] }
          /// The fulfillment status for the order that can be shown to the merchant.
          /// This field does not capture all the details of an order's fulfillment state. It should only be used for display summary purposes.
          /// For a more granular view of the fulfillment status, refer to the [FulfillmentOrder](https://shopify.dev/api/admin-graphql/latest/objects/FulfillmentOrder) object.
          public var displayFulfillmentStatus: GraphQLEnum<AdminNameSpace.OrderDisplayFulfillmentStatus> { __data["displayFulfillmentStatus"] }
          /// The order's aggregated return status for display purposes.
          public var returnStatus: GraphQLEnum<AdminNameSpace.OrderReturnStatus> { __data["returnStatus"] }
          /// The total price of the order, before returns, in shop and presentment currencies.
          /// This includes taxes and discounts.
          public var totalPriceSet: TotalPriceSet { __data["totalPriceSet"] }
          /// The billing address of the customer.
          public var billingAddress: BillingAddress? { __data["billingAddress"] }

          /// Orders.Edge.Node.TotalPriceSet
          ///
          /// Parent Type: `MoneyBag`
          public struct TotalPriceSet: AdminNameSpace.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: any ApolloAPI.ParentType { AdminNameSpace.Objects.MoneyBag }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("presentmentMoney", PresentmentMoney.self),
              .field("shopMoney", ShopMoney.self),
            ] }

            /// Amount in presentment currency.
            public var presentmentMoney: PresentmentMoney { __data["presentmentMoney"] }
            /// Amount in shop currency.
            public var shopMoney: ShopMoney { __data["shopMoney"] }

            /// Orders.Edge.Node.TotalPriceSet.PresentmentMoney
            ///
            /// Parent Type: `MoneyV2`
            public struct PresentmentMoney: AdminNameSpace.SelectionSet {
              public let __data: DataDict
              public init(_dataDict: DataDict) { __data = _dataDict }

              public static var __parentType: any ApolloAPI.ParentType { AdminNameSpace.Objects.MoneyV2 }
              public static var __selections: [ApolloAPI.Selection] { [
                .field("__typename", String.self),
                .field("amount", AdminNameSpace.Decimal.self),
                .field("currencyCode", GraphQLEnum<AdminNameSpace.CurrencyCode>.self),
              ] }

              /// A monetary value in decimal format, allowing for precise representation of cents or fractional
              /// currency. For example, 12.99.
              public var amount: AdminNameSpace.Decimal { __data["amount"] }
              /// The three-letter currency code that represents a world currency used in a store. Currency codes
              /// include standard [standard ISO 4217 codes](https://en.wikipedia.org/wiki/ISO_4217), legacy codes,
              /// and non-standard codes. For example, USD.
              public var currencyCode: GraphQLEnum<AdminNameSpace.CurrencyCode> { __data["currencyCode"] }
            }

            /// Orders.Edge.Node.TotalPriceSet.ShopMoney
            ///
            /// Parent Type: `MoneyV2`
            public struct ShopMoney: AdminNameSpace.SelectionSet {
              public let __data: DataDict
              public init(_dataDict: DataDict) { __data = _dataDict }

              public static var __parentType: any ApolloAPI.ParentType { AdminNameSpace.Objects.MoneyV2 }
              public static var __selections: [ApolloAPI.Selection] { [
                .field("__typename", String.self),
                .field("amount", AdminNameSpace.Decimal.self),
                .field("currencyCode", GraphQLEnum<AdminNameSpace.CurrencyCode>.self),
              ] }

              /// A monetary value in decimal format, allowing for precise representation of cents or fractional
              /// currency. For example, 12.99.
              public var amount: AdminNameSpace.Decimal { __data["amount"] }
              /// The three-letter currency code that represents a world currency used in a store. Currency codes
              /// include standard [standard ISO 4217 codes](https://en.wikipedia.org/wiki/ISO_4217), legacy codes,
              /// and non-standard codes. For example, USD.
              public var currencyCode: GraphQLEnum<AdminNameSpace.CurrencyCode> { __data["currencyCode"] }
            }
          }

          /// Orders.Edge.Node.BillingAddress
          ///
          /// Parent Type: `MailingAddress`
          public struct BillingAddress: AdminNameSpace.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: any ApolloAPI.ParentType { AdminNameSpace.Objects.MailingAddress }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("address1", String?.self),
              .field("firstName", String?.self),
              .field("lastName", String?.self),
              .field("city", String?.self),
              .field("country", String?.self),
              .field("zip", String?.self),
              .field("phone", String?.self),
              .field("id", AdminNameSpace.ID.self),
            ] }

            /// The first line of the address. Typically the street address or PO Box number.
            public var address1: String? { __data["address1"] }
            /// The first name of the customer.
            public var firstName: String? { __data["firstName"] }
            /// The last name of the customer.
            public var lastName: String? { __data["lastName"] }
            /// The name of the city, district, village, or town.
            public var city: String? { __data["city"] }
            /// The name of the country.
            public var country: String? { __data["country"] }
            /// The zip or postal code of the address.
            public var zip: String? { __data["zip"] }
            /// A unique phone number for the customer.
            public var phone: String? { __data["phone"] }
            /// A globally-unique ID.
            public var id: AdminNameSpace.ID { __data["id"] }
          }
        }
      }
    }
  }
}
