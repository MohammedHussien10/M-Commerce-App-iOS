// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class DraftOrderUpdateMutation: GraphQLMutation {
  public static let operationName: String = "draftOrderUpdate"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"mutation draftOrderUpdate($id: ID!, $input: DraftOrderInput!) { draftOrderUpdate(id: $id, input: $input) { __typename draftOrder { __typename id name email subtotalPrice lineItemsSubtotalPrice { __typename presentmentMoney { __typename amount currencyCode } shopMoney { __typename amount currencyCode } } note2 totalPrice lineItems(first: 100) { __typename nodes { __typename quantity variant { __typename id price availableForSale title } product { __typename id priceRangeV2 { __typename maxVariantPrice { __typename amount currencyCode } } title productType featuredImage { __typename url } } } } } } }"#
    ))

  public var id: ID
  public var input: DraftOrderInput

  public init(
    id: ID,
    input: DraftOrderInput
  ) {
    self.id = id
    self.input = input
  }

  public var __variables: Variables? { [
    "id": id,
    "input": input
  ] }

  public struct Data: AdminNameSpace.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { AdminNameSpace.Objects.Mutation }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("draftOrderUpdate", DraftOrderUpdate?.self, arguments: [
        "id": .variable("id"),
        "input": .variable("input")
      ]),
    ] }

    /// Updates a draft order.
    ///
    /// If a checkout has been started for a draft order, any update to the draft will unlink the checkout. Checkouts
    /// are created but not immediately completed when opening the merchant credit card modal in the admin, and when a
    /// buyer opens the invoice URL. This is usually fine, but there is an edge case where a checkout is in progress
    /// and the draft is updated before the checkout completes. This will not interfere with the checkout and order
    /// creation, but if the link from draft to checkout is broken the draft will remain open even after the order is
    /// created.
    public var draftOrderUpdate: DraftOrderUpdate? { __data["draftOrderUpdate"] }

    /// DraftOrderUpdate
    ///
    /// Parent Type: `DraftOrderUpdatePayload`
    public struct DraftOrderUpdate: AdminNameSpace.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: any ApolloAPI.ParentType { AdminNameSpace.Objects.DraftOrderUpdatePayload }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("draftOrder", DraftOrder?.self),
      ] }

      /// The updated draft order.
      public var draftOrder: DraftOrder? { __data["draftOrder"] }

      /// DraftOrderUpdate.DraftOrder
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
          .field("lineItemsSubtotalPrice", LineItemsSubtotalPrice.self),
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
        /// A subtotal of the line items and corresponding discounts,
        /// excluding include shipping charges, shipping discounts, taxes, or order discounts.
        public var lineItemsSubtotalPrice: LineItemsSubtotalPrice { __data["lineItemsSubtotalPrice"] }
        /// The text from an optional note attached to the draft order.
        public var note2: String? { __data["note2"] }
        /// The total price, in shop currency, includes taxes, shipping charges, and discounts.
        @available(*, deprecated, message: "Use `totalPriceSet` instead.")
        public var totalPrice: AdminNameSpace.Money { __data["totalPrice"] }
        /// The list of the line items in the draft order.
        public var lineItems: LineItems { __data["lineItems"] }

        /// DraftOrderUpdate.DraftOrder.LineItemsSubtotalPrice
        ///
        /// Parent Type: `MoneyBag`
        public struct LineItemsSubtotalPrice: AdminNameSpace.SelectionSet {
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

          /// DraftOrderUpdate.DraftOrder.LineItemsSubtotalPrice.PresentmentMoney
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

          /// DraftOrderUpdate.DraftOrder.LineItemsSubtotalPrice.ShopMoney
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

        /// DraftOrderUpdate.DraftOrder.LineItems
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

          /// DraftOrderUpdate.DraftOrder.LineItems.Node
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

            /// DraftOrderUpdate.DraftOrder.LineItems.Node.Variant
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

            /// DraftOrderUpdate.DraftOrder.LineItems.Node.Product
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

              /// DraftOrderUpdate.DraftOrder.LineItems.Node.Product.PriceRangeV2
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

                /// DraftOrderUpdate.DraftOrder.LineItems.Node.Product.PriceRangeV2.MaxVariantPrice
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

              /// DraftOrderUpdate.DraftOrder.LineItems.Node.Product.FeaturedImage
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
