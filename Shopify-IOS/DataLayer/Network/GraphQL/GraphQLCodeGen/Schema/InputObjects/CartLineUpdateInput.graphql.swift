// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

extension GraphQLCodeGen {
  /// The input fields to update a line item on a cart.
  struct CartLineUpdateInput: InputObject {
    private(set) var __data: InputDict

    init(_ data: InputDict) {
      __data = data
    }

    init(
      id: ID,
      quantity: GraphQLNullable<Int> = nil,
      merchandiseId: GraphQLNullable<ID> = nil,
      attributes: GraphQLNullable<[AttributeInput]> = nil,
      sellingPlanId: GraphQLNullable<ID> = nil
    ) {
      __data = InputDict([
        "id": id,
        "quantity": quantity,
        "merchandiseId": merchandiseId,
        "attributes": attributes,
        "sellingPlanId": sellingPlanId
      ])
    }

    /// The ID of the merchandise line.
    var id: ID {
      get { __data["id"] }
      set { __data["id"] = newValue }
    }

    /// The quantity of the line item.
    var quantity: GraphQLNullable<Int> {
      get { __data["quantity"] }
      set { __data["quantity"] = newValue }
    }

    /// The ID of the merchandise for the line item.
    var merchandiseId: GraphQLNullable<ID> {
      get { __data["merchandiseId"] }
      set { __data["merchandiseId"] = newValue }
    }

    /// An array of key-value pairs that contains additional information about the merchandise line.
    ///
    /// The input must not contain more than `250` values.
    var attributes: GraphQLNullable<[AttributeInput]> {
      get { __data["attributes"] }
      set { __data["attributes"] = newValue }
    }

    /// The ID of the selling plan that the merchandise is being purchased with.
    var sellingPlanId: GraphQLNullable<ID> {
      get { __data["sellingPlanId"] }
      set { __data["sellingPlanId"] = newValue }
    }
  }

}