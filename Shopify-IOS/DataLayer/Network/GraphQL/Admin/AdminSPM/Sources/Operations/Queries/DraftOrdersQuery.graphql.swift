// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class DraftOrdersQuery: GraphQLQuery {
  public static let operationName: String = "DraftOrdersQuery"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query DraftOrdersQuery($first: Int!) { draftOrders(first: $first) { __typename nodes { __typename id name email note2 lineItems(first: 100) { __typename nodes { __typename quantity variant { __typename id title price } product { __typename id title featuredImage { __typename url } } } } } } }"#
    ))

  public var first: Int

  public init(first: Int) {
    self.first = first
  }

  public var __variables: Variables? { ["first": first] }

  public struct Data: AdminNameSpace.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { AdminNameSpace.Objects.QueryRoot }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("draftOrders", DraftOrders.self, arguments: ["first": .variable("first")]),
    ] }

    /// List of saved draft orders.
    public var draftOrders: DraftOrders { __data["draftOrders"] }

    /// DraftOrders
    ///
    /// Parent Type: `DraftOrderConnection`
    public struct DraftOrders: AdminNameSpace.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: any ApolloAPI.ParentType { AdminNameSpace.Objects.DraftOrderConnection }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("nodes", [Node].self),
      ] }

      /// A list of nodes that are contained in DraftOrderEdge. You can fetch data about an individual node, or you can follow the edges to fetch data about a collection of related nodes. At each node, you specify the fields that you want to retrieve.
      public var nodes: [Node] { __data["nodes"] }

      /// DraftOrders.Node
      ///
      /// Parent Type: `DraftOrder`
      public struct Node: AdminNameSpace.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { AdminNameSpace.Objects.DraftOrder }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("id", AdminNameSpace.ID.self),
          .field("name", String.self),
          .field("email", String?.self),
          .field("note2", String?.self),
          .field("lineItems", LineItems.self, arguments: ["first": 100]),
        ] }

        /// A globally-unique ID.
        public var id: AdminNameSpace.ID { __data["id"] }
        /// The identifier for the draft order, which is unique within the store. For example, _#D1223_.
        public var name: String { __data["name"] }
        /// The email address of the customer, which is used to send notifications.
        public var email: String? { __data["email"] }
        /// The text from an optional note attached to the draft order.
        public var note2: String? { __data["note2"] }
        /// The list of the line items in the draft order.
        public var lineItems: LineItems { __data["lineItems"] }

        /// DraftOrders.Node.LineItems
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

          /// DraftOrders.Node.LineItems.Node
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

            /// DraftOrders.Node.LineItems.Node.Variant
            ///
            /// Parent Type: `ProductVariant`
            public struct Variant: AdminNameSpace.SelectionSet {
              public let __data: DataDict
              public init(_dataDict: DataDict) { __data = _dataDict }

              public static var __parentType: any ApolloAPI.ParentType { AdminNameSpace.Objects.ProductVariant }
              public static var __selections: [ApolloAPI.Selection] { [
                .field("__typename", String.self),
                .field("id", AdminNameSpace.ID.self),
                .field("title", String.self),
                .field("price", AdminNameSpace.Money.self),
              ] }

              /// A globally-unique ID.
              public var id: AdminNameSpace.ID { __data["id"] }
              /// The title of the product variant.
              public var title: String { __data["title"] }
              /// The price of the product variant in the default shop currency.
              public var price: AdminNameSpace.Money { __data["price"] }
            }

            /// DraftOrders.Node.LineItems.Node.Product
            ///
            /// Parent Type: `Product`
            public struct Product: AdminNameSpace.SelectionSet {
              public let __data: DataDict
              public init(_dataDict: DataDict) { __data = _dataDict }

              public static var __parentType: any ApolloAPI.ParentType { AdminNameSpace.Objects.Product }
              public static var __selections: [ApolloAPI.Selection] { [
                .field("__typename", String.self),
                .field("id", AdminNameSpace.ID.self),
                .field("title", String.self),
                .field("featuredImage", FeaturedImage?.self),
              ] }

              /// A globally-unique ID.
              public var id: AdminNameSpace.ID { __data["id"] }
              /// The name for the product that displays to customers. The title is used to construct the product's handle.
              /// For example, if a product is titled "Black Sunglasses", then the handle is `black-sunglasses`.
              public var title: String { __data["title"] }
              /// The featured image for the product.
              @available(*, deprecated, message: "Use `featuredMedia` instead.")
              public var featuredImage: FeaturedImage? { __data["featuredImage"] }

              /// DraftOrders.Node.LineItems.Node.Product.FeaturedImage
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
