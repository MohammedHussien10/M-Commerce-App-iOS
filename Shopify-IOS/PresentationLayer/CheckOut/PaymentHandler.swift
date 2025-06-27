//
//  Untitled.swift
//  Shopify-IOS
//
//  Created by JETS Mobile Lab7 on 27/06/2025.
//

import Foundation
import PassKit
import UIKit


typealias PaymentCompletionHandler = (Bool,[String :Any]?) -> Void

class PaymentHandler : NSObject {
    var paymentController : PKPaymentAuthorizationController?
    var paymentStatus = PKPaymentAuthorizationStatus.failure
    var paymentDataJson : [String:Any]?
    var comletionHandler :PaymentCompletionHandler!
    
    func startPayment(items:[PKPaymentSummaryItem],completion: @escaping PaymentCompletionHandler){
        comletionHandler = completion
        
        let paymentRequest = PKPaymentRequest()
        paymentRequest.paymentSummaryItems = items
        paymentRequest.merchantIdentifier = "merchant.fake.applepay"
        paymentRequest.merchantCapabilities = .capability3DS
        paymentRequest.countryCode = "EG"
        paymentRequest.currencyCode = "EGP"
        paymentRequest.supportedNetworks = [.amex,.visa,.masterCard,.mada]
        
        paymentController = PKPaymentAuthorizationController(paymentRequest: paymentRequest)
        paymentController?.delegate = self
        paymentController?.present(completion: {(presented :Bool) in
            if presented{
                print("presented patment controller")
                
            }else{
                print("failed patment controller")
                self.comletionHandler(false,nil)
                
            }
        })
            
    }
    
    
 
}


extension PaymentHandler : PKPaymentAuthorizationControllerDelegate{
    func paymentAuthorizationController(
            _ controller: PKPaymentAuthorizationController,
            didAuthorizePayment payment: PKPayment,
            handler completion: @escaping (PKPaymentAuthorizationResult) -> Void
        ) {
            self.paymentStatus = PKPaymentAuthorizationStatus.success
            
            do {
                if let json = try JSONSerialization.jsonObject(
                    with: payment.token.paymentData,
                    options: []
                ) as? [String: Any] {
                    self.paymentDataJson = json
                    completion(
                        PKPaymentAuthorizationResult(
                            status: PKPaymentAuthorizationStatus.success,
                            errors: [Error]()
                        )
                    )
                }
            } catch let error as NSError {
                print("Failed to load: \(error.localizedDescription)")
                completion(
                    PKPaymentAuthorizationResult(
                        status: .success,
                        errors: [error]
                    )
                )
            }
        }
    
    
    func paymentAuthorizationControllerDidFinish(_ controller: PKPaymentAuthorizationController) {
        controller.dismiss {
            DispatchQueue.main.async {
                if self.paymentStatus == .success {
                    self.comletionHandler!(true, self.paymentDataJson)
                    print("Success")
                } else {
                    self.comletionHandler!(false, nil)
                    print("Nah")
                }
            }
        }
    }

    
    
}
