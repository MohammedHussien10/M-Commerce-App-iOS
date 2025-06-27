//
//  DiscountManagers.swift
//  Shopify-IOS
//
//  Created by Noha Ali Gomaa on 24/06/2025.
//

import AdminNameSpace
import Foundation

class DiscountsManager {
    static let shared = DiscountsManager()
    var discounts: GetAllDiscountCodesQuery.Data.CodeDiscountNodes?
    
    func getDiscountObjectWithCode(_ code: String?) -> GetAllDiscountCodesQuery.Data.CodeDiscountNodes.Node? {
        guard let code = code else { return nil }
        
        return discounts?.nodes.filter {
            $0.codeDiscount.asDiscountCodeBasic?.codes.nodes.first?.code == code
        }.first
    }
    
    func getDiscountValueFromDiscount(_ discount: GetAllDiscountCodesQuery.Data.CodeDiscountNodes.Node?) -> Double {
        guard let discount else { return 0.00 }
        
        let isFixed = discount.codeDiscount.asDiscountCodeBasic?.customerGets.value.__typename == "DiscountAmount"
        let customerGets = discount.codeDiscount.asDiscountCodeBasic?.customerGets.value
        let fixedAmountAsDouble = NSString(string: customerGets?.asDiscountAmount?.amount.amount ?? "").doubleValue
        let percentageAmount = customerGets?.asDiscountPercentage?.percentage ?? 0.00
        
        return isFixed ? fixedAmountAsDouble : percentageAmount
    }
    
    func getValueWithCurrency(_ discount: GetAllDiscountCodesQuery.Data.CodeDiscountNodes.Node?) -> MoneyInput? {
        guard let discount else { return nil }
        
        let customerGets = discount.codeDiscount.asDiscountCodeBasic?.customerGets.value
        guard let fixedAmount = customerGets?.asDiscountAmount?.amount.amount,
              let currencyCode =  customerGets?.asDiscountAmount?.amount.currencyCode else {
            return nil
        }
     
        return MoneyInput(amount: fixedAmount, currencyCode: currencyCode)
    }
    
    func valueType(_ discount: GetAllDiscountCodesQuery.Data.CodeDiscountNodes.Node?) -> DraftOrderAppliedDiscountType {
        guard let discount else { return .percentage }
        
        let isFixed = discount.codeDiscount.asDiscountCodeBasic?.customerGets.value.__typename == "DiscountAmount"
        
        return isFixed ? .fixedAmount : .percentage
    }
}


