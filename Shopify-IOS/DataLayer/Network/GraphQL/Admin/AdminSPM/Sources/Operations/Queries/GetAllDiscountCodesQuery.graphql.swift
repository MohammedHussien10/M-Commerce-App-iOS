// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class GetAllDiscountCodesQuery: GraphQLQuery {
  public static let operationName: String = "getAllDiscountCodes"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query getAllDiscountCodes($first: Int) { codeDiscountNodes(first: $first) { __typename nodes { __typename id codeDiscount { __typename ... on DiscountCodeBasic { title summary usageLimit status customerGets { __typename items { __typename } value { __typename ... on DiscountAmount { amount { __typename amount currencyCode } } ... on DiscountPercentage { percentage } } } codes(first: $first) { __typename nodes { __typename code id } } } } } } }"#
    ))

  public var first: GraphQLNullable<Int>

  public init(first: GraphQLNullable<Int>) {
    self.first = first
  }

  public var __variables: Variables? { ["first": first] }

  public struct Data: AdminNameSpace.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { AdminNameSpace.Objects.QueryRoot }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("codeDiscountNodes", CodeDiscountNodes.self, arguments: ["first": .variable("first")]),
    ] }

    /// Returns a list of [code-based discounts](https://help.shopify.com/manual/discounts/discount-types#discount-codes).
    public var codeDiscountNodes: CodeDiscountNodes { __data["codeDiscountNodes"] }

    /// CodeDiscountNodes
    ///
    /// Parent Type: `DiscountCodeNodeConnection`
    public struct CodeDiscountNodes: AdminNameSpace.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: any ApolloAPI.ParentType { AdminNameSpace.Objects.DiscountCodeNodeConnection }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("nodes", [Node].self),
      ] }

      /// A list of nodes that are contained in DiscountCodeNodeEdge. You can fetch data about an individual node, or you can follow the edges to fetch data about a collection of related nodes. At each node, you specify the fields that you want to retrieve.
      public var nodes: [Node] { __data["nodes"] }

      /// CodeDiscountNodes.Node
      ///
      /// Parent Type: `DiscountCodeNode`
      public struct Node: AdminNameSpace.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { AdminNameSpace.Objects.DiscountCodeNode }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("id", AdminNameSpace.ID.self),
          .field("codeDiscount", CodeDiscount.self),
        ] }

        /// A globally-unique ID.
        public var id: AdminNameSpace.ID { __data["id"] }
        /// The underlying code discount object.
        public var codeDiscount: CodeDiscount { __data["codeDiscount"] }

        /// CodeDiscountNodes.Node.CodeDiscount
        ///
        /// Parent Type: `DiscountCode`
        public struct CodeDiscount: AdminNameSpace.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: any ApolloAPI.ParentType { AdminNameSpace.Unions.DiscountCode }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .inlineFragment(AsDiscountCodeBasic.self),
          ] }

          public var asDiscountCodeBasic: AsDiscountCodeBasic? { _asInlineFragment() }

          /// CodeDiscountNodes.Node.CodeDiscount.AsDiscountCodeBasic
          ///
          /// Parent Type: `DiscountCodeBasic`
          public struct AsDiscountCodeBasic: AdminNameSpace.InlineFragment {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public typealias RootEntityType = GetAllDiscountCodesQuery.Data.CodeDiscountNodes.Node.CodeDiscount
            public static var __parentType: any ApolloAPI.ParentType { AdminNameSpace.Objects.DiscountCodeBasic }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("title", String.self),
              .field("summary", String.self),
              .field("usageLimit", Int?.self),
              .field("status", GraphQLEnum<AdminNameSpace.DiscountStatus>.self),
              .field("customerGets", CustomerGets.self),
              .field("codes", Codes.self, arguments: ["first": .variable("first")]),
            ] }

            /// The discount's name that displays to merchants in the Shopify admin and to customers.
            public var title: String { __data["title"] }
            /// A detailed explanation of what the discount is,
            /// who can use it, when and where it applies, and any associated
            /// rules or limitations.
            public var summary: String { __data["summary"] }
            /// The maximum number of times that a customer can use the discount.
            /// For discounts with unlimited usage, specify `null`.
            public var usageLimit: Int? { __data["usageLimit"] }
            /// The status of the discount that describes its availability,
            /// expiration, or pending activation.
            public var status: GraphQLEnum<AdminNameSpace.DiscountStatus> { __data["status"] }
            /// The items in the order that qualify for the discount, their quantities, and the total value of the discount.
            public var customerGets: CustomerGets { __data["customerGets"] }
            /// A list codes that customers can use to redeem the discount.
            public var codes: Codes { __data["codes"] }

            /// CodeDiscountNodes.Node.CodeDiscount.AsDiscountCodeBasic.CustomerGets
            ///
            /// Parent Type: `DiscountCustomerGets`
            public struct CustomerGets: AdminNameSpace.SelectionSet {
              public let __data: DataDict
              public init(_dataDict: DataDict) { __data = _dataDict }

              public static var __parentType: any ApolloAPI.ParentType { AdminNameSpace.Objects.DiscountCustomerGets }
              public static var __selections: [ApolloAPI.Selection] { [
                .field("__typename", String.self),
                .field("items", Items.self),
                .field("value", Value.self),
              ] }

              /// The items to which the discount applies.
              public var items: Items { __data["items"] }
              /// Entitled quantity and the discount value.
              public var value: Value { __data["value"] }

              /// CodeDiscountNodes.Node.CodeDiscount.AsDiscountCodeBasic.CustomerGets.Items
              ///
              /// Parent Type: `DiscountItems`
              public struct Items: AdminNameSpace.SelectionSet {
                public let __data: DataDict
                public init(_dataDict: DataDict) { __data = _dataDict }

                public static var __parentType: any ApolloAPI.ParentType { AdminNameSpace.Unions.DiscountItems }
                public static var __selections: [ApolloAPI.Selection] { [
                  .field("__typename", String.self),
                ] }
              }

              /// CodeDiscountNodes.Node.CodeDiscount.AsDiscountCodeBasic.CustomerGets.Value
              ///
              /// Parent Type: `DiscountCustomerGetsValue`
              public struct Value: AdminNameSpace.SelectionSet {
                public let __data: DataDict
                public init(_dataDict: DataDict) { __data = _dataDict }

                public static var __parentType: any ApolloAPI.ParentType { AdminNameSpace.Unions.DiscountCustomerGetsValue }
                public static var __selections: [ApolloAPI.Selection] { [
                  .field("__typename", String.self),
                  .inlineFragment(AsDiscountAmount.self),
                  .inlineFragment(AsDiscountPercentage.self),
                ] }

                public var asDiscountAmount: AsDiscountAmount? { _asInlineFragment() }
                public var asDiscountPercentage: AsDiscountPercentage? { _asInlineFragment() }

                /// CodeDiscountNodes.Node.CodeDiscount.AsDiscountCodeBasic.CustomerGets.Value.AsDiscountAmount
                ///
                /// Parent Type: `DiscountAmount`
                public struct AsDiscountAmount: AdminNameSpace.InlineFragment {
                  public let __data: DataDict
                  public init(_dataDict: DataDict) { __data = _dataDict }

                  public typealias RootEntityType = GetAllDiscountCodesQuery.Data.CodeDiscountNodes.Node.CodeDiscount.AsDiscountCodeBasic.CustomerGets.Value
                  public static var __parentType: any ApolloAPI.ParentType { AdminNameSpace.Objects.DiscountAmount }
                  public static var __selections: [ApolloAPI.Selection] { [
                    .field("amount", Amount.self),
                  ] }

                  /// The value of the discount.
                  public var amount: Amount { __data["amount"] }

                  /// CodeDiscountNodes.Node.CodeDiscount.AsDiscountCodeBasic.CustomerGets.Value.AsDiscountAmount.Amount
                  ///
                  /// Parent Type: `MoneyV2`
                  public struct Amount: AdminNameSpace.SelectionSet {
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

                /// CodeDiscountNodes.Node.CodeDiscount.AsDiscountCodeBasic.CustomerGets.Value.AsDiscountPercentage
                ///
                /// Parent Type: `DiscountPercentage`
                public struct AsDiscountPercentage: AdminNameSpace.InlineFragment {
                  public let __data: DataDict
                  public init(_dataDict: DataDict) { __data = _dataDict }

                  public typealias RootEntityType = GetAllDiscountCodesQuery.Data.CodeDiscountNodes.Node.CodeDiscount.AsDiscountCodeBasic.CustomerGets.Value
                  public static var __parentType: any ApolloAPI.ParentType { AdminNameSpace.Objects.DiscountPercentage }
                  public static var __selections: [ApolloAPI.Selection] { [
                    .field("percentage", Double.self),
                  ] }

                  /// The percentage value of the discount.
                  public var percentage: Double { __data["percentage"] }
                }
              }
            }

            /// CodeDiscountNodes.Node.CodeDiscount.AsDiscountCodeBasic.Codes
            ///
            /// Parent Type: `DiscountRedeemCodeConnection`
            public struct Codes: AdminNameSpace.SelectionSet {
              public let __data: DataDict
              public init(_dataDict: DataDict) { __data = _dataDict }

              public static var __parentType: any ApolloAPI.ParentType { AdminNameSpace.Objects.DiscountRedeemCodeConnection }
              public static var __selections: [ApolloAPI.Selection] { [
                .field("__typename", String.self),
                .field("nodes", [Node].self),
              ] }

              /// A list of nodes that are contained in DiscountRedeemCodeEdge. You can fetch data about an individual node, or you can follow the edges to fetch data about a collection of related nodes. At each node, you specify the fields that you want to retrieve.
              public var nodes: [Node] { __data["nodes"] }

              /// CodeDiscountNodes.Node.CodeDiscount.AsDiscountCodeBasic.Codes.Node
              ///
              /// Parent Type: `DiscountRedeemCode`
              public struct Node: AdminNameSpace.SelectionSet {
                public let __data: DataDict
                public init(_dataDict: DataDict) { __data = _dataDict }

                public static var __parentType: any ApolloAPI.ParentType { AdminNameSpace.Objects.DiscountRedeemCode }
                public static var __selections: [ApolloAPI.Selection] { [
                  .field("__typename", String.self),
                  .field("code", String.self),
                  .field("id", AdminNameSpace.ID.self),
                ] }

                /// The code that a customer can use at checkout to receive a discount.
                public var code: String { __data["code"] }
                /// A globally-unique ID of the discount redeem code.
                public var id: AdminNameSpace.ID { __data["id"] }
              }
            }
          }
        }
      }
    }
  }
}
