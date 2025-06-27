//
//  CheckoutViewModel.swift
//  Shopify-IOS
//
//  Created by Noha Ali Gomaa on 23/06/2025.

import AdminNameSpace
import Apollo
import Foundation
import StoreFrontNameSpace
import SwiftUICore

@MainActor
final class CheckoutViewModel: ObservableObject {
    // MARK: - Published Properties
    @Published var draftOrder: DraftOrderCreateMutation.Data.DraftOrderCreate.DraftOrder?
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    @Published var checkoutURL: Foundation.URL?
    @Published var cartId: String?
    @Published var addresses: [AddressModel] = []
    @Published var selectedAddress: AddressModel?
    @Published var subtotalPrice: String = "0.00".formatAsCurrency()
    @Published var totalPrice: String = "0.00".formatAsCurrency()
    var  customerId = UserDefaults.standard.string(
        forKey: "CurrentCustomerID"
    )
    var cartProducts: [CartProduct]
    
    var draftOrderLineItems: [DraftOrderLineItemInput] {
        return cartProducts.compactMap { product in
            DraftOrderLineItemInput(
                quantity: product.quantity,
                variantId: GraphQLNullable<ID>(stringLiteral: product.Variantid)
            )
        }
    }
    
    init(cartProducts: [CartProduct], cartId: String?) {
          self.cartProducts = cartProducts
          self.cartId = cartId
      }
    
    @MainActor
    func createDraftOrder() async {
        errorMessage = nil

        var draftOrderInput = DraftOrderInput(
            lineItems: GraphQLNullable.some(draftOrderLineItems)
        )

        if let email = UserDefaults.standard.string(forKey: "CurrentCustomerEmail") {
            draftOrderInput.email = GraphQLNullable.some(email)
        }

        let createDraftOrderMutation = AdminNameSpace.DraftOrderCreateMutation(
            input: draftOrderInput
        )

        await withCheckedContinuation { continuation in
            NetworkManager.sharedAdmin.performGraphQLRequest(mutation: createDraftOrderMutation) { [weak self] result in
                guard let self = self else {
                    continuation.resume()
                    return
                }
                
                switch result {
                case .success(let response):
                    self.draftOrder = response.draftOrderCreate?.draftOrder
                    setPrices()
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                }

                continuation.resume()
            }
        }
    }
    
    func deleteDraftOrder(onComplete: @escaping () -> Void) async {
        guard let draftOrderId = draftOrder?.id else {
            onComplete()
            return
        }
        
        let draftOrderDeleteInput = DraftOrderDeleteInput(id: draftOrderId)
        let draftOrderDeleteMutation = DraftOrderDeleteMutation(input: draftOrderDeleteInput)
        await MainActor.run {
            self.isLoading = true
        }

        
        NetworkManager.sharedAdmin.performGraphQLRequest(mutation: draftOrderDeleteMutation) {[weak self] result in
            guard let self else { return }
            
            DispatchQueue.main.async {
                self.isLoading = false
            }
            onComplete()
        }
    }
    
    func updateDraftOrder(discountCode: String?, address: AdminNameSpace.MailingAddressInput?, completion: @escaping (Bool) -> Void) async {
        guard let draftOrderID = draftOrder?.id else {
            completion(false)
            return
        }
        
        var draftOrderInput = DraftOrderInput(lineItems: GraphQLNullable.some(draftOrderLineItems))
        
        if let discountCode {
            let discountObj = DiscountsManager.shared.getDiscountObjectWithCode(discountCode)
            let value = DiscountsManager.shared.getDiscountValueFromDiscount(discountObj)
            let valueType = DiscountsManager.shared.valueType(discountObj)
            var discountObjInput = DraftOrderAppliedDiscountInput(
                value: value,
                valueType: GraphQLEnum.case(valueType)
            )
            
            if let amountWithCurrency = DiscountsManager.shared.getValueWithCurrency(discountObj) {
                discountObjInput.amountWithCurrency = GraphQLNullable.some(amountWithCurrency)
            }
            
            draftOrderInput.appliedDiscount = GraphQLNullable.some(discountObjInput)
        } else {
            draftOrderInput.appliedDiscount = GraphQLNullable.null
        }
        
        if let email = UserDefaults.standard.string(forKey: "CustomerEmail") {
            draftOrderInput.email = GraphQLNullable.some(email)
        }
        
        if let address {
            draftOrderInput.shippingAddress = GraphQLNullable.some(address)
            draftOrderInput.billingAddress = GraphQLNullable.some(address)
        }
        
        await MainActor.run {
            self.isLoading = true
        }

        let draftOrderDeleteMutation = DraftOrderUpdateMutation(id: draftOrderID, input: draftOrderInput)
        NetworkManager.sharedAdmin.performGraphQLRequest(mutation: draftOrderDeleteMutation) {[weak self] result in
            guard let self else { return }

            DispatchQueue.main.async {
                self.isLoading = false
            }
            switch result {
            case .success(let data):
                if let dataDic = data.draftOrderUpdate?.draftOrder?.__data {
                    let subtotalPrice = draftOrder?.subtotalPrice
                    draftOrder = DraftOrderCreateMutation.Data.DraftOrderCreate.DraftOrder(_dataDict: dataDic)
                    setPrices()
                    let isApplied = draftOrder?.subtotalPrice != subtotalPrice
                    completion(isApplied)
                } else {
                    completion(false)
                }
            case .failure(let error):
                errorMessage = error.localizedDescription
                completion(false)
            }
        }
    }
    
    func completeDraftOrder(onComplete: @escaping (Bool) -> Void) async {
        guard let draftOrderId = draftOrder?.id else {
            onComplete(false)
            return
        }
        
        let completeDraftOrderMutation = DraftOrderCompleteMutation(id: draftOrderId)
        await MainActor.run {
            self.isLoading = true
        }

        
        NetworkManager.sharedAdmin.performGraphQLRequest(mutation: completeDraftOrderMutation) {[weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
            }
            switch result {
            case .success(_):
                onComplete(true)
            case .failure(_):
                onComplete(false)
            }
        }
    }
    
    
    func fetchCart(checkoutCartId: String) async {
        self.isLoading = true
        let query = GetCartQuery(cartId: checkoutCartId)

        NetworkManager.sharedStoreFront.queryGraphQLRequest(query: query) { result in
            DispatchQueue.main.async {
                self.isLoading = false
                switch result {
                case .success(let response):
                    if let urlString = response.cart?.checkoutUrl,
                       let url = Foundation.URL(string: urlString) {
                        self.checkoutURL = url
                    }
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                }
            }
        }
    }
    
    private func setPrices() {
        self.subtotalPrice = draftOrder?.subtotalPrice.formatAsCurrency() ?? "0.00".formatAsCurrency()
        self.totalPrice = draftOrder?.totalPrice.formatAsCurrency() ?? "0.00".formatAsCurrency()
    }
    
    @MainActor
    func getAddresses(accessToken: String) async {
        let query = GetAddressesQuery(accessToken: accessToken)

        await withCheckedContinuation { continuation in
            NetworkManager.sharedStoreFront.queryGraphQLRequest(query: query) { [weak self] result in
                guard let self = self else {
                    continuation.resume()
                    return
                }
                switch result {
                case .success(let data):
                    if let customer = data.customer {
                        let defaultId = customer.defaultAddress?.id
                        self.addresses = customer.addresses.toDomain(defaultId: defaultId)
                    } else {
                        self.addresses = []
                    }
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                }

                continuation.resume()
            }
        }
    }
    
}
