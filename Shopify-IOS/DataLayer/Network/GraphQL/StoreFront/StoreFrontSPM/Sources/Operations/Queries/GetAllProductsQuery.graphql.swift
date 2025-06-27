// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class GetAllProductsQuery: GraphQLQuery {
  public static let operationName: String = "GetAllProducts"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query GetAllProducts($first: Int) { products(first: $first) { __typename nodes { __typename availableForSale category { __typename id name } descriptionHtml encodedVariantAvailability encodedVariantExistence featuredImage { __typename url } id images(first: $first) { __typename nodes { __typename url } } productType title totalInventory vendor variantsCount { __typename count precision } variants(first: $first) { __typename nodes { __typename barcode availableForSale currentlyNotInStock image { __typename url } id price { __typename amount currencyCode } sku title unitPrice { __typename amount currencyCode } selectedOptions { __typename name value } quantityRule { __typename increment maximum minimum } product { __typename availableForSale descriptionHtml id featuredImage { __typename url } title totalInventory vendor } } } tags } } }"#
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
      .field("products", Products.self, arguments: ["first": .variable("first")]),
    ] }

    /// Returns a list of the shop's products. For storefront search, use the [`search`](https://shopify.dev/docs/api/storefront/latest/queries/search) query.
    public var products: Products { __data["products"] }

    /// Products
    ///
    /// Parent Type: `ProductConnection`
    public struct Products: StoreFrontNameSpace.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: any ApolloAPI.ParentType { StoreFrontNameSpace.Objects.ProductConnection }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("nodes", [Node].self),
      ] }

      /// A list of the nodes contained in ProductEdge.
      public var nodes: [Node] { __data["nodes"] }

      /// Products.Node
      ///
      /// Parent Type: `Product`
      public struct Node: StoreFrontNameSpace.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { StoreFrontNameSpace.Objects.Product }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("availableForSale", Bool.self),
          .field("category", Category?.self),
          .field("descriptionHtml", StoreFrontNameSpace.HTML.self),
          .field("encodedVariantAvailability", String?.self),
          .field("encodedVariantExistence", String?.self),
          .field("featuredImage", FeaturedImage?.self),
          .field("id", StoreFrontNameSpace.ID.self),
          .field("images", Images.self, arguments: ["first": .variable("first")]),
          .field("productType", String.self),
          .field("title", String.self),
          .field("totalInventory", Int?.self),
          .field("vendor", String.self),
          .field("variantsCount", VariantsCount?.self),
          .field("variants", Variants.self, arguments: ["first": .variable("first")]),
          .field("tags", [String].self),
        ] }

        /// Indicates if at least one product variant is available for sale.
        public var availableForSale: Bool { __data["availableForSale"] }
        /// The category of a product from [Shopify's Standard Product Taxonomy](https://shopify.github.io/product-taxonomy/releases/unstable/?categoryId=sg-4-17-2-17).
        public var category: Category? { __data["category"] }
        /// The description of the product, with
        /// HTML tags. For example, the description might include
        /// bold `<strong></strong>` and italic `<i></i>` text.
        public var descriptionHtml: StoreFrontNameSpace.HTML { __data["descriptionHtml"] }
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
        public var encodedVariantAvailability: String? { __data["encodedVariantAvailability"] }
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
        public var encodedVariantExistence: String? { __data["encodedVariantExistence"] }
        /// The featured image for the product.
        ///
        /// This field is functionally equivalent to `images(first: 1)`.
        public var featuredImage: FeaturedImage? { __data["featuredImage"] }
        /// A globally-unique ID.
        public var id: StoreFrontNameSpace.ID { __data["id"] }
        /// List of images associated with the product.
        public var images: Images { __data["images"] }
        /// The [product type](https://help.shopify.com/manual/products/details/product-type)
        /// that merchants define.
        public var productType: String { __data["productType"] }
        /// The name for the product that displays to customers. The title is used to construct the product's handle.
        /// For example, if a product is titled "Black Sunglasses", then the handle is `black-sunglasses`.
        public var title: String { __data["title"] }
        /// The quantity of inventory that's in stock.
        public var totalInventory: Int? { __data["totalInventory"] }
        /// The name of the product's vendor.
        public var vendor: String { __data["vendor"] }
        /// The number of [variants](/docs/api/storefront/latest/objects/ProductVariant) that are associated with the product.
        public var variantsCount: VariantsCount? { __data["variantsCount"] }
        /// A list of [variants](/docs/api/storefront/latest/objects/ProductVariant) that are associated with the product.
        public var variants: Variants { __data["variants"] }
        /// A comma-separated list of searchable keywords that are
        /// associated with the product. For example, a merchant might apply the `sports`
        /// and `summer` tags to products that are associated with sportwear for summer.
        /// Updating `tags` overwrites any existing tags that were previously added to the product.
        /// To add new tags without overwriting existing tags,
        /// use the GraphQL Admin API's [`tagsAdd`](/docs/api/admin-graphql/latest/mutations/tagsadd)
        /// mutation.
        public var tags: [String] { __data["tags"] }

        /// Products.Node.Category
        ///
        /// Parent Type: `TaxonomyCategory`
        public struct Category: StoreFrontNameSpace.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: any ApolloAPI.ParentType { StoreFrontNameSpace.Objects.TaxonomyCategory }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("id", StoreFrontNameSpace.ID.self),
            .field("name", String.self),
          ] }

          /// A static identifier for the taxonomy category.
          public var id: StoreFrontNameSpace.ID { __data["id"] }
          /// The localized name of the taxonomy category.
          public var name: String { __data["name"] }
        }

        /// Products.Node.FeaturedImage
        ///
        /// Parent Type: `Image`
        public struct FeaturedImage: StoreFrontNameSpace.SelectionSet {
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

        /// Products.Node.Images
        ///
        /// Parent Type: `ImageConnection`
        public struct Images: StoreFrontNameSpace.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: any ApolloAPI.ParentType { StoreFrontNameSpace.Objects.ImageConnection }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("nodes", [Node].self),
          ] }

          /// A list of the nodes contained in ImageEdge.
          public var nodes: [Node] { __data["nodes"] }

          /// Products.Node.Images.Node
          ///
          /// Parent Type: `Image`
          public struct Node: StoreFrontNameSpace.SelectionSet {
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

        /// Products.Node.VariantsCount
        ///
        /// Parent Type: `Count`
        public struct VariantsCount: StoreFrontNameSpace.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: any ApolloAPI.ParentType { StoreFrontNameSpace.Objects.Count }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("count", Int.self),
            .field("precision", GraphQLEnum<StoreFrontNameSpace.CountPrecision>.self),
          ] }

          /// Count of elements.
          public var count: Int { __data["count"] }
          /// Precision of count, how exact is the value.
          public var precision: GraphQLEnum<StoreFrontNameSpace.CountPrecision> { __data["precision"] }
        }

        /// Products.Node.Variants
        ///
        /// Parent Type: `ProductVariantConnection`
        public struct Variants: StoreFrontNameSpace.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: any ApolloAPI.ParentType { StoreFrontNameSpace.Objects.ProductVariantConnection }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("nodes", [Node].self),
          ] }

          /// A list of the nodes contained in ProductVariantEdge.
          public var nodes: [Node] { __data["nodes"] }

          /// Products.Node.Variants.Node
          ///
          /// Parent Type: `ProductVariant`
          public struct Node: StoreFrontNameSpace.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: any ApolloAPI.ParentType { StoreFrontNameSpace.Objects.ProductVariant }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("barcode", String?.self),
              .field("availableForSale", Bool.self),
              .field("currentlyNotInStock", Bool.self),
              .field("image", Image?.self),
              .field("id", StoreFrontNameSpace.ID.self),
              .field("price", Price.self),
              .field("sku", String?.self),
              .field("title", String.self),
              .field("unitPrice", UnitPrice?.self),
              .field("selectedOptions", [SelectedOption].self),
              .field("quantityRule", QuantityRule.self),
              .field("product", Product.self),
            ] }

            /// The barcode (for example, ISBN, UPC, or GTIN) associated with the variant.
            public var barcode: String? { __data["barcode"] }
            /// Indicates if the product variant is available for sale.
            public var availableForSale: Bool { __data["availableForSale"] }
            /// Whether a product is out of stock but still available for purchase (used for backorders).
            public var currentlyNotInStock: Bool { __data["currentlyNotInStock"] }
            /// Image associated with the product variant. This field falls back to the product image if no image is available.
            public var image: Image? { __data["image"] }
            /// A globally-unique ID.
            public var id: StoreFrontNameSpace.ID { __data["id"] }
            /// The product variant’s price.
            public var price: Price { __data["price"] }
            /// The SKU (stock keeping unit) associated with the variant.
            public var sku: String? { __data["sku"] }
            /// The product variant’s title.
            public var title: String { __data["title"] }
            /// The unit price value for the variant based on the variant's measurement.
            public var unitPrice: UnitPrice? { __data["unitPrice"] }
            /// List of product options applied to the variant.
            public var selectedOptions: [SelectedOption] { __data["selectedOptions"] }
            /// The quantity rule for the product variant in a given context.
            public var quantityRule: QuantityRule { __data["quantityRule"] }
            /// The product object that the product variant belongs to.
            public var product: Product { __data["product"] }

            /// Products.Node.Variants.Node.Image
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

            /// Products.Node.Variants.Node.Price
            ///
            /// Parent Type: `MoneyV2`
            public struct Price: StoreFrontNameSpace.SelectionSet {
              public let __data: DataDict
              public init(_dataDict: DataDict) { __data = _dataDict }

              public static var __parentType: any ApolloAPI.ParentType { StoreFrontNameSpace.Objects.MoneyV2 }
              public static var __selections: [ApolloAPI.Selection] { [
                .field("__typename", String.self),
                .field("amount", StoreFrontNameSpace.Decimal.self),
                .field("currencyCode", GraphQLEnum<StoreFrontNameSpace.CurrencyCode>.self),
              ] }

              /// Decimal money amount.
              public var amount: StoreFrontNameSpace.Decimal { __data["amount"] }
              /// Currency of the money.
              public var currencyCode: GraphQLEnum<StoreFrontNameSpace.CurrencyCode> { __data["currencyCode"] }
            }

            /// Products.Node.Variants.Node.UnitPrice
            ///
            /// Parent Type: `MoneyV2`
            public struct UnitPrice: StoreFrontNameSpace.SelectionSet {
              public let __data: DataDict
              public init(_dataDict: DataDict) { __data = _dataDict }

              public static var __parentType: any ApolloAPI.ParentType { StoreFrontNameSpace.Objects.MoneyV2 }
              public static var __selections: [ApolloAPI.Selection] { [
                .field("__typename", String.self),
                .field("amount", StoreFrontNameSpace.Decimal.self),
                .field("currencyCode", GraphQLEnum<StoreFrontNameSpace.CurrencyCode>.self),
              ] }

              /// Decimal money amount.
              public var amount: StoreFrontNameSpace.Decimal { __data["amount"] }
              /// Currency of the money.
              public var currencyCode: GraphQLEnum<StoreFrontNameSpace.CurrencyCode> { __data["currencyCode"] }
            }

            /// Products.Node.Variants.Node.SelectedOption
            ///
            /// Parent Type: `SelectedOption`
            public struct SelectedOption: StoreFrontNameSpace.SelectionSet {
              public let __data: DataDict
              public init(_dataDict: DataDict) { __data = _dataDict }

              public static var __parentType: any ApolloAPI.ParentType { StoreFrontNameSpace.Objects.SelectedOption }
              public static var __selections: [ApolloAPI.Selection] { [
                .field("__typename", String.self),
                .field("name", String.self),
                .field("value", String.self),
              ] }

              /// The product option’s name.
              public var name: String { __data["name"] }
              /// The product option’s value.
              public var value: String { __data["value"] }
            }

            /// Products.Node.Variants.Node.QuantityRule
            ///
            /// Parent Type: `QuantityRule`
            public struct QuantityRule: StoreFrontNameSpace.SelectionSet {
              public let __data: DataDict
              public init(_dataDict: DataDict) { __data = _dataDict }

              public static var __parentType: any ApolloAPI.ParentType { StoreFrontNameSpace.Objects.QuantityRule }
              public static var __selections: [ApolloAPI.Selection] { [
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
              public var increment: Int { __data["increment"] }
              /// An optional value that defines the highest allowed quantity purchased by the customer.
              /// If defined, maximum must be lower than or equal to the minimum and must be a multiple of the increment.
              public var maximum: Int? { __data["maximum"] }
              /// The value that defines the lowest allowed quantity purchased by the customer.
              /// The minimum must be a multiple of the quantity rule's increment.
              public var minimum: Int { __data["minimum"] }
            }

            /// Products.Node.Variants.Node.Product
            ///
            /// Parent Type: `Product`
            public struct Product: StoreFrontNameSpace.SelectionSet {
              public let __data: DataDict
              public init(_dataDict: DataDict) { __data = _dataDict }

              public static var __parentType: any ApolloAPI.ParentType { StoreFrontNameSpace.Objects.Product }
              public static var __selections: [ApolloAPI.Selection] { [
                .field("__typename", String.self),
                .field("availableForSale", Bool.self),
                .field("descriptionHtml", StoreFrontNameSpace.HTML.self),
                .field("id", StoreFrontNameSpace.ID.self),
                .field("featuredImage", FeaturedImage?.self),
                .field("title", String.self),
                .field("totalInventory", Int?.self),
                .field("vendor", String.self),
              ] }

              /// Indicates if at least one product variant is available for sale.
              public var availableForSale: Bool { __data["availableForSale"] }
              /// The description of the product, with
              /// HTML tags. For example, the description might include
              /// bold `<strong></strong>` and italic `<i></i>` text.
              public var descriptionHtml: StoreFrontNameSpace.HTML { __data["descriptionHtml"] }
              /// A globally-unique ID.
              public var id: StoreFrontNameSpace.ID { __data["id"] }
              /// The featured image for the product.
              ///
              /// This field is functionally equivalent to `images(first: 1)`.
              public var featuredImage: FeaturedImage? { __data["featuredImage"] }
              /// The name for the product that displays to customers. The title is used to construct the product's handle.
              /// For example, if a product is titled "Black Sunglasses", then the handle is `black-sunglasses`.
              public var title: String { __data["title"] }
              /// The quantity of inventory that's in stock.
              public var totalInventory: Int? { __data["totalInventory"] }
              /// The name of the product's vendor.
              public var vendor: String { __data["vendor"] }

              /// Products.Node.Variants.Node.Product.FeaturedImage
              ///
              /// Parent Type: `Image`
              public struct FeaturedImage: StoreFrontNameSpace.SelectionSet {
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
    }
  }
}
