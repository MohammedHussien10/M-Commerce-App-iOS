// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

extension GraphQLCodeGen {
  class UpdateCartLineMutation: GraphQLMutation {
    static let operationName: String = "UpdateCartLine"
    static let operationDocument: ApolloAPI.OperationDocument = .init(
      definition: .init(
        #"mutation UpdateCartLine($cartId: ID!, $lines: [CartLineUpdateInput!]!) { cartLinesUpdate(cartId: $cartId, lines: $lines) { __typename cart { __typename id totalQuantity } userErrors { __typename message } } }"#
      ))

    public var cartId: ID
    public var lines: [CartLineUpdateInput]

    public init(
      cartId: ID,
      lines: [CartLineUpdateInput]
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
        .field("cartLinesUpdate", CartLinesUpdate?.self, arguments: [
          "cartId": .variable("cartId"),
          "lines": .variable("lines")
        ]),
      ] }

      /// Updates one or more merchandise lines on a cart.
      var cartLinesUpdate: CartLinesUpdate? { __data["cartLinesUpdate"] }

      /// CartLinesUpdate
      ///
      /// Parent Type: `CartLinesUpdatePayload`
      struct CartLinesUpdate: GraphQLCodeGen.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: any ApolloAPI.ParentType { GraphQLCodeGen.Objects.CartLinesUpdatePayload }
        static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("cart", Cart?.self),
          .field("userErrors", [UserError].self),
        ] }

        /// The updated cart.
        var cart: Cart? { __data["cart"] }
        /// The list of errors that occurred from executing the mutation.
        var userErrors: [UserError] { __data["userErrors"] }

        /// CartLinesUpdate.Cart
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
          ] }

          /// A globally-unique ID.
          var id: GraphQLCodeGen.ID { __data["id"] }
          /// The total number of items in the cart.
          var totalQuantity: Int { __data["totalQuantity"] }
        }

        /// CartLinesUpdate.UserError
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