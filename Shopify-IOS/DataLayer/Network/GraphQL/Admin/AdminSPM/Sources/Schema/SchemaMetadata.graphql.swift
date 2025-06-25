// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public protocol SelectionSet: ApolloAPI.SelectionSet & ApolloAPI.RootSelectionSet
where Schema == AdminNameSpace.SchemaMetadata {}

public protocol InlineFragment: ApolloAPI.SelectionSet & ApolloAPI.InlineFragment
where Schema == AdminNameSpace.SchemaMetadata {}

public protocol MutableSelectionSet: ApolloAPI.MutableRootSelectionSet
where Schema == AdminNameSpace.SchemaMetadata {}

public protocol MutableInlineFragment: ApolloAPI.MutableSelectionSet & ApolloAPI.InlineFragment
where Schema == AdminNameSpace.SchemaMetadata {}

public enum SchemaMetadata: ApolloAPI.SchemaMetadata {
  public static let configuration: any ApolloAPI.SchemaConfiguration.Type = SchemaConfiguration.self

  public static func objectType(forTypename typename: String) -> ApolloAPI.Object? {
    switch typename {
    case "AbandonedCheckout": return AdminNameSpace.Objects.AbandonedCheckout
    case "AbandonedCheckoutLineItem": return AdminNameSpace.Objects.AbandonedCheckoutLineItem
    case "Abandonment": return AdminNameSpace.Objects.Abandonment
    case "AddAllProductsOperation": return AdminNameSpace.Objects.AddAllProductsOperation
    case "AdditionalFee": return AdminNameSpace.Objects.AdditionalFee
    case "AllDiscountItems": return AdminNameSpace.Objects.AllDiscountItems
    case "App": return AdminNameSpace.Objects.App
    case "AppCatalog": return AdminNameSpace.Objects.AppCatalog
    case "AppCredit": return AdminNameSpace.Objects.AppCredit
    case "AppInstallation": return AdminNameSpace.Objects.AppInstallation
    case "AppPurchaseOneTime": return AdminNameSpace.Objects.AppPurchaseOneTime
    case "AppRevenueAttributionRecord": return AdminNameSpace.Objects.AppRevenueAttributionRecord
    case "AppSubscription": return AdminNameSpace.Objects.AppSubscription
    case "AppUsageRecord": return AdminNameSpace.Objects.AppUsageRecord
    case "Article": return AdminNameSpace.Objects.Article
    case "BasicEvent": return AdminNameSpace.Objects.BasicEvent
    case "Blog": return AdminNameSpace.Objects.Blog
    case "BulkOperation": return AdminNameSpace.Objects.BulkOperation
    case "BusinessEntity": return AdminNameSpace.Objects.BusinessEntity
    case "CalculatedOrder": return AdminNameSpace.Objects.CalculatedOrder
    case "CartTransform": return AdminNameSpace.Objects.CartTransform
    case "CashTrackingAdjustment": return AdminNameSpace.Objects.CashTrackingAdjustment
    case "CashTrackingSession": return AdminNameSpace.Objects.CashTrackingSession
    case "CatalogCsvOperation": return AdminNameSpace.Objects.CatalogCsvOperation
    case "Channel": return AdminNameSpace.Objects.Channel
    case "ChannelDefinition": return AdminNameSpace.Objects.ChannelDefinition
    case "ChannelInformation": return AdminNameSpace.Objects.ChannelInformation
    case "CheckoutProfile": return AdminNameSpace.Objects.CheckoutProfile
    case "Collection": return AdminNameSpace.Objects.Collection
    case "Comment": return AdminNameSpace.Objects.Comment
    case "CommentEvent": return AdminNameSpace.Objects.CommentEvent
    case "Company": return AdminNameSpace.Objects.Company
    case "CompanyAddress": return AdminNameSpace.Objects.CompanyAddress
    case "CompanyContact": return AdminNameSpace.Objects.CompanyContact
    case "CompanyContactRole": return AdminNameSpace.Objects.CompanyContactRole
    case "CompanyContactRoleAssignment": return AdminNameSpace.Objects.CompanyContactRoleAssignment
    case "CompanyLocation": return AdminNameSpace.Objects.CompanyLocation
    case "CompanyLocationCatalog": return AdminNameSpace.Objects.CompanyLocationCatalog
    case "CompanyLocationStaffMemberAssignment": return AdminNameSpace.Objects.CompanyLocationStaffMemberAssignment
    case "Customer": return AdminNameSpace.Objects.Customer
    case "CustomerAccountAppExtensionPage": return AdminNameSpace.Objects.CustomerAccountAppExtensionPage
    case "CustomerAccountNativePage": return AdminNameSpace.Objects.CustomerAccountNativePage
    case "CustomerPaymentMethod": return AdminNameSpace.Objects.CustomerPaymentMethod
    case "CustomerSegmentMember": return AdminNameSpace.Objects.CustomerSegmentMember
    case "CustomerSegmentMembersQuery": return AdminNameSpace.Objects.CustomerSegmentMembersQuery
    case "CustomerVisit": return AdminNameSpace.Objects.CustomerVisit
    case "DeliveryCarrierService": return AdminNameSpace.Objects.DeliveryCarrierService
    case "DeliveryCondition": return AdminNameSpace.Objects.DeliveryCondition
    case "DeliveryCountry": return AdminNameSpace.Objects.DeliveryCountry
    case "DeliveryCustomization": return AdminNameSpace.Objects.DeliveryCustomization
    case "DeliveryLocationGroup": return AdminNameSpace.Objects.DeliveryLocationGroup
    case "DeliveryMethod": return AdminNameSpace.Objects.DeliveryMethod
    case "DeliveryMethodDefinition": return AdminNameSpace.Objects.DeliveryMethodDefinition
    case "DeliveryParticipant": return AdminNameSpace.Objects.DeliveryParticipant
    case "DeliveryProfile": return AdminNameSpace.Objects.DeliveryProfile
    case "DeliveryProfileItem": return AdminNameSpace.Objects.DeliveryProfileItem
    case "DeliveryPromiseProvider": return AdminNameSpace.Objects.DeliveryPromiseProvider
    case "DeliveryProvince": return AdminNameSpace.Objects.DeliveryProvince
    case "DeliveryRateDefinition": return AdminNameSpace.Objects.DeliveryRateDefinition
    case "DeliveryZone": return AdminNameSpace.Objects.DeliveryZone
    case "DiscountAmount": return AdminNameSpace.Objects.DiscountAmount
    case "DiscountAutomaticBxgy": return AdminNameSpace.Objects.DiscountAutomaticBxgy
    case "DiscountAutomaticNode": return AdminNameSpace.Objects.DiscountAutomaticNode
    case "DiscountCodeApp": return AdminNameSpace.Objects.DiscountCodeApp
    case "DiscountCodeBasic": return AdminNameSpace.Objects.DiscountCodeBasic
    case "DiscountCodeBxgy": return AdminNameSpace.Objects.DiscountCodeBxgy
    case "DiscountCodeFreeShipping": return AdminNameSpace.Objects.DiscountCodeFreeShipping
    case "DiscountCodeNode": return AdminNameSpace.Objects.DiscountCodeNode
    case "DiscountCodeNodeConnection": return AdminNameSpace.Objects.DiscountCodeNodeConnection
    case "DiscountCollections": return AdminNameSpace.Objects.DiscountCollections
    case "DiscountCustomerGets": return AdminNameSpace.Objects.DiscountCustomerGets
    case "DiscountNode": return AdminNameSpace.Objects.DiscountNode
    case "DiscountOnQuantity": return AdminNameSpace.Objects.DiscountOnQuantity
    case "DiscountPercentage": return AdminNameSpace.Objects.DiscountPercentage
    case "DiscountProducts": return AdminNameSpace.Objects.DiscountProducts
    case "DiscountRedeemCode": return AdminNameSpace.Objects.DiscountRedeemCode
    case "DiscountRedeemCodeBulkCreation": return AdminNameSpace.Objects.DiscountRedeemCodeBulkCreation
    case "DiscountRedeemCodeConnection": return AdminNameSpace.Objects.DiscountRedeemCodeConnection
    case "Domain": return AdminNameSpace.Objects.Domain
    case "DraftOrder": return AdminNameSpace.Objects.DraftOrder
    case "DraftOrderCompletePayload": return AdminNameSpace.Objects.DraftOrderCompletePayload
    case "DraftOrderConnection": return AdminNameSpace.Objects.DraftOrderConnection
    case "DraftOrderCreatePayload": return AdminNameSpace.Objects.DraftOrderCreatePayload
    case "DraftOrderDeletePayload": return AdminNameSpace.Objects.DraftOrderDeletePayload
    case "DraftOrderLineItem": return AdminNameSpace.Objects.DraftOrderLineItem
    case "DraftOrderLineItemConnection": return AdminNameSpace.Objects.DraftOrderLineItemConnection
    case "DraftOrderTag": return AdminNameSpace.Objects.DraftOrderTag
    case "DraftOrderUpdatePayload": return AdminNameSpace.Objects.DraftOrderUpdatePayload
    case "Duty": return AdminNameSpace.Objects.Duty
    case "ExchangeLineItem": return AdminNameSpace.Objects.ExchangeLineItem
    case "ExchangeV2": return AdminNameSpace.Objects.ExchangeV2
    case "ExternalVideo": return AdminNameSpace.Objects.ExternalVideo
    case "Fulfillment": return AdminNameSpace.Objects.Fulfillment
    case "FulfillmentConstraintRule": return AdminNameSpace.Objects.FulfillmentConstraintRule
    case "FulfillmentEvent": return AdminNameSpace.Objects.FulfillmentEvent
    case "FulfillmentHold": return AdminNameSpace.Objects.FulfillmentHold
    case "FulfillmentLineItem": return AdminNameSpace.Objects.FulfillmentLineItem
    case "FulfillmentOrder": return AdminNameSpace.Objects.FulfillmentOrder
    case "FulfillmentOrderDestination": return AdminNameSpace.Objects.FulfillmentOrderDestination
    case "FulfillmentOrderLineItem": return AdminNameSpace.Objects.FulfillmentOrderLineItem
    case "FulfillmentOrderMerchantRequest": return AdminNameSpace.Objects.FulfillmentOrderMerchantRequest
    case "GenericFile": return AdminNameSpace.Objects.GenericFile
    case "GiftCard": return AdminNameSpace.Objects.GiftCard
    case "GiftCardCreditTransaction": return AdminNameSpace.Objects.GiftCardCreditTransaction
    case "GiftCardDebitTransaction": return AdminNameSpace.Objects.GiftCardDebitTransaction
    case "Image": return AdminNameSpace.Objects.Image
    case "InventoryAdjustmentGroup": return AdminNameSpace.Objects.InventoryAdjustmentGroup
    case "InventoryItem": return AdminNameSpace.Objects.InventoryItem
    case "InventoryItemMeasurement": return AdminNameSpace.Objects.InventoryItemMeasurement
    case "InventoryLevel": return AdminNameSpace.Objects.InventoryLevel
    case "InventoryQuantity": return AdminNameSpace.Objects.InventoryQuantity
    case "LineItem": return AdminNameSpace.Objects.LineItem
    case "LineItemGroup": return AdminNameSpace.Objects.LineItemGroup
    case "Link": return AdminNameSpace.Objects.Link
    case "Location": return AdminNameSpace.Objects.Location
    case "MailingAddress": return AdminNameSpace.Objects.MailingAddress
    case "Market": return AdminNameSpace.Objects.Market
    case "MarketCatalog": return AdminNameSpace.Objects.MarketCatalog
    case "MarketRegionCountry": return AdminNameSpace.Objects.MarketRegionCountry
    case "MarketWebPresence": return AdminNameSpace.Objects.MarketWebPresence
    case "MarketingActivity": return AdminNameSpace.Objects.MarketingActivity
    case "MarketingEvent": return AdminNameSpace.Objects.MarketingEvent
    case "MediaImage": return AdminNameSpace.Objects.MediaImage
    case "Menu": return AdminNameSpace.Objects.Menu
    case "Metafield": return AdminNameSpace.Objects.Metafield
    case "MetafieldDefinition": return AdminNameSpace.Objects.MetafieldDefinition
    case "MetafieldStorefrontVisibility": return AdminNameSpace.Objects.MetafieldStorefrontVisibility
    case "Metaobject": return AdminNameSpace.Objects.Metaobject
    case "MetaobjectDefinition": return AdminNameSpace.Objects.MetaobjectDefinition
    case "Model3d": return AdminNameSpace.Objects.Model3d
    case "MoneyBag": return AdminNameSpace.Objects.MoneyBag
    case "MoneyV2": return AdminNameSpace.Objects.MoneyV2
    case "Mutation": return AdminNameSpace.Objects.Mutation
    case "OnlineStoreTheme": return AdminNameSpace.Objects.OnlineStoreTheme
    case "Order": return AdminNameSpace.Objects.Order
    case "OrderAdjustment": return AdminNameSpace.Objects.OrderAdjustment
    case "OrderConnection": return AdminNameSpace.Objects.OrderConnection
    case "OrderDisputeSummary": return AdminNameSpace.Objects.OrderDisputeSummary
    case "OrderEdge": return AdminNameSpace.Objects.OrderEdge
    case "OrderTransaction": return AdminNameSpace.Objects.OrderTransaction
    case "Page": return AdminNameSpace.Objects.Page
    case "PaymentCustomization": return AdminNameSpace.Objects.PaymentCustomization
    case "PaymentMandate": return AdminNameSpace.Objects.PaymentMandate
    case "PaymentSchedule": return AdminNameSpace.Objects.PaymentSchedule
    case "PaymentTerms": return AdminNameSpace.Objects.PaymentTerms
    case "PaymentTermsTemplate": return AdminNameSpace.Objects.PaymentTermsTemplate
    case "PriceList": return AdminNameSpace.Objects.PriceList
    case "PriceRule": return AdminNameSpace.Objects.PriceRule
    case "PriceRuleDiscountCode": return AdminNameSpace.Objects.PriceRuleDiscountCode
    case "PrivateMetafield": return AdminNameSpace.Objects.PrivateMetafield
    case "Product": return AdminNameSpace.Objects.Product
    case "ProductBundleOperation": return AdminNameSpace.Objects.ProductBundleOperation
    case "ProductDeleteOperation": return AdminNameSpace.Objects.ProductDeleteOperation
    case "ProductDuplicateOperation": return AdminNameSpace.Objects.ProductDuplicateOperation
    case "ProductFeed": return AdminNameSpace.Objects.ProductFeed
    case "ProductOption": return AdminNameSpace.Objects.ProductOption
    case "ProductOptionValue": return AdminNameSpace.Objects.ProductOptionValue
    case "ProductPriceRangeV2": return AdminNameSpace.Objects.ProductPriceRangeV2
    case "ProductSetOperation": return AdminNameSpace.Objects.ProductSetOperation
    case "ProductTaxonomyNode": return AdminNameSpace.Objects.ProductTaxonomyNode
    case "ProductVariant": return AdminNameSpace.Objects.ProductVariant
    case "ProductVariantComponent": return AdminNameSpace.Objects.ProductVariantComponent
    case "Publication": return AdminNameSpace.Objects.Publication
    case "PublicationResourceOperation": return AdminNameSpace.Objects.PublicationResourceOperation
    case "QuantityPriceBreak": return AdminNameSpace.Objects.QuantityPriceBreak
    case "QueryRoot": return AdminNameSpace.Objects.QueryRoot
    case "Refund": return AdminNameSpace.Objects.Refund
    case "RefundShippingLine": return AdminNameSpace.Objects.RefundShippingLine
    case "Return": return AdminNameSpace.Objects.Return
    case "ReturnLineItem": return AdminNameSpace.Objects.ReturnLineItem
    case "ReturnableFulfillment": return AdminNameSpace.Objects.ReturnableFulfillment
    case "ReverseDelivery": return AdminNameSpace.Objects.ReverseDelivery
    case "ReverseDeliveryLineItem": return AdminNameSpace.Objects.ReverseDeliveryLineItem
    case "ReverseFulfillmentOrder": return AdminNameSpace.Objects.ReverseFulfillmentOrder
    case "ReverseFulfillmentOrderDisposition": return AdminNameSpace.Objects.ReverseFulfillmentOrderDisposition
    case "ReverseFulfillmentOrderLineItem": return AdminNameSpace.Objects.ReverseFulfillmentOrderLineItem
    case "SaleAdditionalFee": return AdminNameSpace.Objects.SaleAdditionalFee
    case "SavedSearch": return AdminNameSpace.Objects.SavedSearch
    case "ScriptTag": return AdminNameSpace.Objects.ScriptTag
    case "Segment": return AdminNameSpace.Objects.Segment
    case "SellingPlan": return AdminNameSpace.Objects.SellingPlan
    case "SellingPlanGroup": return AdminNameSpace.Objects.SellingPlanGroup
    case "ServerPixel": return AdminNameSpace.Objects.ServerPixel
    case "Shop": return AdminNameSpace.Objects.Shop
    case "ShopAddress": return AdminNameSpace.Objects.ShopAddress
    case "ShopPolicy": return AdminNameSpace.Objects.ShopPolicy
    case "ShopifyPaymentsAccount": return AdminNameSpace.Objects.ShopifyPaymentsAccount
    case "ShopifyPaymentsBalanceTransaction": return AdminNameSpace.Objects.ShopifyPaymentsBalanceTransaction
    case "ShopifyPaymentsBankAccount": return AdminNameSpace.Objects.ShopifyPaymentsBankAccount
    case "ShopifyPaymentsDispute": return AdminNameSpace.Objects.ShopifyPaymentsDispute
    case "ShopifyPaymentsDisputeEvidence": return AdminNameSpace.Objects.ShopifyPaymentsDisputeEvidence
    case "ShopifyPaymentsDisputeFileUpload": return AdminNameSpace.Objects.ShopifyPaymentsDisputeFileUpload
    case "ShopifyPaymentsDisputeFulfillment": return AdminNameSpace.Objects.ShopifyPaymentsDisputeFulfillment
    case "ShopifyPaymentsPayout": return AdminNameSpace.Objects.ShopifyPaymentsPayout
    case "ShopifyPaymentsVerification": return AdminNameSpace.Objects.ShopifyPaymentsVerification
    case "StaffMember": return AdminNameSpace.Objects.StaffMember
    case "StandardMetafieldDefinitionTemplate": return AdminNameSpace.Objects.StandardMetafieldDefinitionTemplate
    case "StoreCreditAccount": return AdminNameSpace.Objects.StoreCreditAccount
    case "StoreCreditAccountCreditTransaction": return AdminNameSpace.Objects.StoreCreditAccountCreditTransaction
    case "StoreCreditAccountDebitRevertTransaction": return AdminNameSpace.Objects.StoreCreditAccountDebitRevertTransaction
    case "StoreCreditAccountDebitTransaction": return AdminNameSpace.Objects.StoreCreditAccountDebitTransaction
    case "StoreCreditAccountExpirationTransaction": return AdminNameSpace.Objects.StoreCreditAccountExpirationTransaction
    case "StorefrontAccessToken": return AdminNameSpace.Objects.StorefrontAccessToken
    case "SubscriptionBillingAttempt": return AdminNameSpace.Objects.SubscriptionBillingAttempt
    case "SubscriptionBillingCycleEditedContract": return AdminNameSpace.Objects.SubscriptionBillingCycleEditedContract
    case "SubscriptionContract": return AdminNameSpace.Objects.SubscriptionContract
    case "SubscriptionDraft": return AdminNameSpace.Objects.SubscriptionDraft
    case "TaxonomyAttribute": return AdminNameSpace.Objects.TaxonomyAttribute
    case "TaxonomyCategory": return AdminNameSpace.Objects.TaxonomyCategory
    case "TaxonomyChoiceListAttribute": return AdminNameSpace.Objects.TaxonomyChoiceListAttribute
    case "TaxonomyMeasurementAttribute": return AdminNameSpace.Objects.TaxonomyMeasurementAttribute
    case "TaxonomyValue": return AdminNameSpace.Objects.TaxonomyValue
    case "TenderTransaction": return AdminNameSpace.Objects.TenderTransaction
    case "TransactionFee": return AdminNameSpace.Objects.TransactionFee
    case "UnverifiedReturnLineItem": return AdminNameSpace.Objects.UnverifiedReturnLineItem
    case "UrlRedirect": return AdminNameSpace.Objects.UrlRedirect
    case "UrlRedirectImport": return AdminNameSpace.Objects.UrlRedirectImport
    case "Validation": return AdminNameSpace.Objects.Validation
    case "Video": return AdminNameSpace.Objects.Video
    case "WebPixel": return AdminNameSpace.Objects.WebPixel
    case "WebhookSubscription": return AdminNameSpace.Objects.WebhookSubscription
    default: return nil
    }
  }
}

public enum Objects {}
public enum Interfaces {}
public enum Unions {}
