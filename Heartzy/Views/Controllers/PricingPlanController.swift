//
//  PricingPlanController.swift
//  Heartzy
//
//  Created by waseeem on 1/16/23.
//

import UIKit
import SwiftyStoreKit
import StoreKit

class PricingPlanController: UIViewController, SKPaymentTransactionObserver {
   
    lazy var backgroundimg: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "getStartedbg")
        iv.backgroundColor = UIColor.clear
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    lazy var headerlbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor(named: Colors.Primary_Color)
        lbl.textAlignment = .center
        lbl.font = regular(size: 40)
        lbl.text = "Pricing Plans"
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var desclbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.lightGray
        lbl.textAlignment = .center
        lbl.font = regular(size: 16)
        lbl.text = "Pick a plan that fits your needs"
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var privacyPolicyBtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor.clear
        btn.setTitle("Privacy Policy", for: .normal)
        btn.titleLabel?.font = UIFont.appFont(ofSize: 15, weight: .regular)
        btn.setTitleColor(UIColor(named: Colors.Primary_Color), for: .normal)
        btn.layer.shadowColor = UIColor.clear.cgColor
        btn.addTarget(self, action: #selector(privacyPolicyBtn_Press), for: .touchUpInside)
        return btn
    }()
    
    lazy var andCenterlbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.lightGray
        lbl.textAlignment = .center
        lbl.font = regular(size: 16)
        lbl.text = "and"
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var termandConditionBtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor.clear
        btn.setTitle("Term & Condition", for: .normal)
        btn.titleLabel?.font = UIFont.appFont(ofSize: 15, weight: .regular)
        btn.setTitleColor(UIColor(named: Colors.Primary_Color), for: .normal)
        btn.layer.shadowColor = UIColor.clear.cgColor
        btn.addTarget(self, action: #selector(termandConditionBtn_Press), for: .touchUpInside)
        return btn
    }()
    
    
    lazy var freePlanView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.25
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        view.layer.shadowRadius = 5 * appConstant.heightRatio
        view.clipsToBounds = false
        view.layer.borderColor = UIColor(named: Colors.Primary_Color)?.cgColor
        view.layer.borderWidth = 1 * appConstant.heightRatio
        view.layer.cornerRadius = 8 * appConstant.heightRatio
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var freePlanTitlelbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor(named: Colors.Primary_Color)
        lbl.textAlignment = .left
        lbl.font = regular(size: 32)
        lbl.text = "Free"
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var freePlandesclbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.lightGray
        lbl.textAlignment = .left
        lbl.font = UIFont.appFont(ofSize: 16, weight: .regular)
        lbl.text = "This plan will let you to use this application for 7 sessions per month."
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    
    lazy var freePlanLineView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: Colors.Primary_Color)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var freePlanLineBtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor.clear
        btn.setTitle("Start 7-session free trial", for: .normal)
        btn.titleLabel?.font = UIFont.appFont(ofSize: 12, weight: .regular)
        btn.setTitleColor(UIColor(named: Colors.Primary_Color), for: .normal)
        btn.titleLabel?.adjustsFontSizeToFitWidth = true
        btn.layer.shadowColor = UIColor.clear.cgColor
        btn.addTarget(self, action: #selector(freeplanbtn_press), for: .touchUpInside)
        return btn
    }()
    
    
    lazy var freePlanBtn : UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor.clear
        btn.addTarget(self, action: #selector(freeplanbtn_press), for: .touchUpInside)
        return btn
    }()
    
    lazy var lifeTimePaidPlanView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.25
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        view.layer.shadowRadius = 5 * appConstant.heightRatio
        view.clipsToBounds = false
        view.layer.borderColor = UIColor(named: Colors.Primary_Color)?.cgColor
        view.layer.borderWidth = 1 * appConstant.heightRatio
        view.layer.cornerRadius = 8 * appConstant.heightRatio
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var lifeTimePlanTitlelbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor(named: Colors.Primary_Color)
        lbl.textAlignment = .left
        lbl.font = regular(size: 32)
        lbl.text = "Lifetime"
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var lifeTimePlanTitledesclbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor(named: Colors.Primary_Color)
        lbl.textAlignment = .left
        lbl.font = regular(size: 32)
        lbl.text = "$1.99"
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var lifeTimePlanTitledescDarklbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.lightGray
        lbl.textAlignment = .left
        lbl.font = UIFont.appFont(ofSize: 22, weight: .bold)
        lbl.text = " one time"
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var lifeTimePlandesclbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.lightGray
        lbl.textAlignment = .left
        lbl.font = UIFont.appFont(ofSize: 16, weight: .regular)
        lbl.text = "This plan will let you to use this application for unlimited time."
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var payNowBtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Pay Now", for: .normal)
        btn.layer.shadowRadius = 0
        btn.backgroundColor = UIColor(named: Colors.Primary_Color)
//        btn.addTarget(self, action: #selector(nextBtn_press), for: .touchUpInside)
        return btn
    }()
    
    
    lazy var paidPlanBtn : UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor.clear
        btn.addTarget(self, action: #selector(paidplanbtn_press), for: .touchUpInside)
        return btn
    }()
    
    
    lazy var restorePurchasesBtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor.clear
        btn.setTitle("Restore Purchases", for: .normal)
        btn.titleLabel?.font = UIFont.appFont(ofSize: 16, weight: .semibold)
        btn.titleLabel?.adjustsFontSizeToFitWidth = true
        btn.setTitleColor(UIColor(named: Colors.Primary_Color), for: .normal)
        btn.layer.shadowColor = UIColor.clear.cgColor
        btn.addTarget(self, action: #selector(restoreBtn_Press), for: .touchUpInside)
        return btn
    }()
    
    
    lazy var restorePurchasesLineView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: Colors.Primary_Color)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var termandUsageBtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor.clear
        btn.setTitle("Terms to Use", for: .normal)
        btn.titleLabel?.adjustsFontSizeToFitWidth = true
        btn.titleLabel?.font = UIFont.appFont(ofSize: 18, weight: .semibold)
        btn.setTitleColor(UIColor(named: Colors.Primary_Color), for: .normal)
        btn.layer.shadowColor = UIColor.clear.cgColor
        btn.addTarget(self, action: #selector(termandUsageBtn_Press), for: .touchUpInside)
        return btn
    }()
    
    
    lazy var termandUsageLineView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: Colors.Primary_Color)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var subscriptionProducts = [SubcriptionModel]()
    
    var productIds = [String]()

    var products: [SKProduct]?

    override func viewDidLoad() {
        super.viewDidLoad()

        productIds.removeAll()
        
        productIds.append("com.price.HeartsyOneTimePay")
        
        SKPaymentQueue.default().add(self)
        
        subscriptionProducts = [.init(productId: "com.price.HeartsyOneTimePay", productTitle: "HeartsyOneTimePay", productPrice: "1.99$")]

        PKIAPHandler.shared.setProductIds(ids: productIds)
        PKIAPHandler.shared.fetchAvailableProducts { [weak self](products)   in
           guard let sSelf = self else {return}
            print(products)
        }
        
        
        view.backgroundColor = .white
        setUPUI()
        
        self.view.bringSubviewToFront(freePlanLineBtn)
    }
    
    
    func setUPUI()
    {
        let margin = view.layoutMarginsGuide
        view.addSubview(backgroundimg)
        backgroundimg.addSubview(headerlbl)
        backgroundimg.addSubview(desclbl)
        view.addSubview(privacyPolicyBtn)
        backgroundimg.addSubview(andCenterlbl)
        view.addSubview(termandConditionBtn)
        backgroundimg.addSubview(freePlanView)
        freePlanView.addSubview(freePlanTitlelbl)
        freePlanView.addSubview(freePlandesclbl)
        freePlanView.addSubview(freePlanLineBtn)
        freePlanView.addSubview(freePlanLineView)
        view.addSubview(freePlanBtn)
        backgroundimg.addSubview(lifeTimePaidPlanView)
        lifeTimePaidPlanView.addSubview(lifeTimePlanTitlelbl)
        lifeTimePaidPlanView.addSubview(lifeTimePlanTitledesclbl)
        lifeTimePaidPlanView.addSubview(lifeTimePlanTitledescDarklbl)
        lifeTimePaidPlanView.addSubview(lifeTimePlandesclbl)
        lifeTimePaidPlanView.addSubview(payNowBtn)
        view.addSubview(paidPlanBtn)
        view.addSubview(restorePurchasesBtn)
        view.addSubview(restorePurchasesLineView)
        view.addSubview(termandUsageBtn)
        view.addSubview(termandUsageLineView)

        
        NSLayoutConstraint.activate([
        
            backgroundimg.topAnchor.constraint(equalTo: view.topAnchor, constant: 0 * appConstant.heightRatio),
            backgroundimg.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0 * appConstant.widthRatio),
            backgroundimg.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0 * appConstant.widthRatio),
            backgroundimg.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0 * appConstant.heightRatio),
            
            headerlbl.topAnchor.constraint(equalTo: view.topAnchor,constant: 76 * appConstant.heightRatio),
            headerlbl.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20 * appConstant.widthRatio),
            headerlbl.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20 * appConstant.widthRatio),
            
            desclbl.topAnchor.constraint(equalTo: headerlbl.bottomAnchor,constant: 16 * appConstant.heightRatio),
            desclbl.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20 * appConstant.widthRatio),
            desclbl.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20 * appConstant.widthRatio),
            
            privacyPolicyBtn.centerYAnchor.constraint(equalTo: andCenterlbl.centerYAnchor, constant: 0 * appConstant.heightRatio),
            privacyPolicyBtn.trailingAnchor.constraint(equalTo: andCenterlbl.leadingAnchor, constant: -8 * appConstant.widthRatio),
            privacyPolicyBtn.heightAnchor.constraint(equalToConstant: 24 * appConstant.heightRatio),
            
            
            andCenterlbl.centerXAnchor.constraint(equalTo: desclbl.centerXAnchor, constant: 0 * appConstant.heightRatio),
//            andCenterlbl.centerYAnchor.constraint(equalTo: backgroundimg.centerYAnchor, constant: 0 * appConstant.heightRatio),
            andCenterlbl.topAnchor.constraint(equalTo: desclbl.bottomAnchor, constant: 8 * appConstant.heightRatio),
            andCenterlbl.heightAnchor.constraint(equalToConstant: 24 * appConstant.heightRatio),


            termandConditionBtn.centerYAnchor.constraint(equalTo: andCenterlbl.centerYAnchor, constant: 0 * appConstant.heightRatio),
            termandConditionBtn.leadingAnchor.constraint(equalTo: andCenterlbl.trailingAnchor, constant: 8 * appConstant.widthRatio),
            termandConditionBtn.heightAnchor.constraint(equalToConstant: 24 * appConstant.heightRatio),
            
            freePlanView.topAnchor.constraint(equalTo: desclbl.bottomAnchor,constant: 42 * appConstant.heightRatio),
            freePlanView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20 * appConstant.widthRatio),
            freePlanView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20 * appConstant.widthRatio),
            freePlanView.heightAnchor.constraint(equalToConstant: 156 * appConstant.heightRatio),
            
            freePlanTitlelbl.topAnchor.constraint(equalTo: freePlanView.topAnchor,constant: 16 * appConstant.heightRatio),
            freePlanTitlelbl.leadingAnchor.constraint(equalTo: freePlanView.leadingAnchor,constant: 16 * appConstant.widthRatio),
            
            freePlandesclbl.topAnchor.constraint(equalTo: freePlanTitlelbl.bottomAnchor,constant: 12 * appConstant.heightRatio),
            freePlandesclbl.leadingAnchor.constraint(equalTo: freePlanView.leadingAnchor,constant: 16 * appConstant.widthRatio),
            freePlandesclbl.trailingAnchor.constraint(equalTo: freePlanView.trailingAnchor,constant: -20 * appConstant.widthRatio),
            
            
            freePlanLineBtn.bottomAnchor.constraint(equalTo: freePlanLineView.topAnchor, constant: 4 * appConstant.heightRatio),
            freePlanLineBtn.trailingAnchor.constraint(equalTo: freePlanView.trailingAnchor,constant: -16 * appConstant.widthRatio),
            freePlanLineBtn.widthAnchor.constraint(equalToConstant: 132 * appConstant.heightRatio),
            freePlanLineBtn.heightAnchor.constraint(equalToConstant: 24 * appConstant.heightRatio),
            
            
            freePlanLineView.bottomAnchor.constraint(equalTo: freePlanView.bottomAnchor, constant: -16 * appConstant.heightRatio),
            freePlanLineView.trailingAnchor.constraint(equalTo: freePlanView.trailingAnchor,constant: -16 * appConstant.widthRatio),
            freePlanLineView.widthAnchor.constraint(equalToConstant: 132 * appConstant.heightRatio),
            freePlanLineView.heightAnchor.constraint(equalToConstant: 1 * appConstant.heightRatio),
            
            
            freePlanBtn.topAnchor.constraint(equalTo: freePlanView.topAnchor, constant: 0 * appConstant.heightRatio),
            freePlanBtn.leadingAnchor.constraint(equalTo: freePlanView.leadingAnchor, constant: 0 * appConstant.widthRatio),
            freePlanBtn.trailingAnchor.constraint(equalTo: freePlanView.trailingAnchor, constant: -0 * appConstant.widthRatio),
            freePlanBtn.bottomAnchor.constraint(equalTo: freePlanView.bottomAnchor, constant: -0 * appConstant.heightRatio),
            

            lifeTimePaidPlanView.topAnchor.constraint(equalTo: freePlanView.bottomAnchor,constant: 16 * appConstant.heightRatio),
            lifeTimePaidPlanView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20 * appConstant.widthRatio),
            lifeTimePaidPlanView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20 * appConstant.widthRatio),
            lifeTimePaidPlanView.heightAnchor.constraint(equalToConstant: 245 * appConstant.heightRatio),
            
            lifeTimePlanTitlelbl.topAnchor.constraint(equalTo: lifeTimePaidPlanView.topAnchor,constant: 16 * appConstant.heightRatio),
            lifeTimePlanTitlelbl.leadingAnchor.constraint(equalTo: lifeTimePaidPlanView.leadingAnchor,constant: 16 * appConstant.widthRatio),
            
            lifeTimePlanTitledesclbl.topAnchor.constraint(equalTo: lifeTimePlanTitlelbl.bottomAnchor,constant: 16 * appConstant.heightRatio),
            lifeTimePlanTitledesclbl.leadingAnchor.constraint(equalTo: lifeTimePaidPlanView.leadingAnchor,constant: 16 * appConstant.widthRatio),
            
            lifeTimePlanTitledescDarklbl.centerYAnchor.constraint(equalTo: lifeTimePlanTitledesclbl.centerYAnchor, constant: 3 * appConstant.heightRatio),
            lifeTimePlanTitledescDarklbl.leadingAnchor.constraint(equalTo: lifeTimePlanTitledesclbl.trailingAnchor,constant: 2 * appConstant.widthRatio),
            
            lifeTimePlandesclbl.topAnchor.constraint(equalTo: lifeTimePlanTitledesclbl.bottomAnchor,constant: 12 * appConstant.heightRatio),
            lifeTimePlandesclbl.leadingAnchor.constraint(equalTo: lifeTimePaidPlanView.leadingAnchor,constant: 16 * appConstant.widthRatio),
            lifeTimePlandesclbl.trailingAnchor.constraint(equalTo: lifeTimePaidPlanView.trailingAnchor,constant: -20 * appConstant.widthRatio),
            
            
            payNowBtn.bottomAnchor.constraint(equalTo: lifeTimePaidPlanView.bottomAnchor, constant: -16 * appConstant.heightRatio),
            payNowBtn.trailingAnchor.constraint(equalTo: lifeTimePaidPlanView.trailingAnchor,constant: -16 * appConstant.widthRatio),
            payNowBtn.widthAnchor.constraint(equalToConstant: 150 * appConstant.heightRatio),
            payNowBtn.heightAnchor.constraint(equalToConstant: 50 * appConstant.heightRatio),
            
            
            paidPlanBtn.topAnchor.constraint(equalTo: lifeTimePaidPlanView.topAnchor, constant: 0 * appConstant.heightRatio),
            paidPlanBtn.leadingAnchor.constraint(equalTo: lifeTimePaidPlanView.leadingAnchor, constant: 0 * appConstant.widthRatio),
            paidPlanBtn.trailingAnchor.constraint(equalTo: lifeTimePaidPlanView.trailingAnchor, constant: -0 * appConstant.widthRatio),
            paidPlanBtn.bottomAnchor.constraint(equalTo: lifeTimePaidPlanView.bottomAnchor, constant: -0 * appConstant.heightRatio),
            
            
            
            restorePurchasesBtn.centerXAnchor.constraint(equalTo: lifeTimePaidPlanView.centerXAnchor, constant: 0 * appConstant.heightRatio),
//            restorePurchasesBtn.centerYAnchor.constraint(equalTo: lifeTimePaidPlanView.centerYAnchor, constant: 0 * appConstant.heightRatio),
            restorePurchasesBtn.topAnchor.constraint(equalTo: lifeTimePaidPlanView.bottomAnchor, constant: 24 * appConstant.heightRatio),
            restorePurchasesBtn.heightAnchor.constraint(equalToConstant: 24 * appConstant.heightRatio),
            restorePurchasesBtn.widthAnchor.constraint(equalToConstant: 160 * appConstant.heightRatio),
            
            
            restorePurchasesLineView.topAnchor.constraint(equalTo: restorePurchasesBtn.bottomAnchor, constant: 0 * appConstant.heightRatio),
            restorePurchasesLineView.centerXAnchor.constraint(equalTo: restorePurchasesBtn.centerXAnchor, constant: 0 * appConstant.heightRatio),
            restorePurchasesLineView.widthAnchor.constraint(equalToConstant: 150 * appConstant.heightRatio),
            restorePurchasesLineView.heightAnchor.constraint(equalToConstant: 1 * appConstant.heightRatio),
            
            
            termandUsageBtn.centerXAnchor.constraint(equalTo: restorePurchasesLineView.centerXAnchor, constant: 0 * appConstant.heightRatio),
//            termandUsageBtn.centerYAnchor.constraint(equalTo: backgroundimg.centerYAnchor, constant: 0 * appConstant.heightRatio),
            termandUsageBtn.topAnchor.constraint(equalTo: restorePurchasesLineView.bottomAnchor, constant: 24 * appConstant.heightRatio),
            termandUsageBtn.heightAnchor.constraint(equalToConstant: 24 * appConstant.heightRatio),
            
            
            termandUsageLineView.topAnchor.constraint(equalTo: termandUsageBtn.bottomAnchor, constant: 0 * appConstant.heightRatio),
            termandUsageLineView.leadingAnchor.constraint(equalTo: termandUsageBtn.leadingAnchor),
            termandUsageLineView.trailingAnchor.constraint(equalTo: termandUsageBtn.trailingAnchor),
            termandUsageLineView.heightAnchor.constraint(equalToConstant: 1 * appConstant.heightRatio),
            
        ])
        
    }
    
    
    @objc func freeplanbtn_press()
    {
        let vc = PermissionTutorialController()
        let rootNC = UINavigationController(rootViewController: vc)
        rootNC.navigationBar.isHidden = true
        UIApplication.shared.windows.first?.rootViewController = rootNC
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
    
    
    @objc func paidplanbtn_press()
    {
        
        subscriptionProducts = [.init(productId: "com.price.HeartsyOneTimePay", productTitle: "HeartsyOneTimePay", productPrice: "1.99$")]
        
        purchaseProduct(subscriptproduct: subscriptionProducts.first!)
                
        
//        let product = SKProduct(identifier: "com.price.HeartsyOneTimePay", price: "1.99$", priceLocale: Locale(identifier: "en_US"))
//
//
//        PKIAPHandler.shared.purchase(product: product) { (alert, product, transaction) in
//           if let tran = transaction, let prod = product {
//             //use transaction details and purchased product as you want
//           }
//            alertWithMsg(vc: self, msg: alert.message, title: "Alert")
//
//           }

        
        
    }
    
    @objc func termandConditionBtn_Press()
    {
        
        let url: URL = URL(string: "https://heartsy.app/terms-conditions/")!
                UIApplication.shared.open(url)
            
    }
    
    @objc func privacyPolicyBtn_Press()
    {
        
        let url: URL = URL(string: "https://heartsy.app/privacy-policy")!
        UIApplication.shared.open(url)
        
    }
    
    @objc func restoreBtn_Press()
    {
        
        if (SKPaymentQueue.canMakePayments()) {
          SKPaymentQueue.default().restoreCompletedTransactions()
        }
        
    }
    
    @objc func termandUsageBtn_Press()
    {
        
        let url: URL = URL(string: "https://heartsy.app/terms-to-use/")!
                UIApplication.shared.open(url)
        
    }
    
    
    func paymentQueue(_ pQueue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {

      print("Received Payment Transaction Response from Apple");
      for transaction in transactions {
        switch transaction.transactionState {
        case .purchased, .restored:
          print("Purchased purchase/restored")
            isCommingFromSetting = true
            
            AppUserDefault.shared.isPayment = true
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4)
            {
                
                let vc = MessagesViewController()
                let rootNC = UINavigationController(rootViewController: vc)
                rootNC.navigationBar.isHidden = true
                UIApplication.shared.windows.first?.rootViewController = rootNC
                UIApplication.shared.windows.first?.makeKeyAndVisible()
            }
            
            alertWithMsg(vc: self, msg: "Purchased restored", title: "Alert!")
//            SKPaymentQueue.default().finishTransaction(transaction as? SKPaymentTransaction ?? SKPaymentTransaction())
          break
        case .failed:
          print("Purchased Failed")
//            alertWithMsg(vc: self, msg: "Purchased Failed", title: "Alert!")
//            SKPaymentQueue.default().finishTransaction(transaction as? SKPaymentTransaction ?? SKPaymentTransaction())
          break
        default:
          print("default")
          break
        }
      }
    }
    

}

extension PricingPlanController {
    
    func purchaseProduct(subscriptproduct:SubcriptionModel) {
        ActivityIndicator.shared.showSpinner(onView: self.view)
        SwiftyStoreKit.retrieveProductsInfo([subscriptproduct.productId]) { result in
            ActivityIndicator.shared.removeSpinner()
            if let product = result.retrievedProducts.first {
                ActivityIndicator.shared.removeSpinner()
                SwiftyStoreKit.purchaseProduct(product, quantity: 1, atomically: true) { result in
                    switch result  {
                    case .success(let purchase):
                        PaymentManager.shared.verifyPurchase(productId: purchase.productId) { status in
                            ActivityIndicator.shared.removeSpinner()
//                            self.updateTotalUserPoints(points: Int(subscriptproduct.earnedScore))
                            
                            isCommingFromSetting = true
                            
                            AppUserDefault.shared.isPayment = true
                            
                            let vc = MessagesViewController()
                            let rootNC = UINavigationController(rootViewController: vc)
                            rootNC.navigationBar.isHidden = true
                            UIApplication.shared.windows.first?.rootViewController = rootNC
                            UIApplication.shared.windows.first?.makeKeyAndVisible()
                            
                        }
                        AppUserDefault.shared.isPayment = true
                        print("Purchase Success: \(purchase.productId)")
                    case .error(let error):
                        ActivityIndicator.shared.removeSpinner()
                        switch error.code {
                        case .unknown:
                            alertWithMsg(vc: self, msg: "Please contact support", title: "Alert")
                        case .clientInvalid:
                            
                            alertWithMsg(vc: self, msg: "Not allowed to make the payment", title: "Alert")

                        case .paymentCancelled: break
                        case .paymentInvalid:
                            
                            alertWithMsg(vc: self, msg: "The purchase identifier was invalid", title: "Alert")
                        case .paymentNotAllowed:
                            
                            alertWithMsg(vc: self, msg: "The device is not allowed to make the payment", title: "Alert")

                        case .storeProductNotAvailable:
                            
                            alertWithMsg(vc: self, msg: "The product is not available in the current storefront", title: "Alert")

                        case .cloudServicePermissionDenied:
                            
                            alertWithMsg(vc: self, msg: "Access to cloud service information is not allowed", title: "Alert")

                        case .cloudServiceNetworkConnectionFailed:
                            
                            alertWithMsg(vc: self, msg: "Could not connect to the network", title: "Alert")

                        case .cloudServiceRevoked:
                            
                            alertWithMsg(vc: self, msg: "User has revoked permission to use this cloud service", title: "Alert")

                        default:
                            
                            print((error as NSError).localizedDescription)
//                            alertWithMsg(vc: self, msg: (error as NSError).localizedDescription, title: "Alert")

                        }
                    }
                }
            }
        }
    }
}

