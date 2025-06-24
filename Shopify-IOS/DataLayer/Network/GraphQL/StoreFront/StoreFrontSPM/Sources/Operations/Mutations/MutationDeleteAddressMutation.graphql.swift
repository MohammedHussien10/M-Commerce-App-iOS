// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class MutationDeleteAddressMutation: GraphQLMutation {
  public static let operationName: String = "MutationDeleteAddress"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"mutation MutationDeleteAddress($customerAddressDeleteId: ID!, $customerAccessToken: String!) { customerAddressDelete( id: $customerAddressDeleteId customerAccessToken: $customerAccessToken ) { __typename deletedCustomerAddressId } }"#
    ))

  public var customerAddressDeleteId: ID
  public var customerAccessToken: String

  public init(
    customerAddressDeleteId: ID,
    customerAccessToken: String
  ) {
    self.customerAddressDeleteId = customerAddressDeleteId
    self.customerAccessToken = customerAccessToken
  }

  public var __variables: Variables? { [
    "customerAddressDeleteId": customerAddressDeleteId,
    "customerAccessToken": customerAccessToken
  ] }

  public struct Data: StoreFrontNameSpace.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { StoreFrontNameSpace.Objects.Mutation }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("customerAddressDelete", CustomerAddressDelete?.self, arguments: [
        "id": .variable("customerAddressDeleteId"),
        "customerAccessToken": .variable("customerAccessToken")
      ]),
    ] }

    /// Permanently deletes the address of an existing customer.
    public var customerAddressDelete: CustomerAddressDelete? { __data["customerAddressDelete"] }

    /// CustomerAddressDelete
    ///
    /// Parent Type: `CustomerAddressDeletePayload`
    public struct CustomerAddressDelete: StoreFrontNameSpace.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: any ApolloAPI.ParentType { StoreFrontNameSpace.Objects.CustomerAddressDeletePayload }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("deletedCustomerAddressId", String?.self),
      ] }

      /// ID of the deleted customer address.
      public var deletedCustomerAddressId: String? { __data["deletedCustomerAddressId"] }
    }
  }
}
