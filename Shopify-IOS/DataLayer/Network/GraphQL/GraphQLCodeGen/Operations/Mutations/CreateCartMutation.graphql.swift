// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

extension GraphQLCodeGen {
  class CreateCartMutation: GraphQLMutation {
    static let operationName: String = "CreateCart"
    static let operationDocument: ApolloAPI.OperationDocument = .init(
      definition: .init(
        #"mutation CreateCart($input: CartInput) { cartCreate(input: $input) { __typename cart { __typename id checkoutUrl } userErrors { __typename field message } } }"#
      ))

    public var input: GraphQLNullable<CartInput>

    public init(input: GraphQLNullable<CartInput>) {
      self.input = input
    }

    public var __variables: Variables? { ["input": input] }

    struct Data: GraphQLCodeGen.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: any ApolloAPI.ParentType { GraphQLCodeGen.Objects.Mutation }
      static var __selections: [ApolloAPI.Selection] { [
        .field("cartCreate", CartCreate?.self, arguments: ["input": .variable("input")]),
      ] }

      /// Creates a new cart.
      var cartCreate: CartCreate? { __data["cartCreate"] }

      /// CartCreate
      ///
      /// Parent Type: `CartCreatePayload`
      struct CartCreate: GraphQLCodeGen.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: any ApolloAPI.ParentType { GraphQLCodeGen.Objects.CartCreatePayload }
        static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("cart", Cart?.self),
          .field("userErrors", [UserError].self),
        ] }

        /// The new cart.
        var cart: Cart? { __data["cart"] }
        /// The list of errors that occurred from executing the mutation.
        var userErrors: [UserError] { __data["userErrors"] }

        /// CartCreate.Cart
        ///
        /// Parent Type: `Cart`
        struct Cart: GraphQLCodeGen.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: any ApolloAPI.ParentType { GraphQLCodeGen.Objects.Cart }
          static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("id", GraphQLCodeGen.ID.self),
            .field("checkoutUrl", GraphQLCodeGen.URL.self),
          ] }

          /// A globally-unique ID.
          var id: GraphQLCodeGen.ID { __data["id"] }
          /// The URL of the checkout for the cart.
          var checkoutUrl: GraphQLCodeGen.URL { __data["checkoutUrl"] }
        }

        /// CartCreate.UserError
        ///
        /// Parent Type: `CartUserError`
        struct UserError: GraphQLCodeGen.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: any ApolloAPI.ParentType { GraphQLCodeGen.Objects.CartUserError }
          static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("field", [String]?.self),
            .field("message", String.self),
          ] }

          /// The path to the input field that caused the error.
          var field: [String]? { __data["field"] }
          /// The error message.
          var message: String { __data["message"] }
        }
      }
    }
  }

}