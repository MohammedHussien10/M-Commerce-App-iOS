// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

extension GraphQLCodeGen {
  class AddToCartMutation: GraphQLMutation {
    static let operationName: String = "AddToCart"
    static let operationDocument: ApolloAPI.OperationDocument = .init(
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

    struct Data: GraphQLCodeGen.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: any ApolloAPI.ParentType { GraphQLCodeGen.Objects.Mutation }
      static var __selections: [ApolloAPI.Selection] { [
        .field("cartLinesAdd", CartLinesAdd?.self, arguments: [
          "cartId": .variable("cartId"),
          "lines": .variable("lines")
        ]),
      ] }

      /// Adds a merchandise line to the cart.
      var cartLinesAdd: CartLinesAdd? { __data["cartLinesAdd"] }

      /// CartLinesAdd
      ///
      /// Parent Type: `CartLinesAddPayload`
      struct CartLinesAdd: GraphQLCodeGen.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: any ApolloAPI.ParentType { GraphQLCodeGen.Objects.CartLinesAddPayload }
        static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("cart", Cart?.self),
          .field("userErrors", [UserError].self),
        ] }

        /// The updated cart.
        var cart: Cart? { __data["cart"] }
        /// The list of errors that occurred from executing the mutation.
        var userErrors: [UserError] { __data["userErrors"] }

        /// CartLinesAdd.Cart
        ///
        /// Parent Type: `Cart`
        struct Cart: GraphQLCodeGen.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: any ApolloAPI.ParentType { GraphQLCodeGen.Objects.Cart }
          static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("id", GraphQLCodeGen.ID.self),
            .field("totalQuantity", Int.self),
            .field("lines", Lines.self, arguments: ["first": 10]),
          ] }

          /// A globally-unique ID.
          var id: GraphQLCodeGen.ID { __data["id"] }
          /// The total number of items in the cart.
          var totalQuantity: Int { __data["totalQuantity"] }
          /// A list of lines containing information about the items the customer intends to purchase.
          var lines: Lines { __data["lines"] }

          /// CartLinesAdd.Cart.Lines
          ///
          /// Parent Type: `BaseCartLineConnection`
          struct Lines: GraphQLCodeGen.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: any ApolloAPI.ParentType { GraphQLCodeGen.Objects.BaseCartLineConnection }
            static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("edges", [Edge].self),
            ] }

            /// A list of edges.
            var edges: [Edge] { __data["edges"] }

            /// CartLinesAdd.Cart.Lines.Edge
            ///
            /// Parent Type: `BaseCartLineEdge`
            struct Edge: GraphQLCodeGen.SelectionSet {
              let __data: DataDict
              init(_dataDict: DataDict) { __data = _dataDict }

              static var __parentType: any ApolloAPI.ParentType { GraphQLCodeGen.Objects.BaseCartLineEdge }
              static var __selections: [ApolloAPI.Selection] { [
                .field("__typename", String.self),
                .field("node", Node.self),
              ] }

              /// The item at the end of BaseCartLineEdge.
              var node: Node { __data["node"] }

              /// CartLinesAdd.Cart.Lines.Edge.Node
              ///
              /// Parent Type: `BaseCartLine`
              struct Node: GraphQLCodeGen.SelectionSet {
                let __data: DataDict
                init(_dataDict: DataDict) { __data = _dataDict }

                static var __parentType: any ApolloAPI.ParentType { GraphQLCodeGen.Interfaces.BaseCartLine }
                static var __selections: [ApolloAPI.Selection] { [
                  .field("__typename", String.self),
                  .field("id", GraphQLCodeGen.ID.self),
                  .field("quantity", Int.self),
                  .field("merchandise", Merchandise.self),
                ] }

                /// A globally-unique ID.
                var id: GraphQLCodeGen.ID { __data["id"] }
                /// The quantity of the merchandise that the customer intends to purchase.
                var quantity: Int { __data["quantity"] }
                /// The merchandise that the buyer intends to purchase.
                var merchandise: Merchandise { __data["merchandise"] }

                /// CartLinesAdd.Cart.Lines.Edge.Node.Merchandise
                ///
                /// Parent Type: `Merchandise`
                struct Merchandise: GraphQLCodeGen.SelectionSet {
                  let __data: DataDict
                  init(_dataDict: DataDict) { __data = _dataDict }

                  static var __parentType: any ApolloAPI.ParentType { GraphQLCodeGen.Unions.Merchandise }
                  static var __selections: [ApolloAPI.Selection] { [
                    .field("__typename", String.self),
                    .inlineFragment(AsProductVariant.self),
                  ] }

                  var asProductVariant: AsProductVariant? { _asInlineFragment() }

                  /// CartLinesAdd.Cart.Lines.Edge.Node.Merchandise.AsProductVariant
                  ///
                  /// Parent Type: `ProductVariant`
                  struct AsProductVariant: GraphQLCodeGen.InlineFragment {
                    let __data: DataDict
                    init(_dataDict: DataDict) { __data = _dataDict }

                    typealias RootEntityType = AddToCartMutation.Data.CartLinesAdd.Cart.Lines.Edge.Node.Merchandise
                    static var __parentType: any ApolloAPI.ParentType { GraphQLCodeGen.Objects.ProductVariant }
                    static var __selections: [ApolloAPI.Selection] { [
                      .field("id", GraphQLCodeGen.ID.self),
                      .field("title", String.self),
                      .field("image", Image?.self),
                      .field("price", Price.self),
                    ] }

                    /// A globally-unique ID.
                    var id: GraphQLCodeGen.ID { __data["id"] }
                    /// The product variant’s title.
                    var title: String { __data["title"] }
                    /// Image associated with the product variant. This field falls back to the product image if no image is available.
                    var image: Image? { __data["image"] }
                    /// The product variant’s price.
                    var price: Price { __data["price"] }

                    /// CartLinesAdd.Cart.Lines.Edge.Node.Merchandise.AsProductVariant.Image
                    ///
                    /// Parent Type: `Image`
                    struct Image: GraphQLCodeGen.SelectionSet {
                      let __data: DataDict
                      init(_dataDict: DataDict) { __data = _dataDict }

                      static var __parentType: any ApolloAPI.ParentType { GraphQLCodeGen.Objects.Image }
                      static var __selections: [ApolloAPI.Selection] { [
                        .field("__typename", String.self),
                        .field("url", GraphQLCodeGen.URL.self),
                      ] }

                      /// The location of the image as a URL.
                      ///
                      /// If no transform options are specified, then the original image will be preserved including any pre-applied transforms.
                      ///
                      /// All transformation options are considered "best-effort". Any transformation that the original image type doesn't support will be ignored.
                      ///
                      /// If you need multiple variations of the same image, then you can use [GraphQL aliases](https://graphql.org/learn/queries/#aliases).
                      var url: GraphQLCodeGen.URL { __data["url"] }
                    }

                    /// CartLinesAdd.Cart.Lines.Edge.Node.Merchandise.AsProductVariant.Price
                    ///
                    /// Parent Type: `MoneyV2`
                    struct Price: GraphQLCodeGen.SelectionSet {
                      let __data: DataDict
                      init(_dataDict: DataDict) { __data = _dataDict }

                      static var __parentType: any ApolloAPI.ParentType { GraphQLCodeGen.Objects.MoneyV2 }
                      static var __selections: [ApolloAPI.Selection] { [
                        .field("__typename", String.self),
                        .field("amount", GraphQLCodeGen.Decimal.self),
                        .field("currencyCode", GraphQLEnum<GraphQLCodeGen.CurrencyCode>.self),
                      ] }

                      /// Decimal money amount.
                      var amount: GraphQLCodeGen.Decimal { __data["amount"] }
                      /// Currency of the money.
                      var currencyCode: GraphQLEnum<GraphQLCodeGen.CurrencyCode> { __data["currencyCode"] }
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
        struct UserError: GraphQLCodeGen.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: any ApolloAPI.ParentType { GraphQLCodeGen.Objects.CartUserError }
          static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("message", String.self),
          ] }

          /// The error message.
          var message: String { __data["message"] }
        }
      }
    }
  }

}