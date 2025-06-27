// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

/// Specifies the input fields to update the buyer information associated with a cart.
/// Buyer identity is used to determine
/// [international pricing](https://shopify.dev/custom-storefronts/internationalization/international-pricing)
/// and should match the customer's shipping address.
public struct CartBuyerIdentityInput: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    email: GraphQLNullable<String> = nil,
    phone: GraphQLNullable<String> = nil,
    companyLocationId: GraphQLNullable<ID> = nil,
    countryCode: GraphQLNullable<GraphQLEnum<CountryCode>> = nil,
    customerAccessToken: GraphQLNullable<String> = nil,
    preferences: GraphQLNullable<CartPreferencesInput> = nil
  ) {
    __data = InputDict([
      "email": email,
      "phone": phone,
      "companyLocationId": companyLocationId,
      "countryCode": countryCode,
      "customerAccessToken": customerAccessToken,
      "preferences": preferences
    ])
  }

  @available(*, deprecated, message: "Argument 'deliveryAddressPreferences' is deprecated.")
  public init(
    email: GraphQLNullable<String> = nil,
    phone: GraphQLNullable<String> = nil,
    companyLocationId: GraphQLNullable<ID> = nil,
    countryCode: GraphQLNullable<GraphQLEnum<CountryCode>> = nil,
    customerAccessToken: GraphQLNullable<String> = nil,
    deliveryAddressPreferences: GraphQLNullable<[DeliveryAddressInput]> = nil,
    preferences: GraphQLNullable<CartPreferencesInput> = nil
  ) {
    __data = InputDict([
      "email": email,
      "phone": phone,
      "companyLocationId": companyLocationId,
      "countryCode": countryCode,
      "customerAccessToken": customerAccessToken,
      "deliveryAddressPreferences": deliveryAddressPreferences,
      "preferences": preferences
    ])
  }

  /// The email address of the buyer that is interacting with the cart.
  public var email: GraphQLNullable<String> {
    get { __data["email"] }
    set { __data["email"] = newValue }
  }

  /// The phone number of the buyer that is interacting with the cart.
  public var phone: GraphQLNullable<String> {
    get { __data["phone"] }
    set { __data["phone"] = newValue }
  }

  /// The company location of the buyer that is interacting with the cart.
  public var companyLocationId: GraphQLNullable<ID> {
    get { __data["companyLocationId"] }
    set { __data["companyLocationId"] = newValue }
  }

  /// The country where the buyer is located.
  public var countryCode: GraphQLNullable<GraphQLEnum<CountryCode>> {
    get { __data["countryCode"] }
    set { __data["countryCode"] = newValue }
  }

  /// The access token used to identify the customer associated with the cart.
  public var customerAccessToken: GraphQLNullable<String> {
    get { __data["customerAccessToken"] }
    set { __data["customerAccessToken"] = newValue }
  }

  /// An ordered set of delivery addresses tied to the buyer that is interacting with the cart.
  /// The rank of the preferences is determined by the order of the addresses in the array. Preferences
  /// can be used to populate relevant fields in the checkout flow.
  ///
  /// As of the `2025-01` release, `buyerIdentity.deliveryAddressPreferences` is deprecated.
  /// Delivery addresses are now part of the `CartDelivery` object and managed with three new mutations:
  /// - `cartDeliveryAddressAdd`
  /// - `cartDeliveryAddressUpdate`
  /// - `cartDeliveryAddressDelete`
  ///
  /// The input must not contain more than `250` values.
  @available(*, deprecated, message: "Use `cart.delivery` instead.")
  public var deliveryAddressPreferences: GraphQLNullable<[DeliveryAddressInput]> {
    get { __data["deliveryAddressPreferences"] }
    set { __data["deliveryAddressPreferences"] = newValue }
  }

  /// A set of preferences tied to the buyer interacting with the cart. Preferences are used to prefill fields in at checkout to streamline information collection.
  /// Preferences are not synced back to the cart if they are overwritten.
  public var preferences: GraphQLNullable<CartPreferencesInput> {
    get { __data["preferences"] }
    set { __data["preferences"] = newValue }
  }
}
