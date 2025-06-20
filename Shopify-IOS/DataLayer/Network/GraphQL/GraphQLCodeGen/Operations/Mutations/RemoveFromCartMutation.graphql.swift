// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

extension GraphQLCodeGen {
  class RemoveFromCartMutation: GraphQLMutation {
    static let operationName: String = "RemoveFromCart"
    static let operationDocument: ApolloAPI.OperationDocument = .init(
      definition: .init(
        #"mutation RemoveFromCart($cartId: ID!, $lineIds: [ID!]!) { cartLinesRemove(cartId: $cartId, lineIds: $lineIds) { __typename cart { __typename id totalQuantity } userErrors { __typename message } } }"#
      ))

    public var cartId: ID
    public var lineIds: [ID]

    public init(
      cartId: ID,
      lineIds: [ID]
    ) {
      self.cartId = cartId
      self.lineIds = lineIds
    }

    public var __variables: Variables? { [
      "cartId": cartId,
      "lineIds": lineIds
    ] }

    struct Data: GraphQLCodeGen.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: any ApolloAPI.ParentType { GraphQLCodeGen.Objects.Mutation }
      static var __selections: [ApolloAPI.Selection] { [
        .field("cartLinesRemove", CartLinesRemove?.self, arguments: [
          "cartId": .variable("cartId"),
          "lineIds": .variable("lineIds")
        ]),
      ] }

      /// Removes one or more merchandise lines from the cart.
      var cartLinesRemove: CartLinesRemove? { __data["cartLinesRemove"] }

      /// CartLinesRemove
      ///
      /// Parent Type: `CartLinesRemovePayload`
      struct CartLinesRemove: GraphQLCodeGen.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: any ApolloAPI.ParentType { GraphQLCodeGen.Objects.CartLinesRemovePayload }
        static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("cart", Cart?.self),
          .field("userErrors", [UserError].self),
        ] }

        /// The updated cart.
        var cart: Cart? { __data["cart"] }
        /// The list of errors that occurred from executing the mutation.
        var userErrors: [UserError] { __data["userErrors"] }

        /// CartLinesRemove.Cart
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

        /// CartLinesRemove.UserError
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