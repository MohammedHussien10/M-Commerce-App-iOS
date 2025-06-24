// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public protocol SelectionSet: ApolloAPI.SelectionSet & ApolloAPI.RootSelectionSet
where Schema == StoreFrontNameSpace.SchemaMetadata {}

public protocol InlineFragment: ApolloAPI.SelectionSet & ApolloAPI.InlineFragment
where Schema == StoreFrontNameSpace.SchemaMetadata {}

public protocol MutableSelectionSet: ApolloAPI.MutableRootSelectionSet
where Schema == StoreFrontNameSpace.SchemaMetadata {}

public protocol MutableInlineFragment: ApolloAPI.MutableSelectionSet & ApolloAPI.InlineFragment
where Schema == StoreFrontNameSpace.SchemaMetadata {}

public enum SchemaMetadata: ApolloAPI.SchemaMetadata {
  public static let configuration: any ApolloAPI.SchemaConfiguration.Type = SchemaConfiguration.self

  public static func objectType(forTypename typename: String) -> ApolloAPI.Object? {
    switch typename {
    case "AppliedGiftCard": return StoreFrontNameSpace.Objects.AppliedGiftCard
    case "Article": return StoreFrontNameSpace.Objects.Article
    case "BaseCartLineConnection": return StoreFrontNameSpace.Objects.BaseCartLineConnection
    case "BaseCartLineEdge": return StoreFrontNameSpace.Objects.BaseCartLineEdge
    case "Blog": return StoreFrontNameSpace.Objects.Blog
    case "Cart": return StoreFrontNameSpace.Objects.Cart
    case "CartCreatePayload": return StoreFrontNameSpace.Objects.CartCreatePayload
    case "CartLine": return StoreFrontNameSpace.Objects.CartLine
    case "CartLinesAddPayload": return StoreFrontNameSpace.Objects.CartLinesAddPayload
    case "CartLinesRemovePayload": return StoreFrontNameSpace.Objects.CartLinesRemovePayload
    case "CartLinesUpdatePayload": return StoreFrontNameSpace.Objects.CartLinesUpdatePayload
    case "CartUserError": return StoreFrontNameSpace.Objects.CartUserError
    case "Collection": return StoreFrontNameSpace.Objects.Collection
    case "CollectionConnection": return StoreFrontNameSpace.Objects.CollectionConnection
    case "Comment": return StoreFrontNameSpace.Objects.Comment
    case "Company": return StoreFrontNameSpace.Objects.Company
    case "CompanyContact": return StoreFrontNameSpace.Objects.CompanyContact
    case "CompanyLocation": return StoreFrontNameSpace.Objects.CompanyLocation
    case "ComponentizableCartLine": return StoreFrontNameSpace.Objects.ComponentizableCartLine
    case "Count": return StoreFrontNameSpace.Objects.Count
    case "Customer": return StoreFrontNameSpace.Objects.Customer
    case "CustomerAccessToken": return StoreFrontNameSpace.Objects.CustomerAccessToken
    case "CustomerAccessTokenCreatePayload": return StoreFrontNameSpace.Objects.CustomerAccessTokenCreatePayload
    case "CustomerAddressCreatePayload": return StoreFrontNameSpace.Objects.CustomerAddressCreatePayload
    case "CustomerAddressDeletePayload": return StoreFrontNameSpace.Objects.CustomerAddressDeletePayload
    case "CustomerCreatePayload": return StoreFrontNameSpace.Objects.CustomerCreatePayload
    case "CustomerUserError": return StoreFrontNameSpace.Objects.CustomerUserError
    case "ExternalVideo": return StoreFrontNameSpace.Objects.ExternalVideo
    case "GenericFile": return StoreFrontNameSpace.Objects.GenericFile
    case "Image": return StoreFrontNameSpace.Objects.Image
    case "ImageConnection": return StoreFrontNameSpace.Objects.ImageConnection
    case "Location": return StoreFrontNameSpace.Objects.Location
    case "MailingAddress": return StoreFrontNameSpace.Objects.MailingAddress
    case "MailingAddressConnection": return StoreFrontNameSpace.Objects.MailingAddressConnection
    case "Market": return StoreFrontNameSpace.Objects.Market
    case "MediaImage": return StoreFrontNameSpace.Objects.MediaImage
    case "MediaPresentation": return StoreFrontNameSpace.Objects.MediaPresentation
    case "Menu": return StoreFrontNameSpace.Objects.Menu
    case "MenuItem": return StoreFrontNameSpace.Objects.MenuItem
    case "Metafield": return StoreFrontNameSpace.Objects.Metafield
    case "MetafieldDeleteUserError": return StoreFrontNameSpace.Objects.MetafieldDeleteUserError
    case "MetafieldsSetUserError": return StoreFrontNameSpace.Objects.MetafieldsSetUserError
    case "Metaobject": return StoreFrontNameSpace.Objects.Metaobject
    case "Model3d": return StoreFrontNameSpace.Objects.Model3d
    case "MoneyV2": return StoreFrontNameSpace.Objects.MoneyV2
    case "Mutation": return StoreFrontNameSpace.Objects.Mutation
    case "Order": return StoreFrontNameSpace.Objects.Order
    case "Page": return StoreFrontNameSpace.Objects.Page
    case "Product": return StoreFrontNameSpace.Objects.Product
    case "ProductConnection": return StoreFrontNameSpace.Objects.ProductConnection
    case "ProductOption": return StoreFrontNameSpace.Objects.ProductOption
    case "ProductOptionValue": return StoreFrontNameSpace.Objects.ProductOptionValue
    case "ProductVariant": return StoreFrontNameSpace.Objects.ProductVariant
    case "ProductVariantConnection": return StoreFrontNameSpace.Objects.ProductVariantConnection
    case "QuantityRule": return StoreFrontNameSpace.Objects.QuantityRule
    case "QueryRoot": return StoreFrontNameSpace.Objects.QueryRoot
    case "SearchQuerySuggestion": return StoreFrontNameSpace.Objects.SearchQuerySuggestion
    case "SelectedOption": return StoreFrontNameSpace.Objects.SelectedOption
    case "SellingPlan": return StoreFrontNameSpace.Objects.SellingPlan
    case "Shop": return StoreFrontNameSpace.Objects.Shop
    case "ShopPayInstallmentsFinancingPlan": return StoreFrontNameSpace.Objects.ShopPayInstallmentsFinancingPlan
    case "ShopPayInstallmentsFinancingPlanTerm": return StoreFrontNameSpace.Objects.ShopPayInstallmentsFinancingPlanTerm
    case "ShopPayInstallmentsProductVariantPricing": return StoreFrontNameSpace.Objects.ShopPayInstallmentsProductVariantPricing
    case "ShopPolicy": return StoreFrontNameSpace.Objects.ShopPolicy
    case "TaxonomyCategory": return StoreFrontNameSpace.Objects.TaxonomyCategory
    case "UrlRedirect": return StoreFrontNameSpace.Objects.UrlRedirect
    case "UserError": return StoreFrontNameSpace.Objects.UserError
    case "UserErrorsShopPayPaymentRequestSessionUserErrors": return StoreFrontNameSpace.Objects.UserErrorsShopPayPaymentRequestSessionUserErrors
    case "Video": return StoreFrontNameSpace.Objects.Video
    default: return nil
    }
  }
}

public enum Objects {}
public enum Interfaces {}
public enum Unions {}
