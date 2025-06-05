// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

protocol GraphQLSchema_SelectionSet: ApolloAPI.SelectionSet & ApolloAPI.RootSelectionSet
where Schema == GraphQLSchema.SchemaMetadata {}

protocol GraphQLSchema_InlineFragment: ApolloAPI.SelectionSet & ApolloAPI.InlineFragment
where Schema == GraphQLSchema.SchemaMetadata {}

protocol GraphQLSchema_MutableSelectionSet: ApolloAPI.MutableRootSelectionSet
where Schema == GraphQLSchema.SchemaMetadata {}

protocol GraphQLSchema_MutableInlineFragment: ApolloAPI.MutableSelectionSet & ApolloAPI.InlineFragment
where Schema == GraphQLSchema.SchemaMetadata {}

extension GraphQLSchema {
  typealias SelectionSet = GraphQLSchema_SelectionSet

  typealias InlineFragment = GraphQLSchema_InlineFragment

  typealias MutableSelectionSet = GraphQLSchema_MutableSelectionSet

  typealias MutableInlineFragment = GraphQLSchema_MutableInlineFragment

  enum SchemaMetadata: ApolloAPI.SchemaMetadata {
    static let configuration: any ApolloAPI.SchemaConfiguration.Type = SchemaConfiguration.self

    static func objectType(forTypename typename: String) -> ApolloAPI.Object? {
      switch typename {
      case "AppliedGiftCard": return GraphQLSchema.Objects.AppliedGiftCard
      case "Article": return GraphQLSchema.Objects.Article
      case "Blog": return GraphQLSchema.Objects.Blog
      case "Cart": return GraphQLSchema.Objects.Cart
      case "CartLine": return GraphQLSchema.Objects.CartLine
      case "Collection": return GraphQLSchema.Objects.Collection
      case "Comment": return GraphQLSchema.Objects.Comment
      case "Company": return GraphQLSchema.Objects.Company
      case "CompanyContact": return GraphQLSchema.Objects.CompanyContact
      case "CompanyLocation": return GraphQLSchema.Objects.CompanyLocation
      case "ComponentizableCartLine": return GraphQLSchema.Objects.ComponentizableCartLine
      case "Count": return GraphQLSchema.Objects.Count
      case "Customer": return GraphQLSchema.Objects.Customer
      case "ExternalVideo": return GraphQLSchema.Objects.ExternalVideo
      case "GenericFile": return GraphQLSchema.Objects.GenericFile
      case "Image": return GraphQLSchema.Objects.Image
      case "ImageConnection": return GraphQLSchema.Objects.ImageConnection
      case "Location": return GraphQLSchema.Objects.Location
      case "MailingAddress": return GraphQLSchema.Objects.MailingAddress
      case "Market": return GraphQLSchema.Objects.Market
      case "MediaImage": return GraphQLSchema.Objects.MediaImage
      case "MediaPresentation": return GraphQLSchema.Objects.MediaPresentation
      case "Menu": return GraphQLSchema.Objects.Menu
      case "MenuItem": return GraphQLSchema.Objects.MenuItem
      case "Metafield": return GraphQLSchema.Objects.Metafield
      case "Metaobject": return GraphQLSchema.Objects.Metaobject
      case "Model3d": return GraphQLSchema.Objects.Model3d
      case "MoneyV2": return GraphQLSchema.Objects.MoneyV2
      case "Order": return GraphQLSchema.Objects.Order
      case "Page": return GraphQLSchema.Objects.Page
      case "Product": return GraphQLSchema.Objects.Product
      case "ProductConnection": return GraphQLSchema.Objects.ProductConnection
      case "ProductOption": return GraphQLSchema.Objects.ProductOption
      case "ProductOptionValue": return GraphQLSchema.Objects.ProductOptionValue
      case "ProductVariant": return GraphQLSchema.Objects.ProductVariant
      case "ProductVariantConnection": return GraphQLSchema.Objects.ProductVariantConnection
      case "QuantityRule": return GraphQLSchema.Objects.QuantityRule
      case "QueryRoot": return GraphQLSchema.Objects.QueryRoot
      case "SearchQuerySuggestion": return GraphQLSchema.Objects.SearchQuerySuggestion
      case "SellingPlan": return GraphQLSchema.Objects.SellingPlan
      case "Shop": return GraphQLSchema.Objects.Shop
      case "ShopPayInstallmentsFinancingPlan": return GraphQLSchema.Objects.ShopPayInstallmentsFinancingPlan
      case "ShopPayInstallmentsFinancingPlanTerm": return GraphQLSchema.Objects.ShopPayInstallmentsFinancingPlanTerm
      case "ShopPayInstallmentsProductVariantPricing": return GraphQLSchema.Objects.ShopPayInstallmentsProductVariantPricing
      case "ShopPolicy": return GraphQLSchema.Objects.ShopPolicy
      case "TaxonomyCategory": return GraphQLSchema.Objects.TaxonomyCategory
      case "UrlRedirect": return GraphQLSchema.Objects.UrlRedirect
      case "Video": return GraphQLSchema.Objects.Video
      default: return nil
      }
    }
  }

  enum Objects {}
  enum Interfaces {}
  enum Unions {}

}