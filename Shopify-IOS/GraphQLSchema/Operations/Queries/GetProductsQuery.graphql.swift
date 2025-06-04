// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

extension GraphQLSchema {
  class GetProductsQuery: GraphQLQuery {
    static let operationName: String = "GetProducts"
    static let operationDocument: ApolloAPI.OperationDocument = .init(
      definition: .init(
        #"query GetProducts { products(first: 10) { __typename edges { __typename node { __typename id title } } } }"#
      ))

    public init() {}

    struct Data: GraphQLSchema.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: any ApolloAPI.ParentType { GraphQLSchema.Objects.QueryRoot }
      static var __selections: [ApolloAPI.Selection] { [
        .field("products", Products.self, arguments: ["first": 10]),
      ] }

      /// Returns a list of the shop's products. For storefront search, use the [`search`](https://shopify.dev/docs/api/storefront/latest/queries/search) query.
      var products: Products { __data["products"] }

      /// Products
      ///
      /// Parent Type: `ProductConnection`
      struct Products: GraphQLSchema.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: any ApolloAPI.ParentType { GraphQLSchema.Objects.ProductConnection }
        static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("edges", [Edge].self),
        ] }

        /// A list of edges.
        var edges: [Edge] { __data["edges"] }

        /// Products.Edge
        ///
        /// Parent Type: `ProductEdge`
        struct Edge: GraphQLSchema.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: any ApolloAPI.ParentType { GraphQLSchema.Objects.ProductEdge }
          static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("node", Node.self),
          ] }

          /// The item at the end of ProductEdge.
          var node: Node { __data["node"] }

          /// Products.Edge.Node
          ///
          /// Parent Type: `Product`
          struct Node: GraphQLSchema.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: any ApolloAPI.ParentType { GraphQLSchema.Objects.Product }
            static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("id", GraphQLSchema.ID.self),
              .field("title", String.self),
            ] }

            /// A globally-unique ID.
            var id: GraphQLSchema.ID { __data["id"] }
            /// The name for the product that displays to customers. The title is used to construct the product's handle.
            /// For example, if a product is titled "Black Sunglasses", then the handle is `black-sunglasses`.
            var title: String { __data["title"] }
          }
        }
      }
    }
  }

}