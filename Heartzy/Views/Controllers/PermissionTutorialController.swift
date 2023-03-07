//
//  PermissionTutorialController.swift
//  Heartzy
//
//  Created by waseeem on 12/16/22.
//

import UIKit

class PermissionTutorialController: UIViewController {

    lazy var backgroundimg: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "BackgroundImg")
        iv.backgroundColor = UIColor.clear
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    //For Showing Credentails of PopUp
    lazy var shadowView : UIView = {
        var view = UIView()
        view.backgroundColor = .clear
        view.layer.masksToBounds = false
        view.layer.shadowOffset = CGSize.zero
        view.layer.cornerRadius = 10
        view.layer.shadowRadius = 10
        view.layer.shadowOpacity = 0.3
        view.isHidden = true
        view.translatesAutoresizingMaskIntoConstraints  = false
        return view
    }()
    
    lazy var popUP:GuidedAccessPopUp = {
        var view = GuidedAccessPopUp()
        view.clipsToBounds = false
        view.layer.cornerRadius  = 20 * appConstant.heightRatio
        return view
    }()
    
    lazy var blurView : UIVisualEffectView = {
        var blureffect : UIBlurEffect!
        if #available(iOS 10.0 , *){
            blureffect = UIBlurEffect(style: .dark)
        }else{
            blureffect = UIBlurEffect(style: .light)
        }
        var view = UIVisualEffectView (effect: blureffect)
        view.frame = view.bounds
        view.alpha = 0.5
        view.isHidden = true
        view.backgroundColor = .clear
        view.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.shadowView.isHidden = false
        self.blurView.isHidden = false

        view.backgroundColor = UIColor.white
        setup()
        
        popUP.guidedpermtitlelbl.text = "Do you want to watch the screen lock tutorial?"
        
        popUP.skipBtn.addTarget(self, action: #selector(hidePopUp), for: .touchUpInside)
        
        popUP.yesBtn.addTarget(self, action: #selector(yesbtn_Press), for: .touchUpInside)


    }
    
    override func viewWillAppear(_ animated: Bool) {

    }
    
    func setup(){
        let margin = view.layoutMarginsGuide
        view.addSubview(backgroundimg)
        view.addSubview(blurView)
        view.addSubview(shadowView)
        shadowView.addSubview(popUP)
        
        NSLayoutConstraint.activate([
            
            backgroundimg.topAnchor.constraint(equalTo: view.topAnchor, constant: -20 * appConstant.heightRatio),
            backgroundimg.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0 * appConstant.widthRatio),
            backgroundimg.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0 * appConstant.widthRatio),
            backgroundimg.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 20 * appConstant.heightRatio),
            
            
            blurView.topAnchor.constraint(equalTo: view.topAnchor),
            blurView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            blurView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            blurView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            
            shadowView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            shadowView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            shadowView.heightAnchor.constraint(equalToConstant: 320 * appConstant.heightRatio),
            shadowView.widthAnchor.constraint(equalToConstant: 288 * appConstant.widthRatio),
            
            popUP.topAnchor.constraint(equalTo: shadowView.topAnchor),
            popUP.leadingAnchor.constraint(equalTo: shadowView.leadingAnchor),
            popUP.trailingAnchor.constraint(equalTo: shadowView.trailingAnchor),
            popUP.bottomAnchor.constraint(equalTo: shadowView.bottomAnchor),
            
            
        ])
        
        
    }
    
    
    @objc func hidePopUp()
    {
        self.shadowView.isHidden = true
        self.blurView.isHidden = true
        
        let vc = GuidedAccessController()
        vc.isFromLauch = true
        let rootNC = UINavigationController(rootViewController: vc)
        rootNC.navigationBar.isHidden = true
        UIApplication.shared.windows.first?.rootViewController = rootNC
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
    
    @objc func yesbtn_Press()
    {
  
        self.shadowView.isHidden = true
        self.blurView.isHidden = true
        
        let vc = HowToLockController()
        let rootNC = UINavigationController(rootViewController: vc)
        rootNC.navigationBar.isHidden = true
        UIApplication.shared.windows.first?.rootViewController = rootNC
        UIApplication.shared.windows.first?.makeKeyAndVisible()
        
    }
    

}





class PermissionLockTutorialController: UIViewController {

    lazy var backgroundimg: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "BackgroundImg")
        iv.backgroundColor = UIColor.clear
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    //For Showing Credentails of PopUp
    lazy var shadowView : UIView = {
        var view = UIView()
        view.backgroundColor = .clear
        view.layer.masksToBounds = false
        view.layer.shadowOffset = CGSize.zero
        view.layer.cornerRadius = 10
        view.layer.shadowRadius = 10
        view.layer.shadowOpacity = 0.3
        view.isHidden = true
        view.translatesAutoresizingMaskIntoConstraints  = false
        return view
    }()
    
    lazy var popUP:GuidedAccessPopUp2 = {
        var view = GuidedAccessPopUp2()
        view.clipsToBounds = false
        view.layer.cornerRadius  = 20 * appConstant.heightRatio
        return view
    }()
    
    lazy var blurView : UIVisualEffectView = {
        var blureffect : UIBlurEffect!
        if #available(iOS 10.0 , *){
            blureffect = UIBlurEffect(style: .dark)
        }else{
            blureffect = UIBlurEffect(style: .light)
        }
        var view = UIVisualEffectView (effect: blureffect)
        view.frame = view.bounds
        view.alpha = 0.5
        view.isHidden = true
        view.backgroundColor = .clear
        view.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var isFromLauch = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.shadowView.isHidden = false
        self.blurView.isHidden = false

        view.backgroundColor = UIColor.white
        setup()
        
        popUP.guidedpermtitlelbl.text = "Tap Home 3 times to enable screen lock mode (guided access)"
        
        popUP.skipBtn.addTarget(self, action: #selector(hidePopUp), for: .touchUpInside)
        
        popUP.yesBtn.addTarget(self, action: #selector(yesbtn_Press), for: .touchUpInside)


    }
    
    override func viewWillAppear(_ animated: Bool) {

    }
    
    func setup(){
        let margin = view.layoutMarginsGuide
        view.addSubview(backgroundimg)
        view.addSubview(blurView)
        view.addSubview(shadowView)
        shadowView.addSubview(popUP)
        
        NSLayoutConstraint.activate([
            
            backgroundimg.topAnchor.constraint(equalTo: view.topAnchor, constant: -20 * appConstant.heightRatio),
            backgroundimg.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0 * appConstant.widthRatio),
            backgroundimg.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0 * appConstant.widthRatio),
            backgroundimg.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 20 * appConstant.heightRatio),
            
            
            blurView.topAnchor.constraint(equalTo: view.topAnchor),
            blurView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            blurView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            blurView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            
            shadowView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            shadowView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            shadowView.heightAnchor.constraint(equalToConstant: 320 * appConstant.heightRatio),
            shadowView.widthAnchor.constraint(equalToConstant: 288 * appConstant.widthRatio),
            
            popUP.topAnchor.constraint(equalTo: shadowView.topAnchor),
            popUP.leadingAnchor.constraint(equalTo: shadowView.leadingAnchor),
            popUP.trailingAnchor.constraint(equalTo: shadowView.trailingAnchor),
            popUP.bottomAnchor.constraint(equalTo: shadowView.bottomAnchor),
            
            
        ])
        
        
    }
    
    
    @objc func hidePopUp()
    {
        self.shadowView.isHidden = true
        self.blurView.isHidden = true
        
        let vc = GuidedAccessController()
        let rootNC = UINavigationController(rootViewController: vc)
        rootNC.navigationBar.isHidden = true
        UIApplication.shared.windows.first?.rootViewController = rootNC
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
    
    @objc func yesbtn_Press()
    {
  
        self.shadowView.isHidden = true
        self.blurView.isHidden = true
        
        
        if isFromLauch == true
        {
            isCommingFromSetting = true
                    
            let vc = MessagesViewController()
            
            let rootNC = UINavigationController(rootViewController: vc)
            rootNC.navigationBar.isHidden = true
            UIApplication.shared.windows.first?.rootViewController = rootNC
            UIApplication.shared.windows.first?.makeKeyAndVisible()
        }
        else
        {
            let vc = MessagesViewController()
            let rootNC = UINavigationController(rootViewController: vc)
            rootNC.navigationBar.isHidden = true
            UIApplication.shared.windows.first?.rootViewController = rootNC
            UIApplication.shared.windows.first?.makeKeyAndVisible()
        }
        
    }
    

}
