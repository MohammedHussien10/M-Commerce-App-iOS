// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

extension GraphQLCodeGen {
  class CustomerCreateMutation: GraphQLMutation {
    static let operationName: String = "customerCreate"
    static let operationDocument: ApolloAPI.OperationDocument = .init(
      definition: .init(
        #"mutation customerCreate($input: CustomerCreateInput!) { customerCreate(input: $input) { __typename customer { __typename id email firstName lastName } customerUserErrors { __typename field message } } }"#
      ))

    public var input: CustomerCreateInput

    public init(input: CustomerCreateInput) {
      self.input = input
    }

    public var __variables: Variables? { ["input": input] }

    struct Data: GraphQLCodeGen.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: any ApolloAPI.ParentType { GraphQLCodeGen.Objects.Mutation }
      static var __selections: [ApolloAPI.Selection] { [
        .field("customerCreate", CustomerCreate?.self, arguments: ["input": .variable("input")]),
      ] }

      /// Creates a new customer.
      var customerCreate: CustomerCreate? { __data["customerCreate"] }

      /// CustomerCreate
      ///
      /// Parent Type: `CustomerCreatePayload`
      struct CustomerCreate: GraphQLCodeGen.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: any ApolloAPI.ParentType { GraphQLCodeGen.Objects.CustomerCreatePayload }
        static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("customer", Customer?.self),
          .field("customerUserErrors", [CustomerUserError].self),
        ] }

        /// The created customer object.
        var customer: Customer? { __data["customer"] }
        /// The list of errors that occurred from executing the mutation.
        var customerUserErrors: [CustomerUserError] { __data["customerUserErrors"] }

        /// CustomerCreate.Customer
        ///
        /// Parent Type: `Customer`
        struct Customer: GraphQLCodeGen.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: any ApolloAPI.ParentType { GraphQLCodeGen.Objects.Customer }
          static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("id", GraphQLCodeGen.ID.self),
            .field("email", String?.self),
            .field("firstName", String?.self),
            .field("lastName", String?.self),
          ] }

          /// A unique ID for the customer.
          var id: GraphQLCodeGen.ID { __data["id"] }
          /// The customer’s email address.
          var email: String? { __data["email"] }
          /// The customer’s first name.
          var firstName: String? { __data["firstName"] }
          /// The customer’s last name.
          var lastName: String? { __data["lastName"] }
        }

        /// CustomerCreate.CustomerUserError
        ///
        /// Parent Type: `CustomerUserError`
        struct CustomerUserError: GraphQLCodeGen.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: any ApolloAPI.ParentType { GraphQLCodeGen.Objects.CustomerUserError }
          static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("field", [String]?.self),
            .field("message", String.self),
          ] }

          /// The path to the input field that caused the error.
          var field: [String]? { __data["field"] }
          /// The error message.
          var message: String { __data["message"] }
        }
      }
    }
  }

}