// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

/// The order's aggregated return status that's used for display purposes.
/// An order might have multiple returns, so this field communicates the prioritized return status.
/// The `OrderReturnStatus` enum is a supported filter parameter in the [`orders` query](https://shopify.dev/api/admin-graphql/latest/queries/orders#:~:text=reference_location_id-,return_status,-risk_level).
public enum OrderReturnStatus: String, EnumType {
  /// Some items in the order are being returned.
  case inProgress = "IN_PROGRESS"
  /// All return shipments from a return in this order were inspected.
  case inspectionComplete = "INSPECTION_COMPLETE"
  /// No items in the order were returned.
  case noReturn = "NO_RETURN"
  /// Some items in the order were returned.
  case returned = "RETURNED"
  /// Some returns in the order were not completed successfully.
  case returnFailed = "RETURN_FAILED"
  /// A return was requested for some items in the order.
  case returnRequested = "RETURN_REQUESTED"
}
