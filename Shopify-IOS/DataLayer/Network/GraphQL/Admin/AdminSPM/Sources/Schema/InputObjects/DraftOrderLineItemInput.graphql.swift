// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

/// The input fields for a line item included in a draft order.
public struct DraftOrderLineItemInput: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    appliedDiscount: GraphQLNullable<DraftOrderAppliedDiscountInput> = nil,
    customAttributes: GraphQLNullable<[AttributeInput]> = nil,
    originalUnitPriceWithCurrency: GraphQLNullable<MoneyInput> = nil,
    quantity: Int,
    requiresShipping: GraphQLNullable<Bool> = nil,
    sku: GraphQLNullable<String> = nil,
    taxable: GraphQLNullable<Bool> = nil,
    title: GraphQLNullable<String> = nil,
    variantId: GraphQLNullable<ID> = nil,
    weight: GraphQLNullable<WeightInput> = nil,
    uuid: GraphQLNullable<String> = nil,
    bundleComponents: GraphQLNullable<[BundlesDraftOrderBundleLineItemComponentInput]> = nil
  ) {
    __data = InputDict([
      "appliedDiscount": appliedDiscount,
      "customAttributes": customAttributes,
      "originalUnitPriceWithCurrency": originalUnitPriceWithCurrency,
      "quantity": quantity,
      "requiresShipping": requiresShipping,
      "sku": sku,
      "taxable": taxable,
      "title": title,
      "variantId": variantId,
      "weight": weight,
      "uuid": uuid,
      "bundleComponents": bundleComponents
    ])
  }

  /// The custom discount to be applied.
  public var appliedDiscount: GraphQLNullable<DraftOrderAppliedDiscountInput> {
    get { __data["appliedDiscount"] }
    set { __data["appliedDiscount"] = newValue }
  }

  /// A generic custom attribute using a key value pair.
  public var customAttributes: GraphQLNullable<[AttributeInput]> {
    get { __data["customAttributes"] }
    set { __data["customAttributes"] = newValue }
  }

  /// The price in presentment currency, without any discounts applied, for a custom line item.
  /// If this value is provided, `original_unit_price` will be ignored. This field is ignored when `variantId` is provided.
  /// Note: All presentment currencies for a single draft should be the same and match the
  /// presentment currency of the draft order.
  public var originalUnitPriceWithCurrency: GraphQLNullable<MoneyInput> {
    get { __data["originalUnitPriceWithCurrency"] }
    set { __data["originalUnitPriceWithCurrency"] = newValue }
  }

  /// The line item quantity.
  public var quantity: Int {
    get { __data["quantity"] }
    set { __data["quantity"] = newValue }
  }

  /// Whether physical shipping is required for a custom line item. This field is ignored when `variantId` is provided.
  public var requiresShipping: GraphQLNullable<Bool> {
    get { __data["requiresShipping"] }
    set { __data["requiresShipping"] = newValue }
  }

  /// The SKU number for custom line items only. This field is ignored when `variantId` is provided.
  public var sku: GraphQLNullable<String> {
    get { __data["sku"] }
    set { __data["sku"] = newValue }
  }

  /// Whether the custom line item is taxable. This field is ignored when `variantId` is provided.
  public var taxable: GraphQLNullable<Bool> {
    get { __data["taxable"] }
    set { __data["taxable"] = newValue }
  }

  /// Title of the line item. This field is ignored when `variantId` is provided.
  public var title: GraphQLNullable<String> {
    get { __data["title"] }
    set { __data["title"] = newValue }
  }

  /// The ID of the product variant corresponding to the line item.
  /// Must be null for custom line items, otherwise required.
  public var variantId: GraphQLNullable<ID> {
    get { __data["variantId"] }
    set { __data["variantId"] = newValue }
  }

  /// The weight unit and value inputs for custom line items only.
  /// This field is ignored when `variantId` is provided.
  public var weight: GraphQLNullable<WeightInput> {
    get { __data["weight"] }
    set { __data["weight"] = newValue }
  }

  /// The UUID of the draft order line item. Must be unique and consistent across requests.
  /// This field is mandatory in order to manipulate drafts with bundles.
  public var uuid: GraphQLNullable<String> {
    get { __data["uuid"] }
    set { __data["uuid"] = newValue }
  }

  /// The bundle components when the line item is a bundle.
  public var bundleComponents: GraphQLNullable<[BundlesDraftOrderBundleLineItemComponentInput]> {
    get { __data["bundleComponents"] }
    set { __data["bundleComponents"] = newValue }
  }
}
