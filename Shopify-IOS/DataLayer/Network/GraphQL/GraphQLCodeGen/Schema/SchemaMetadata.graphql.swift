// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

protocol GraphQLCodeGen_SelectionSet: ApolloAPI.SelectionSet & ApolloAPI.RootSelectionSet
where Schema == GraphQLCodeGen.SchemaMetadata {}

protocol GraphQLCodeGen_InlineFragment: ApolloAPI.SelectionSet & ApolloAPI.InlineFragment
where Schema == GraphQLCodeGen.SchemaMetadata {}

protocol GraphQLCodeGen_MutableSelectionSet: ApolloAPI.MutableRootSelectionSet
where Schema == GraphQLCodeGen.SchemaMetadata {}

protocol GraphQLCodeGen_MutableInlineFragment: ApolloAPI.MutableSelectionSet & ApolloAPI.InlineFragment
where Schema == GraphQLCodeGen.SchemaMetadata {}

extension GraphQLCodeGen {
  typealias SelectionSet = GraphQLCodeGen_SelectionSet

  typealias InlineFragment = GraphQLCodeGen_InlineFragment

  typealias MutableSelectionSet = GraphQLCodeGen_MutableSelectionSet

  typealias MutableInlineFragment = GraphQLCodeGen_MutableInlineFragment

  enum SchemaMetadata: ApolloAPI.SchemaMetadata {
    static let configuration: any ApolloAPI.SchemaConfiguration.Type = SchemaConfiguration.self

    static func objectType(forTypename typename: String) -> ApolloAPI.Object? {
      switch typename {
      case "AppliedGiftCard": return GraphQLCodeGen.Objects.AppliedGiftCard
      case "Article": return GraphQLCodeGen.Objects.Article
      case "Blog": return GraphQLCodeGen.Objects.Blog
      case "Cart": return GraphQLCodeGen.Objects.Cart
      case "CartLine": return GraphQLCodeGen.Objects.CartLine
      case "Collection": return GraphQLCodeGen.Objects.Collection
      case "CollectionConnection": return GraphQLCodeGen.Objects.CollectionConnection
      case "Comment": return GraphQLCodeGen.Objects.Comment
      case "Company": return GraphQLCodeGen.Objects.Company
      case "CompanyContact": return GraphQLCodeGen.Objects.CompanyContact
      case "CompanyLocation": return GraphQLCodeGen.Objects.CompanyLocation
      case "ComponentizableCartLine": return GraphQLCodeGen.Objects.ComponentizableCartLine
      case "Count": return GraphQLCodeGen.Objects.Count
      case "Customer": return GraphQLCodeGen.Objects.Customer
      case "ExternalVideo": return GraphQLCodeGen.Objects.ExternalVideo
      case "GenericFile": return GraphQLCodeGen.Objects.GenericFile
      case "Image": return GraphQLCodeGen.Objects.Image
      case "ImageConnection": return GraphQLCodeGen.Objects.ImageConnection
      case "Location": return GraphQLCodeGen.Objects.Location
      case "MailingAddress": return GraphQLCodeGen.Objects.MailingAddress
      case "Market": return GraphQLCodeGen.Objects.Market
      case "MediaImage": return GraphQLCodeGen.Objects.MediaImage
      case "MediaPresentation": return GraphQLCodeGen.Objects.MediaPresentation
      case "Menu": return GraphQLCodeGen.Objects.Menu
      case "MenuItem": return GraphQLCodeGen.Objects.MenuItem
      case "Metafield": return GraphQLCodeGen.Objects.Metafield
      case "Metaobject": return GraphQLCodeGen.Objects.Metaobject
      case "Model3d": return GraphQLCodeGen.Objects.Model3d
      case "MoneyV2": return GraphQLCodeGen.Objects.MoneyV2
      case "Order": return GraphQLCodeGen.Objects.Order
      case "Page": return GraphQLCodeGen.Objects.Page
      case "Product": return GraphQLCodeGen.Objects.Product
      case "ProductConnection": return GraphQLCodeGen.Objects.ProductConnection
      case "ProductOption": return GraphQLCodeGen.Objects.ProductOption
      case "ProductOptionValue": return GraphQLCodeGen.Objects.ProductOptionValue
      case "ProductVariant": return GraphQLCodeGen.Objects.ProductVariant
      case "ProductVariantConnection": return GraphQLCodeGen.Objects.ProductVariantConnection
      case "QuantityRule": return GraphQLCodeGen.Objects.QuantityRule
      case "QueryRoot": return GraphQLCodeGen.Objects.QueryRoot
      case "SearchQuerySuggestion": return GraphQLCodeGen.Objects.SearchQuerySuggestion
      case "SellingPlan": return GraphQLCodeGen.Objects.SellingPlan
      case "Shop": return GraphQLCodeGen.Objects.Shop
      case "ShopPayInstallmentsFinancingPlan": return GraphQLCodeGen.Objects.ShopPayInstallmentsFinancingPlan
      case "ShopPayInstallmentsFinancingPlanTerm": return GraphQLCodeGen.Objects.ShopPayInstallmentsFinancingPlanTerm
      case "ShopPayInstallmentsProductVariantPricing": return GraphQLCodeGen.Objects.ShopPayInstallmentsProductVariantPricing
      case "ShopPolicy": return GraphQLCodeGen.Objects.ShopPolicy
      case "TaxonomyCategory": return GraphQLCodeGen.Objects.TaxonomyCategory
      case "UrlRedirect": return GraphQLCodeGen.Objects.UrlRedirect
      case "Video": return GraphQLCodeGen.Objects.Video
      default: return nil
      }
    }
  }

  enum Objects {}
  enum Interfaces {}
  enum Unions {}

}