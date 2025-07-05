// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class DraftOrderCreateMutation: GraphQLMutation {
  public static let operationName: String = "draftOrderCreate"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"mutation draftOrderCreate($input: DraftOrderInput!) { draftOrderCreate(input: $input) { __typename draftOrder { __typename id name email subtotalPrice totalTax note2 totalPrice lineItems(first: 100) { __typename nodes { __typename quantity variant { __typename id price availableForSale title } product { __typename id priceRangeV2 { __typename maxVariantPrice { __typename amount currencyCode } } title productType featuredImage { __typename url } } } } } } }"#
    ))

  public var input: DraftOrderInput

  public init(input: DraftOrderInput) {
    self.input = input
  }

  public var __variables: Variables? { ["input": input] }

  public struct Data: AdminNameSpace.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { AdminNameSpace.Objects.Mutation }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("draftOrderCreate", DraftOrderCreate?.self, arguments: ["input": .variable("input")]),
    ] }

    /// Creates a [draft order](https://shopify.dev/docs/api/admin-graphql/latest/objects/DraftOrder)
    /// with attributes such as customer information, line items, shipping and billing addresses, and payment terms.
    /// Draft orders are useful for merchants that need to:
    ///
    /// - Create new orders for sales made by phone, in person, by chat, or elsewhere. When a merchant accepts payment for a draft order, an order is created.
    /// - Send invoices to customers with a secure checkout link.
    /// - Use custom items to represent additional costs or products not in inventory.
    /// - Re-create orders manually from active sales channels.
    /// - Sell products at discount or wholesale rates.
    /// - Take pre-orders.
    ///
    /// After creating a draft order, you can:
    /// - Send an invoice to the customer using the [`draftOrderInvoiceSend`](https://shopify.dev/docs/api/admin-graphql/latest/mutations/draftOrderInvoiceSend) mutation.
    /// - Complete the draft order using the [`draftOrderComplete`](https://shopify.dev/docs/api/admin-graphql/latest/mutations/draftOrderComplete) mutation.
    /// - Update the draft order using the [`draftOrderUpdate`](https://shopify.dev/docs/api/admin-graphql/latest/mutations/draftOrderUpdate) mutation.
    /// - Duplicate a draft order using the [`draftOrderDuplicate`](https://shopify.dev/docs/api/admin-graphql/latest/mutations/draftOrderDuplicate) mutation.
    /// - Delete the draft order using the [`draftOrderDelete`](https://shopify.dev/docs/api/admin-graphql/latest/mutations/draftOrderDelete) mutation.
    ///
    /// > Note:
    /// > When you create a draft order, you can't [reserve or hold inventory](https://shopify.dev/docs/apps/build/orders-fulfillment/inventory-management-apps#inventory-states) for the items in the order by default.
    /// > However, you can reserve inventory using the [`reserveInventoryUntil`](https://shopify.dev/docs/api/admin-graphql/latest/mutations/draftOrderCreate#arguments-input.fields.reserveInventoryUntil) input.
    public var draftOrderCreate: DraftOrderCreate? { __data["draftOrderCreate"] }

    /// DraftOrderCreate
    ///
    /// Parent Type: `DraftOrderCreatePayload`
    public struct DraftOrderCreate: AdminNameSpace.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: any ApolloAPI.ParentType { AdminNameSpace.Objects.DraftOrderCreatePayload }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("draftOrder", DraftOrder?.self),
      ] }

      /// The created draft order.
      public var draftOrder: DraftOrder? { __data["draftOrder"] }

      /// DraftOrderCreate.DraftOrder
      ///
      /// Parent Type: `DraftOrder`
      public struct DraftOrder: AdminNameSpace.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { AdminNameSpace.Objects.DraftOrder }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("id", AdminNameSpace.ID.self),
          .field("name", String.self),
          .field("email", String?.self),
          .field("subtotalPrice", AdminNameSpace.Money.self),
          .field("totalTax", AdminNameSpace.Money.self),
          .field("note2", String?.self),
          .field("totalPrice", AdminNameSpace.Money.self),
          .field("lineItems", LineItems.self, arguments: ["first": 100]),
        ] }

        /// A globally-unique ID.
        public var id: AdminNameSpace.ID { __data["id"] }
        /// The identifier for the draft order, which is unique within the store. For example, _#D1223_.
        public var name: String { __data["name"] }
        /// The email address of the customer, which is used to send notifications.
        public var email: String? { __data["email"] }
        /// The subtotal, in shop currency, of the line items and their discounts, excluding shipping charges, shipping discounts, and taxes.
        @available(*, deprecated, message: "Use `subtotalPriceSet` instead.")
        public var subtotalPrice: AdminNameSpace.Money { __data["subtotalPrice"] }
        /// The total tax in shop currency.
        @available(*, deprecated, message: "Use `totalTaxSet` instead.")
        public var totalTax: AdminNameSpace.Money { __data["totalTax"] }
        /// The text from an optional note attached to the draft order.
        public var note2: String? { __data["note2"] }
        /// The total price, in shop currency, includes taxes, shipping charges, and discounts.
        @available(*, deprecated, message: "Use `totalPriceSet` instead.")
        public var totalPrice: AdminNameSpace.Money { __data["totalPrice"] }
        /// The list of the line items in the draft order.
        public var lineItems: LineItems { __data["lineItems"] }

        /// DraftOrderCreate.DraftOrder.LineItems
        ///
        /// Parent Type: `DraftOrderLineItemConnection`
        public struct LineItems: AdminNameSpace.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: any ApolloAPI.ParentType { AdminNameSpace.Objects.DraftOrderLineItemConnection }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("nodes", [Node].self),
          ] }

          /// A list of nodes that are contained in DraftOrderLineItemEdge. You can fetch data about an individual node, or you can follow the edges to fetch data about a collection of related nodes. At each node, you specify the fields that you want to retrieve.
          public var nodes: [Node] { __data["nodes"] }

          /// DraftOrderCreate.DraftOrder.LineItems.Node
          ///
          /// Parent Type: `DraftOrderLineItem`
          public struct Node: AdminNameSpace.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: any ApolloAPI.ParentType { AdminNameSpace.Objects.DraftOrderLineItem }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("quantity", Int.self),
              .field("variant", Variant?.self),
              .field("product", Product?.self),
            ] }

            /// The quantity of items. For a bundle item, this is the quantity of bundles,
            /// not the quantity of items contained in the bundles themselves.
            public var quantity: Int { __data["quantity"] }
            /// The product variant for the line item.
            public var variant: Variant? { __data["variant"] }
            /// The product for the line item.
            public var product: Product? { __data["product"] }

            /// DraftOrderCreate.DraftOrder.LineItems.Node.Variant
            ///
            /// Parent Type: `ProductVariant`
            public struct Variant: AdminNameSpace.SelectionSet {
              public let __data: DataDict
              public init(_dataDict: DataDict) { __data = _dataDict }

              public static var __parentType: any ApolloAPI.ParentType { AdminNameSpace.Objects.ProductVariant }
              public static var __selections: [ApolloAPI.Selection] { [
                .field("__typename", String.self),
                .field("id", AdminNameSpace.ID.self),
                .field("price", AdminNameSpace.Money.self),
                .field("availableForSale", Bool.self),
                .field("title", String.self),
              ] }

              /// A globally-unique ID.
              public var id: AdminNameSpace.ID { __data["id"] }
              /// The price of the product variant in the default shop currency.
              public var price: AdminNameSpace.Money { __data["price"] }
              /// Whether the product variant is available for sale.
              public var availableForSale: Bool { __data["availableForSale"] }
              /// The title of the product variant.
              public var title: String { __data["title"] }
            }

            /// DraftOrderCreate.DraftOrder.LineItems.Node.Product
            ///
            /// Parent Type: `Product`
            public struct Product: AdminNameSpace.SelectionSet {
              public let __data: DataDict
              public init(_dataDict: DataDict) { __data = _dataDict }

              public static var __parentType: any ApolloAPI.ParentType { AdminNameSpace.Objects.Product }
              public static var __selections: [ApolloAPI.Selection] { [
                .field("__typename", String.self),
                .field("id", AdminNameSpace.ID.self),
                .field("priceRangeV2", PriceRangeV2.self),
                .field("title", String.self),
                .field("productType", String.self),
                .field("featuredImage", FeaturedImage?.self),
              ] }

              /// A globally-unique ID.
              public var id: AdminNameSpace.ID { __data["id"] }
              /// The minimum and maximum prices of a product, expressed in decimal numbers.
              /// For example, if the product is priced between $10.00 and $50.00,
              /// then the price range is $10.00 - $50.00.
              public var priceRangeV2: PriceRangeV2 { __data["priceRangeV2"] }
              /// The name for the product that displays to customers. The title is used to construct the product's handle.
              /// For example, if a product is titled "Black Sunglasses", then the handle is `black-sunglasses`.
              public var title: String { __data["title"] }
              /// The [product type](https://help.shopify.com/manual/products/details/product-type)
              /// that merchants define.
              public var productType: String { __data["productType"] }
              /// The featured image for the product.
              @available(*, deprecated, message: "Use `featuredMedia` instead.")
              public var featuredImage: FeaturedImage? { __data["featuredImage"] }

              /// DraftOrderCreate.DraftOrder.LineItems.Node.Product.PriceRangeV2
              ///
              /// Parent Type: `ProductPriceRangeV2`
              public struct PriceRangeV2: AdminNameSpace.SelectionSet {
                public let __data: DataDict
                public init(_dataDict: DataDict) { __data = _dataDict }

                public static var __parentType: any ApolloAPI.ParentType { AdminNameSpace.Objects.ProductPriceRangeV2 }
                public static var __selections: [ApolloAPI.Selection] { [
                  .field("__typename", String.self),
                  .field("maxVariantPrice", MaxVariantPrice.self),
                ] }

                /// The highest variant's price.
                public var maxVariantPrice: MaxVariantPrice { __data["maxVariantPrice"] }

                /// DraftOrderCreate.DraftOrder.LineItems.Node.Product.PriceRangeV2.MaxVariantPrice
                ///
                /// Parent Type: `MoneyV2`
                public struct MaxVariantPrice: AdminNameSpace.SelectionSet {
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

              /// DraftOrderCreate.DraftOrder.LineItems.Node.Product.FeaturedImage
              ///
              /// Parent Type: `Image`
              public struct FeaturedImage: AdminNameSpace.SelectionSet {
                public let __data: DataDict
                public init(_dataDict: DataDict) { __data = _dataDict }

                public static var __parentType: any ApolloAPI.ParentType { AdminNameSpace.Objects.Image }
                public static var __selections: [ApolloAPI.Selection] { [
                  .field("__typename", String.self),
                  .field("url", AdminNameSpace.URL.self),
                ] }

                /// The location of the image as a URL.
                ///
                /// If no transform options are specified, then the original image will be preserved including any pre-applied transforms.
                ///
                /// All transformation options are considered "best-effort". Any transformation that the original image type doesn't support will be ignored.
                ///
                /// If you need multiple variations of the same image, then you can use [GraphQL aliases](https://graphql.org/learn/queries/#aliases).
                public var url: AdminNameSpace.URL { __data["url"] }
              }
            }
          }
        }
      }
    }
  }
}
