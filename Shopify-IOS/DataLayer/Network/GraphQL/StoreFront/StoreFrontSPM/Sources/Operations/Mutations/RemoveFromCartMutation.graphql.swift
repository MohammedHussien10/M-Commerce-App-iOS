// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class RemoveFromCartMutation: GraphQLMutation {
  public static let operationName: String = "RemoveFromCart"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
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

  public struct Data: StoreFrontNameSpace.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { StoreFrontNameSpace.Objects.Mutation }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("cartLinesRemove", CartLinesRemove?.self, arguments: [
        "cartId": .variable("cartId"),
        "lineIds": .variable("lineIds")
      ]),
    ] }

    /// Removes one or more merchandise lines from the cart.
    public var cartLinesRemove: CartLinesRemove? { __data["cartLinesRemove"] }

    /// CartLinesRemove
    ///
    /// Parent Type: `CartLinesRemovePayload`
    public struct CartLinesRemove: StoreFrontNameSpace.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: any ApolloAPI.ParentType { StoreFrontNameSpace.Objects.CartLinesRemovePayload }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("cart", Cart?.self),
        .field("userErrors", [UserError].self),
      ] }

      /// The updated cart.
      public var cart: Cart? { __data["cart"] }
      /// The list of errors that occurred from executing the mutation.
      public var userErrors: [UserError] { __data["userErrors"] }

      /// CartLinesRemove.Cart
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
        ] }

        /// A globally-unique ID.
        public var id: StoreFrontNameSpace.ID { __data["id"] }
        /// The total number of items in the cart.
        public var totalQuantity: Int { __data["totalQuantity"] }
      }

      /// CartLinesRemove.UserError
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
