//
//  StoreKitManager.swift
//  QuizApp
//
//  Created by Asad Khan on 9/25/21.
//  Copyright © 2021 apple. All rights reserved.
//
import SwiftyStoreKit
import UIKit

class PaymentManager: NSObject {
    
    static let shared = PaymentManager()
    var isVerifyError = true
    var iS_TEST = false
    
    func verifyPurchase(productId:String,completion: ((Bool) -> Void)? = nil) {
        var appleValidator = AppleReceiptValidator(service: .production, sharedSecret: "34b3f328287f4a60aa8b58e273303783")
        if iS_TEST {
            appleValidator = AppleReceiptValidator(service: .sandbox, sharedSecret: "34b3f328287f4a60aa8b58e273303783")
        }
        SwiftyStoreKit.verifyReceipt(using: appleValidator) { [weak self] result in
            switch result {
            case .success(let receipt):
                self?.isVerifyError = false
                
                let PRODUCT_IDS = [productId]
                let productIds = Set.init(PRODUCT_IDS)
                let status = SwiftyStoreKit.verifySubscriptions(productIds: productIds, inReceipt: receipt)
                
                switch status {
                case .purchased(_, _):
                    completion?(true)
                case .expired(_, _):
                    completion?(false)
                case .notPurchased:
                    completion?(false)
                }
                
            case .error(let error):
                switch error {
                case .noReceiptData, .noRemoteData:
                    completion?(false)
                    self?.isVerifyError = true
                case .requestBodyEncodeError(_), .networkError( _):
                    completion?(false)
                    self?.isVerifyError = true
                case .jsonDecodeError(_):
                    completion?(false)
                    self?.isVerifyError = true
                case .receiptInvalid(_, let status):
                    completion?(false)
                    self?.isVerifyError = true
                    switch status {
                    case .unknown:
                        completion?(false)
                        self?.isVerifyError = true
                    case .none:
                        completion?(false)
                        self?.isVerifyError = true
                    case .valid:
                        completion?(false)
                        self?.isVerifyError = true
                    case .jsonNotReadable:
                        completion?(false)
                        self?.isVerifyError = true
                    case .malformedOrMissingData:
                        completion?(false)
                        self?.isVerifyError = true
                    case .receiptCouldNotBeAuthenticated:
                        completion?(false)
                        self?.isVerifyError = true
                    case .secretNotMatching:
                        self?.iS_TEST = true
                        self?.verifyPurchase(productId: productId, completion: completion)
                        return
                    case .receiptServerUnavailable:
                        completion?(false)
                        self?.isVerifyError = true
                    case .subscriptionExpired:
                        completion?(false)
                        self?.isVerifyError = true
                    case .testReceipt:
                        self?.iS_TEST = true
                        self?.verifyPurchase(productId: productId, completion: completion)
                        return
                    case .productionEnvironment:
                        self?.iS_TEST = false
                        self?.verifyPurchase(productId: productId, completion: completion)
                        return
                    }
                    
                }
            }
        }
    }
}
