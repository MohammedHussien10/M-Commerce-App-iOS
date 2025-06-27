// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class DraftOrderDeleteMutation: GraphQLMutation {
  public static let operationName: String = "draftOrderDelete"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"mutation draftOrderDelete($input: DraftOrderDeleteInput!) { draftOrderDelete(input: $input) { __typename deletedId } }"#
    ))

  public var input: DraftOrderDeleteInput

  public init(input: DraftOrderDeleteInput) {
    self.input = input
  }

  public var __variables: Variables? { ["input": input] }

  public struct Data: AdminNameSpace.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { AdminNameSpace.Objects.Mutation }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("draftOrderDelete", DraftOrderDelete?.self, arguments: ["input": .variable("input")]),
    ] }

    /// Deletes a draft order.
    public var draftOrderDelete: DraftOrderDelete? { __data["draftOrderDelete"] }

    /// DraftOrderDelete
    ///
    /// Parent Type: `DraftOrderDeletePayload`
    public struct DraftOrderDelete: AdminNameSpace.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: any ApolloAPI.ParentType { AdminNameSpace.Objects.DraftOrderDeletePayload }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("deletedId", AdminNameSpace.ID?.self),
      ] }

      /// The ID of the deleted draft order.
      public var deletedId: AdminNameSpace.ID? { __data["deletedId"] }
    }
  }
}
