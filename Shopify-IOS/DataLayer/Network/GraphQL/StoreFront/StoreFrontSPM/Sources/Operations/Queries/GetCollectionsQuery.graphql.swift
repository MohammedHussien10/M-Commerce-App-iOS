// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class GetCollectionsQuery: GraphQLQuery {
  public static let operationName: String = "GetCollections"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query GetCollections($first: Int) { collections(first: $first) { __typename nodes { __typename description id handle image { __typename url } title } } }"#
    ))

  public var first: GraphQLNullable<Int>

  public init(first: GraphQLNullable<Int>) {
    self.first = first
  }

  public var __variables: Variables? { ["first": first] }

  public struct Data: StoreFrontNameSpace.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { StoreFrontNameSpace.Objects.QueryRoot }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("collections", Collections.self, arguments: ["first": .variable("first")]),
    ] }

    /// List of the shop’s collections.
    public var collections: Collections { __data["collections"] }

    /// Collections
    ///
    /// Parent Type: `CollectionConnection`
    public struct Collections: StoreFrontNameSpace.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: any ApolloAPI.ParentType { StoreFrontNameSpace.Objects.CollectionConnection }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("nodes", [Node].self),
      ] }

      /// A list of the nodes contained in CollectionEdge.
      public var nodes: [Node] { __data["nodes"] }

      /// Collections.Node
      ///
      /// Parent Type: `Collection`
      public struct Node: StoreFrontNameSpace.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { StoreFrontNameSpace.Objects.Collection }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("description", String.self),
          .field("id", StoreFrontNameSpace.ID.self),
          .field("handle", String.self),
          .field("image", Image?.self),
          .field("title", String.self),
        ] }

        /// Stripped description of the collection, single line with HTML tags removed.
        public var description: String { __data["description"] }
        /// A globally-unique ID.
        public var id: StoreFrontNameSpace.ID { __data["id"] }
        /// A human-friendly unique string for the collection automatically generated from its title.
        /// Limit of 255 characters.
        public var handle: String { __data["handle"] }
        /// Image associated with the collection.
        public var image: Image? { __data["image"] }
        /// The collection’s name. Limit of 255 characters.
        public var title: String { __data["title"] }

        /// Collections.Node.Image
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
      }
    }
  }
}
