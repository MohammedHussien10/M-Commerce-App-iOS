// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

extension GraphQLCodeGen {
  class GetCollectionsQuery: GraphQLQuery {
    static let operationName: String = "GetCollections"
    static let operationDocument: ApolloAPI.OperationDocument = .init(
      definition: .init(
        #"query GetCollections($first: Int) { collections(first: $first) { __typename nodes { __typename description id handle image { __typename url } title } } }"#
      ))

    public var first: GraphQLNullable<Int>

    public init(first: GraphQLNullable<Int>) {
      self.first = first
    }

    public var __variables: Variables? { ["first": first] }

    struct Data: GraphQLCodeGen.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: any ApolloAPI.ParentType { GraphQLCodeGen.Objects.QueryRoot }
      static var __selections: [ApolloAPI.Selection] { [
        .field("collections", Collections.self, arguments: ["first": .variable("first")]),
      ] }

      /// List of the shop’s collections.
      var collections: Collections { __data["collections"] }

      /// Collections
      ///
      /// Parent Type: `CollectionConnection`
      struct Collections: GraphQLCodeGen.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: any ApolloAPI.ParentType { GraphQLCodeGen.Objects.CollectionConnection }
        static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("nodes", [Node].self),
        ] }

        /// A list of the nodes contained in CollectionEdge.
        var nodes: [Node] { __data["nodes"] }

        /// Collections.Node
        ///
        /// Parent Type: `Collection`
        struct Node: GraphQLCodeGen.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: any ApolloAPI.ParentType { GraphQLCodeGen.Objects.Collection }
          static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("description", String.self),
            .field("id", GraphQLCodeGen.ID.self),
            .field("handle", String.self),
            .field("image", Image?.self),
            .field("title", String.self),
          ] }

          /// Stripped description of the collection, single line with HTML tags removed.
          var description: String { __data["description"] }
          /// A globally-unique ID.
          var id: GraphQLCodeGen.ID { __data["id"] }
          /// A human-friendly unique string for the collection automatically generated from its title.
          /// Limit of 255 characters.
          var handle: String { __data["handle"] }
          /// Image associated with the collection.
          var image: Image? { __data["image"] }
          /// The collection’s name. Limit of 255 characters.
          var title: String { __data["title"] }

          /// Collections.Node.Image
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
        }
      }
    }
  }

}