// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class AddToCartMutation: GraphQLMutation {
  public static let operationName: String = "AddToCart"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"mutation AddToCart($cartId: ID!, $lines: [CartLineInput!]!) { cartLinesAdd(cartId: $cartId, lines: $lines) { __typename cart { __typename id totalQuantity lines(first: 10) { __typename edges { __typename node { __typename id quantity merchandise { __typename ... on ProductVariant { id title image { __typename url } price { __typename amount currencyCode } } } } } } } userErrors { __typename message } } }"#
    ))

  public var cartId: ID
  public var lines: [CartLineInput]

  public init(
    cartId: ID,
    lines: [CartLineInput]
  ) {
    self.cartId = cartId
    self.lines = lines
  }

  public var __variables: Variables? { [
    "cartId": cartId,
    "lines": lines
  ] }

  public struct Data: StoreFrontNameSpace.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { StoreFrontNameSpace.Objects.Mutation }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("cartLinesAdd", CartLinesAdd?.self, arguments: [
        "cartId": .variable("cartId"),
        "lines": .variable("lines")
      ]),
    ] }

    /// Adds a merchandise line to the cart.
    public var cartLinesAdd: CartLinesAdd? { __data["cartLinesAdd"] }

    /// CartLinesAdd
    ///
    /// Parent Type: `CartLinesAddPayload`
    public struct CartLinesAdd: StoreFrontNameSpace.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: any ApolloAPI.ParentType { StoreFrontNameSpace.Objects.CartLinesAddPayload }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("cart", Cart?.self),
        .field("userErrors", [UserError].self),
      ] }

      /// The updated cart.
      public var cart: Cart? { __data["cart"] }
      /// The list of errors that occurred from executing the mutation.
      public var userErrors: [UserError] { __data["userErrors"] }

      /// CartLinesAdd.Cart
      ///
      /// Parent Type: `Cart`
      public struct Cart: StoreFrontNameSpace.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { StoreFrontNameSpace.Objects.Cart }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("id", StoreFrontNameSpace.ID.self),
          .field("totalQuantity", Int.self),
          .field("lines", Lines.self, arguments: ["first": 10]),
        ] }

        /// A globally-unique ID.
        public var id: StoreFrontNameSpace.ID { __data["id"] }
        /// The total number of items in the cart.
        public var totalQuantity: Int { __data["totalQuantity"] }
        /// A list of lines containing information about the items the customer intends to purchase.
        public var lines: Lines { __data["lines"] }

        /// CartLinesAdd.Cart.Lines
        ///
        /// Parent Type: `BaseCartLineConnection`
        public struct Lines: StoreFrontNameSpace.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: any ApolloAPI.ParentType { StoreFrontNameSpace.Objects.BaseCartLineConnection }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("edges", [Edge].self),
          ] }

          /// A list of edges.
          public var edges: [Edge] { __data["edges"] }

          /// CartLinesAdd.Cart.Lines.Edge
          ///
          /// Parent Type: `BaseCartLineEdge`
          public struct Edge: StoreFrontNameSpace.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: any ApolloAPI.ParentType { StoreFrontNameSpace.Objects.BaseCartLineEdge }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("node", Node.self),
            ] }

            /// The item at the end of BaseCartLineEdge.
            public var node: Node { __data["node"] }

            /// CartLinesAdd.Cart.Lines.Edge.Node
            ///
            /// Parent Type: `BaseCartLine`
            public struct Node: StoreFrontNameSpace.SelectionSet {
              public let __data: DataDict
              public init(_dataDict: DataDict) { __data = _dataDict }

              public static var __parentType: any ApolloAPI.ParentType { StoreFrontNameSpace.Interfaces.BaseCartLine }
              public static var __selections: [ApolloAPI.Selection] { [
                .field("__typename", String.self),
                .field("id", StoreFrontNameSpace.ID.self),
                .field("quantity", Int.self),
                .field("merchandise", Merchandise.self),
              ] }

              /// A globally-unique ID.
              public var id: StoreFrontNameSpace.ID { __data["id"] }
              /// The quantity of the merchandise that the customer intends to purchase.
              public var quantity: Int { __data["quantity"] }
              /// The merchandise that the buyer intends to purchase.
              public var merchandise: Merchandise { __data["merchandise"] }

              /// CartLinesAdd.Cart.Lines.Edge.Node.Merchandise
              ///
              /// Parent Type: `Merchandise`
              public struct Merchandise: StoreFrontNameSpace.SelectionSet {
                public let __data: DataDict
                public init(_dataDict: DataDict) { __data = _dataDict }

                public static var __parentType: any ApolloAPI.ParentType { StoreFrontNameSpace.Unions.Merchandise }
                public static var __selections: [ApolloAPI.Selection] { [
                  .field("__typename", String.self),
                  .inlineFragment(AsProductVariant.self),
                ] }

                public var asProductVariant: AsProductVariant? { _asInlineFragment() }

                /// CartLinesAdd.Cart.Lines.Edge.Node.Merchandise.AsProductVariant
                ///
                /// Parent Type: `ProductVariant`
                public struct AsProductVariant: StoreFrontNameSpace.InlineFragment {
                  public let __data: DataDict
                  public init(_dataDict: DataDict) { __data = _dataDict }

                  public typealias RootEntityType = AddToCartMutation.Data.CartLinesAdd.Cart.Lines.Edge.Node.Merchandise
                  public static var __parentType: any ApolloAPI.ParentType { StoreFrontNameSpace.Objects.ProductVariant }
                  public static var __selections: [ApolloAPI.Selection] { [
                    .field("id", StoreFrontNameSpace.ID.self),
                    .field("title", String.self),
                    .field("image", Image?.self),
                    .field("price", Price.self),
                  ] }

                  /// A globally-unique ID.
                  public var id: StoreFrontNameSpace.ID { __data["id"] }
                  /// The product variant’s title.
                  public var title: String { __data["title"] }
                  /// Image associated with the product variant. This field falls back to the product image if no image is available.
                  public var image: Image? { __data["image"] }
                  /// The product variant’s price.
                  public var price: Price { __data["price"] }

                  /// CartLinesAdd.Cart.Lines.Edge.Node.Merchandise.AsProductVariant.Image
                  ///
                  /// Parent Type: `Image`
                  public struct Image: StoreFrontNameSpace.SelectionSet {
                    public let __data: DataDict
                    public init(_dataDict: DataDict) { __data = _dataDict }

                    public static var __parentType: any ApolloAPI.ParentType { StoreFrontNameSpace.Objects.Image }
                    public static var __selections: [ApolloAPI.Selection] { [
                      .field("__typename", String.self),
                      .field("url", StoreFrontNameSpace.URL.self),
                    ] }

                    /// The location of the image as a URL.
                    ///
                    /// If no transform options are specified, then the original image will be preserved including any pre-applied transforms.
                    ///
                    /// All transformation options are considered "best-effort". Any transformation that the original image type doesn't support will be ignored.
                    ///
                    /// If you need multiple variations of the same image, then you can use [GraphQL aliases](https://graphql.org/learn/queries/#aliases).
                    public var url: StoreFrontNameSpace.URL { __data["url"] }
                  }

                  /// CartLinesAdd.Cart.Lines.Edge.Node.Merchandise.AsProductVariant.Price
                  ///
                  /// Parent Type: `MoneyV2`
                  public struct Price: StoreFrontNameSpace.SelectionSet {
                    public let __data: DataDict
                    public init(_dataDict: DataDict) { __data = _dataDict }

                    public static var __parentType: any ApolloAPI.ParentType { StoreFrontNameSpace.Objects.MoneyV2 }
                    public static var __selections: [ApolloAPI.Selection] { [
                      .field("__typename", String.self),
                      .field("amount", StoreFrontNameSpace.Decimal.self),
                      .field("currencyCode", GraphQLEnum<StoreFrontNameSpace.CurrencyCode>.self),
                    ] }

                    /// Decimal money amount.
                    public var amount: StoreFrontNameSpace.Decimal { __data["amount"] }
                    /// Currency of the money.
                    public var currencyCode: GraphQLEnum<StoreFrontNameSpace.CurrencyCode> { __data["currencyCode"] }
                  }
                }
              }
            }
          }
        }
      }

      /// CartLinesAdd.UserError
      ///
      /// Parent Type: `CartUserError`
      public struct UserError: StoreFrontNameSpace.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { StoreFrontNameSpace.Objects.CartUserError }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("message", String.self),
        ] }

        /// The error message.
        public var message: String { __data["message"] }
      }
    }
  }
}
