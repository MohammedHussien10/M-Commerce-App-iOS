//
//  CheckoutViewModel.swift
//  Shopify-IOS
//
//  Created by Noha Ali Gomaa on 23/06/2025.


import Foundation
import AdminNameSpace
import Apollo
import SwiftUICore

@MainActor
final class CheckoutViewModel: ObservableObject {
    // MARK: - Published Properties
    @Published var draftOrder: DraftOrderCreateMutation.Data.DraftOrderCreate.DraftOrder?
    @Published var isLoading: Bool = true
    @Published var errorMessage: String?
    
    var  customerId = UserDefaults.standard.string(
        forKey: "CurrentCustomerID"
    )
    var cartProducts: [CartProduct]
    var subtotalPrice: String {
        return draftOrder?.subtotalPrice.formatAsCurrency() ?? "0.00".formatAsCurrency()
    }
    var totalPrice: String {
        return draftOrder?.totalPrice.formatAsCurrency() ?? "0.00".formatAsCurrency()
    }
    var draftOrderLineItems: [DraftOrderLineItemInput] {
        return cartProducts.compactMap { product in
            DraftOrderLineItemInput(
                quantity: product.quantity,
                variantId: GraphQLNullable<ID>(stringLiteral: product.Variantid)
            )
        }
    }
    
    init(cartProducts: [CartProduct]) {
        self.cartProducts = cartProducts
    }
    
    func createDraftOrder() async {
        var draftOrderInput = DraftOrderInput(
            lineItems: GraphQLNullable.some(draftOrderLineItems)
        )
        
        if let email = UserDefaults.standard.string(forKey: "CustomerEmail") {
            draftOrderInput.email = GraphQLNullable.some(email)
        }
        
        let createDraftOrderMutation = AdminNameSpace.DraftOrderCreateMutation(
            input: draftOrderInput
        )
        
        NetworkManager.sharedAdmin.performGraphQLRequest(
            mutation: createDraftOrderMutation
        ) {[weak self] result in
            guard let self else { return }
            DispatchQueue.main.async {
                self.isLoading = false
            }
            switch result {
            case .success(let response):
                draftOrder = response.draftOrderCreate?.draftOrder
            case .failure(let error):
                errorMessage = error.localizedDescription
            }
        }
    }
    
    func deleteDraftOrder(onComplete: @escaping () -> Void) async {
        guard let draftOrderId = draftOrder?.id else { return }
        
        let draftOrderDeleteInput = DraftOrderDeleteInput(id: draftOrderId)
        let draftOrderDeleteMutation = DraftOrderDeleteMutation(input: draftOrderDeleteInput)
        DispatchQueue.main.async {
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
    
    func updateDraftOrder(discountCode: String?, address: MailingAddressInput?, completion: @escaping (Bool) -> Void) async {
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
        
        DispatchQueue.main.async {
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
        guard let draftOrderId = draftOrder?.id else { return }
        
        let completeDraftOrderMutation = DraftOrderCompleteMutation(id: draftOrderId)
        DispatchQueue.main.async {
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
    
}
