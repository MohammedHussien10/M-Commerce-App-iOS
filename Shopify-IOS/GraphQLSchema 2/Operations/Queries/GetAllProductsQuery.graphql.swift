// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

extension GraphQLSchema {
  class GetAllProductsQuery: GraphQLQuery {
    static let operationName: String = "GetAllProducts"
    static let operationDocument: ApolloAPI.OperationDocument = .init(
      definition: .init(
        #"query GetAllProducts($first: Int, $last: Int) { products(first: $first, last: $last) { __typename nodes { __typename availableForSale category { __typename id name } descriptionHtml encodedVariantAvailability encodedVariantExistence featuredImage { __typename url } id images { __typename nodes { __typename url } } productType title totalInventory vendor variantsCount { __typename count precision } variants { __typename nodes { __typename barcode availableForSale currentlyNotInStock image { __typename url } id price { __typename amount currencyCode } sku title unitPrice { __typename amount currencyCode } quantityRule { __typename increment maximum minimum } product { __typename availableForSale descriptionHtml id featuredImage { __typename url } title totalInventory vendor } } } } } }"#
      ))

    public var first: GraphQLNullable<Int>
    public var last: GraphQLNullable<Int>

    public init(
      first: GraphQLNullable<Int>,
      last: GraphQLNullable<Int>
    ) {
      self.first = first
      self.last = last
    }

    public var __variables: Variables? { [
      "first": first,
      "last": last
    ] }

    struct Data: GraphQLSchema.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: any ApolloAPI.ParentType { GraphQLSchema.Objects.QueryRoot }
      static var __selections: [ApolloAPI.Selection] { [
        .field("products", Products.self, arguments: [
          "first": .variable("first"),
          "last": .variable("last")
        ]),
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
          .field("nodes", [Node].self),
        ] }

        /// A list of the nodes contained in ProductEdge.
        var nodes: [Node] { __data["nodes"] }

        /// Products.Node
        ///
        /// Parent Type: `Product`
        struct Node: GraphQLSchema.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: any ApolloAPI.ParentType { GraphQLSchema.Objects.Product }
          static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("availableForSale", Bool.self),
            .field("category", Category?.self),
            .field("descriptionHtml", GraphQLSchema.HTML.self),
            .field("encodedVariantAvailability", String?.self),
            .field("encodedVariantExistence", String?.self),
            .field("featuredImage", FeaturedImage?.self),
            .field("id", GraphQLSchema.ID.self),
            .field("images", Images.self),
            .field("productType", String.self),
            .field("title", String.self),
            .field("totalInventory", Int?.self),
            .field("vendor", String.self),
            .field("variantsCount", VariantsCount?.self),
            .field("variants", Variants.self),
          ] }

          /// Indicates if at least one product variant is available for sale.
          var availableForSale: Bool { __data["availableForSale"] }
          /// The category of a product from [Shopify's Standard Product Taxonomy](https://shopify.github.io/product-taxonomy/releases/unstable/?categoryId=sg-4-17-2-17).
          var category: Category? { __data["category"] }
          /// The description of the product, with
          /// HTML tags. For example, the description might include
          /// bold `<strong></strong>` and italic `<i></i>` text.
          var descriptionHtml: GraphQLSchema.HTML { __data["descriptionHtml"] }
          /// An encoded string containing all option value combinations
          /// with a corresponding variant that is currently available for sale.
          ///
          /// Integers represent option and values:
          /// [0,1] represents option_value at array index 0 for the option at array index 0
          ///
          /// `:`, `,`, ` ` and `-` are control characters.
          /// `:` indicates a new option. ex: 0:1 indicates value 0 for the option in position 1, value 1 for the option in position 2.
          /// `,` indicates the end of a repeated prefix, mulitple consecutive commas indicate the end of multiple repeated prefixes.
          /// ` ` indicates a gap in the sequence of option values. ex: 0 4 indicates option values in position 0 and 4 are present.
          /// `-` indicates a continuous range of option values. ex: 0 1-3 4
          ///
          /// Decoding process:
          ///
          /// Example options: [Size, Color, Material]
          /// Example values: [[Small, Medium, Large], [Red, Blue], [Cotton, Wool]]
          /// Example encoded string: "0:0:0,1:0-1,,1:0:0-1,1:1,,2:0:1,1:0,,"
          ///
          /// Step 1: Expand ranges into the numbers they represent: "0:0:0,1:0 1,,1:0:0 1,1:1,,2:0:1,1:0,,"
          /// Step 2: Expand repeated prefixes: "0:0:0,0:1:0 1,1:0:0 1,1:1:1,2:0:1,2:1:0,"
          /// Step 3: Expand shared prefixes so data is encoded as a string: "0:0:0,0:1:0,0:1:1,1:0:0,1:0:1,1:1:1,2:0:1,2:1:0,"
          /// Step 4: Map to options + option values to determine existing variants:
          ///
          /// [Small, Red, Cotton] (0:0:0), [Small, Blue, Cotton] (0:1:0), [Small, Blue, Wool] (0:1:1),
          /// [Medium, Red, Cotton] (1:0:0), [Medium, Red, Wool] (1:0:1), [Medium, Blue, Wool] (1:1:1),
          /// [Large, Red, Wool] (2:0:1), [Large, Blue, Cotton] (2:1:0).
          var encodedVariantAvailability: String? { __data["encodedVariantAvailability"] }
          /// An encoded string containing all option value combinations with a corresponding variant.
          ///
          /// Integers represent option and values:
          /// [0,1] represents option_value at array index 0 for the option at array index 0
          ///
          /// `:`, `,`, ` ` and `-` are control characters.
          /// `:` indicates a new option. ex: 0:1 indicates value 0 for the option in position 1, value 1 for the option in position 2.
          /// `,` indicates the end of a repeated prefix, mulitple consecutive commas indicate the end of multiple repeated prefixes.
          /// ` ` indicates a gap in the sequence of option values. ex: 0 4 indicates option values in position 0 and 4 are present.
          /// `-` indicates a continuous range of option values. ex: 0 1-3 4
          ///
          /// Decoding process:
          ///
          /// Example options: [Size, Color, Material]
          /// Example values: [[Small, Medium, Large], [Red, Blue], [Cotton, Wool]]
          /// Example encoded string: "0:0:0,1:0-1,,1:0:0-1,1:1,,2:0:1,1:0,,"
          ///
          /// Step 1: Expand ranges into the numbers they represent: "0:0:0,1:0 1,,1:0:0 1,1:1,,2:0:1,1:0,,"
          /// Step 2: Expand repeated prefixes: "0:0:0,0:1:0 1,1:0:0 1,1:1:1,2:0:1,2:1:0,"
          /// Step 3: Expand shared prefixes so data is encoded as a string: "0:0:0,0:1:0,0:1:1,1:0:0,1:0:1,1:1:1,2:0:1,2:1:0,"
          /// Step 4: Map to options + option values to determine existing variants:
          ///
          /// [Small, Red, Cotton] (0:0:0), [Small, Blue, Cotton] (0:1:0), [Small, Blue, Wool] (0:1:1),
          /// [Medium, Red, Cotton] (1:0:0), [Medium, Red, Wool] (1:0:1), [Medium, Blue, Wool] (1:1:1),
          /// [Large, Red, Wool] (2:0:1), [Large, Blue, Cotton] (2:1:0).
          var encodedVariantExistence: String? { __data["encodedVariantExistence"] }
          /// The featured image for the product.
          ///
          /// This field is functionally equivalent to `images(first: 1)`.
          var featuredImage: FeaturedImage? { __data["featuredImage"] }
          /// A globally-unique ID.
          var id: GraphQLSchema.ID { __data["id"] }
          /// List of images associated with the product.
          var images: Images { __data["images"] }
          /// The [product type](https://help.shopify.com/manual/products/details/product-type)
          /// that merchants define.
          var productType: String { __data["productType"] }
          /// The name for the product that displays to customers. The title is used to construct the product's handle.
          /// For example, if a product is titled "Black Sunglasses", then the handle is `black-sunglasses`.
          var title: String { __data["title"] }
          /// The quantity of inventory that's in stock.
          var totalInventory: Int? { __data["totalInventory"] }
          /// The name of the product's vendor.
          var vendor: String { __data["vendor"] }
          /// The number of [variants](/docs/api/storefront/latest/objects/ProductVariant) that are associated with the product.
          var variantsCount: VariantsCount? { __data["variantsCount"] }
          /// A list of [variants](/docs/api/storefront/latest/objects/ProductVariant) that are associated with the product.
          var variants: Variants { __data["variants"] }

          /// Products.Node.Category
          ///
          /// Parent Type: `TaxonomyCategory`
          struct Category: GraphQLSchema.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: any ApolloAPI.ParentType { GraphQLSchema.Objects.TaxonomyCategory }
            static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("id", GraphQLSchema.ID.self),
              .field("name", String.self),
            ] }

            /// A static identifier for the taxonomy category.
            var id: GraphQLSchema.ID { __data["id"] }
            /// The localized name of the taxonomy category.
            var name: String { __data["name"] }
          }

          /// Products.Node.FeaturedImage
          ///
          /// Parent Type: `Image`
          struct FeaturedImage: GraphQLSchema.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: any ApolloAPI.ParentType { GraphQLSchema.Objects.Image }
            static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("url", GraphQLSchema.URL.self),
            ] }

            /// The location of the image as a URL.
            ///
            /// If no transform options are specified, then the original image will be preserved including any pre-applied transforms.
            ///
            /// All transformation options are considered "best-effort". Any transformation that the original image type doesn't support will be ignored.
            ///
            /// If you need multiple variations of the same image, then you can use [GraphQL aliases](https://graphql.org/learn/queries/#aliases).
            var url: GraphQLSchema.URL { __data["url"] }
          }

          /// Products.Node.Images
          ///
          /// Parent Type: `ImageConnection`
          struct Images: GraphQLSchema.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: any ApolloAPI.ParentType { GraphQLSchema.Objects.ImageConnection }
            static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("nodes", [Node].self),
            ] }

            /// A list of the nodes contained in ImageEdge.
            var nodes: [Node] { __data["nodes"] }

            /// Products.Node.Images.Node
            ///
            /// Parent Type: `Image`
            struct Node: GraphQLSchema.SelectionSet {
              let __data: DataDict
              init(_dataDict: DataDict) { __data = _dataDict }

              static var __parentType: any ApolloAPI.ParentType { GraphQLSchema.Objects.Image }
              static var __selections: [ApolloAPI.Selection] { [
                .field("__typename", String.self),
                .field("url", GraphQLSchema.URL.self),
              ] }

              /// The location of the image as a URL.
              ///
              /// If no transform options are specified, then the original image will be preserved including any pre-applied transforms.
              ///
              /// All transformation options are considered "best-effort". Any transformation that the original image type doesn't support will be ignored.
              ///
              /// If you need multiple variations of the same image, then you can use [GraphQL aliases](https://graphql.org/learn/queries/#aliases).
              var url: GraphQLSchema.URL { __data["url"] }
            }
          }

          /// Products.Node.VariantsCount
          ///
          /// Parent Type: `Count`
          struct VariantsCount: GraphQLSchema.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: any ApolloAPI.ParentType { GraphQLSchema.Objects.Count }
            static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("count", Int.self),
              .field("precision", GraphQLEnum<GraphQLSchema.CountPrecision>.self),
            ] }

            /// Count of elements.
            var count: Int { __data["count"] }
            /// Precision of count, how exact is the value.
            var precision: GraphQLEnum<GraphQLSchema.CountPrecision> { __data["precision"] }
          }

          /// Products.Node.Variants
          ///
          /// Parent Type: `ProductVariantConnection`
          struct Variants: GraphQLSchema.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: any ApolloAPI.ParentType { GraphQLSchema.Objects.ProductVariantConnection }
            static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("nodes", [Node].self),
            ] }

            /// A list of the nodes contained in ProductVariantEdge.
            var nodes: [Node] { __data["nodes"] }

            /// Products.Node.Variants.Node
            ///
            /// Parent Type: `ProductVariant`
            struct Node: GraphQLSchema.SelectionSet {
              let __data: DataDict
              init(_dataDict: DataDict) { __data = _dataDict }

              static var __parentType: any ApolloAPI.ParentType { GraphQLSchema.Objects.ProductVariant }
              static var __selections: [ApolloAPI.Selection] { [
                .field("__typename", String.self),
                .field("barcode", String?.self),
                .field("availableForSale", Bool.self),
                .field("currentlyNotInStock", Bool.self),
                .field("image", Image?.self),
                .field("id", GraphQLSchema.ID.self),
                .field("price", Price.self),
                .field("sku", String?.self),
                .field("title", String.self),
                .field("unitPrice", UnitPrice?.self),
                .field("quantityRule", QuantityRule.self),
                .field("product", Product.self),
              ] }

              /// The barcode (for example, ISBN, UPC, or GTIN) associated with the variant.
              var barcode: String? { __data["barcode"] }
              /// Indicates if the product variant is available for sale.
              var availableForSale: Bool { __data["availableForSale"] }
              /// Whether a product is out of stock but still available for purchase (used for backorders).
              var currentlyNotInStock: Bool { __data["currentlyNotInStock"] }
              /// Image associated with the product variant. This field falls back to the product image if no image is available.
              var image: Image? { __data["image"] }
              /// A globally-unique ID.
              var id: GraphQLSchema.ID { __data["id"] }
              /// The product variant’s price.
              var price: Price { __data["price"] }
              /// The SKU (stock keeping unit) associated with the variant.
              var sku: String? { __data["sku"] }
              /// The product variant’s title.
              var title: String { __data["title"] }
              /// The unit price value for the variant based on the variant's measurement.
              var unitPrice: UnitPrice? { __data["unitPrice"] }
              /// The quantity rule for the product variant in a given context.
              var quantityRule: QuantityRule { __data["quantityRule"] }
              /// The product object that the product variant belongs to.
              var product: Product { __data["product"] }

              /// Products.Node.Variants.Node.Image
              ///
              /// Parent Type: `Image`
              struct Image: GraphQLSchema.SelectionSet {
                let __data: DataDict
                init(_dataDict: DataDict) { __data = _dataDict }

                static var __parentType: any ApolloAPI.ParentType { GraphQLSchema.Objects.Image }
                static var __selections: [ApolloAPI.Selection] { [
                  .field("__typename", String.self),
                  .field("url", GraphQLSchema.URL.self),
                ] }

                /// The location of the image as a URL.
                ///
                /// If no transform options are specified, then the original image will be preserved including any pre-applied transforms.
                ///
                /// All transformation options are considered "best-effort". Any transformation that the original image type doesn't support will be ignored.
                ///
                /// If you need multiple variations of the same image, then you can use [GraphQL aliases](https://graphql.org/learn/queries/#aliases).
                var url: GraphQLSchema.URL { __data["url"] }
              }

              /// Products.Node.Variants.Node.Price
              ///
              /// Parent Type: `MoneyV2`
              struct Price: GraphQLSchema.SelectionSet {
                let __data: DataDict
                init(_dataDict: DataDict) { __data = _dataDict }

                static var __parentType: any ApolloAPI.ParentType { GraphQLSchema.Objects.MoneyV2 }
                static var __selections: [ApolloAPI.Selection] { [
                  .field("__typename", String.self),
                  .field("amount", GraphQLSchema.Decimal.self),
                  .field("currencyCode", GraphQLEnum<GraphQLSchema.CurrencyCode>.self),
                ] }

                /// Decimal money amount.
                var amount: GraphQLSchema.Decimal { __data["amount"] }
                /// Currency of the money.
                var currencyCode: GraphQLEnum<GraphQLSchema.CurrencyCode> { __data["currencyCode"] }
              }

              /// Products.Node.Variants.Node.UnitPrice
              ///
              /// Parent Type: `MoneyV2`
              struct UnitPrice: GraphQLSchema.SelectionSet {
                let __data: DataDict
                init(_dataDict: DataDict) { __data = _dataDict }

                static var __parentType: any ApolloAPI.ParentType { GraphQLSchema.Objects.MoneyV2 }
                static var __selections: [ApolloAPI.Selection] { [
                  .field("__typename", String.self),
                  .field("amount", GraphQLSchema.Decimal.self),
                  .field("currencyCode", GraphQLEnum<GraphQLSchema.CurrencyCode>.self),
                ] }

                /// Decimal money amount.
                var amount: GraphQLSchema.Decimal { __data["amount"] }
                /// Currency of the money.
                var currencyCode: GraphQLEnum<GraphQLSchema.CurrencyCode> { __data["currencyCode"] }
              }

              /// Products.Node.Variants.Node.QuantityRule
              ///
              /// Parent Type: `QuantityRule`
              struct QuantityRule: GraphQLSchema.SelectionSet {
                let __data: DataDict
                init(_dataDict: DataDict) { __data = _dataDict }

                static var __parentType: any ApolloAPI.ParentType { GraphQLSchema.Objects.QuantityRule }
                static var __selections: [ApolloAPI.Selection] { [
                  .field("__typename", String.self),
                  .field("increment", Int.self),
                  .field("maximum", Int?.self),
                  .field("minimum", Int.self),
                ] }

                /// The value that specifies the quantity increment between minimum and maximum of the rule.
                /// Only quantities divisible by this value will be considered valid.
                ///
                /// The increment must be lower than or equal to the minimum and the maximum, and both minimum and maximum
                /// must be divisible by this value.
                var increment: Int { __data["increment"] }
                /// An optional value that defines the highest allowed quantity purchased by the customer.
                /// If defined, maximum must be lower than or equal to the minimum and must be a multiple of the increment.
                var maximum: Int? { __data["maximum"] }
                /// The value that defines the lowest allowed quantity purchased by the customer.
                /// The minimum must be a multiple of the quantity rule's increment.
                var minimum: Int { __data["minimum"] }
              }

              /// Products.Node.Variants.Node.Product
              ///
              /// Parent Type: `Product`
              struct Product: GraphQLSchema.SelectionSet {
                let __data: DataDict
                init(_dataDict: DataDict) { __data = _dataDict }

                static var __parentType: any ApolloAPI.ParentType { GraphQLSchema.Objects.Product }
                static var __selections: [ApolloAPI.Selection] { [
                  .field("__typename", String.self),
                  .field("availableForSale", Bool.self),
                  .field("descriptionHtml", GraphQLSchema.HTML.self),
                  .field("id", GraphQLSchema.ID.self),
                  .field("featuredImage", FeaturedImage?.self),
                  .field("title", String.self),
                  .field("totalInventory", Int?.self),
                  .field("vendor", String.self),
                ] }

                /// Indicates if at least one product variant is available for sale.
                var availableForSale: Bool { __data["availableForSale"] }
                /// The description of the product, with
                /// HTML tags. For example, the description might include
                /// bold `<strong></strong>` and italic `<i></i>` text.
                var descriptionHtml: GraphQLSchema.HTML { __data["descriptionHtml"] }
                /// A globally-unique ID.
                var id: GraphQLSchema.ID { __data["id"] }
                /// The featured image for the product.
                ///
                /// This field is functionally equivalent to `images(first: 1)`.
                var featuredImage: FeaturedImage? { __data["featuredImage"] }
                /// The name for the product that displays to customers. The title is used to construct the product's handle.
                /// For example, if a product is titled "Black Sunglasses", then the handle is `black-sunglasses`.
                var title: String { __data["title"] }
                /// The quantity of inventory that's in stock.
                var totalInventory: Int? { __data["totalInventory"] }
                /// The name of the product's vendor.
                var vendor: String { __data["vendor"] }

                /// Products.Node.Variants.Node.Product.FeaturedImage
                ///
                /// Parent Type: `Image`
                struct FeaturedImage: GraphQLSchema.SelectionSet {
                  let __data: DataDict
                  init(_dataDict: DataDict) { __data = _dataDict }

                  static var __parentType: any ApolloAPI.ParentType { GraphQLSchema.Objects.Image }
                  static var __selections: [ApolloAPI.Selection] { [
                    .field("__typename", String.self),
                    .field("url", GraphQLSchema.URL.self),
                  ] }

                  /// The location of the image as a URL.
                  ///
                  /// If no transform options are specified, then the original image will be preserved including any pre-applied transforms.
                  ///
                  /// All transformation options are considered "best-effort". Any transformation that the original image type doesn't support will be ignored.
                  ///
                  /// If you need multiple variations of the same image, then you can use [GraphQL aliases](https://graphql.org/learn/queries/#aliases).
                  var url: GraphQLSchema.URL { __data["url"] }
                }
              }
            }
          }
        }
      }
    }
  }

}