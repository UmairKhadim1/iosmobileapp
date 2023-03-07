//
//  AppDelegate.swift
//  Heartzy
//
//  Created by waseeem on 11/7/22.
//

import UIKit
import Firebase
import IQKeyboardManagerSwift
import SwiftyStoreKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        FirebaseApp.configure()
        IQKeyboardManager.shared.enable = true
        
        var theCount = Int(AppUserDefault.shared.isAppOpenCount ?? "")
        var theAddition = (theCount ?? 0) + 1
        AppUserDefault.shared.isAppOpenCount = "\(theAddition)"

             SwiftyStoreKit.completeTransactions(atomically: true) { purchases in
                       
                       for purchase in purchases {
                           switch purchase.transaction.transactionState {
                           case .purchased, .restored:
                               let downloads = purchase.transaction.downloads
                               if !downloads.isEmpty {
                                   SwiftyStoreKit.start(downloads)
                               } else if purchase.needsFinishTransaction {
                                   // Deliver content from server, then:
                                   SwiftyStoreKit.finishTransaction(purchase.transaction)
                               }
                               print("\(purchase.transaction.transactionState.debugDescription): \(purchase.productId)")
                           case .failed, .purchasing, .deferred:
                               break // do nothing
                           @unknown default:
                               break // do nothing
                           }
                       }
                   }

        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
      
    }

}
