//
//  TestController.swift
//  Heartzy
//
//  Created by waseeem on 12/26/22.
//

import UIKit
import Firebase
//import FirebaseAuth
import SwiftConfettiView
import SPConfetti
import WebKit

//var isCommingFromSetting = false




class TestController: UIViewController, WKNavigationDelegate {
    
    
    lazy var headerView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black
        view.clipsToBounds = true
//        view.layer.cornerRadius = 8 * appConstant.heightRatio
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var backBtn : UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor.clear
        btn.tintColor =  UIColor.black
        btn.layer.shadowOpacity = 0
        btn.setImage(UIImage(named: "backArrow"), for: .normal)
        btn.addTarget(self, action: #selector(backbtn_press), for: .touchUpInside)
        return btn
    }()

    
    lazy var topLogo : UIImageView = {
        var img  = UIImageView()
        img.image = UIImage(named: "splash_logo")
//        img.layer.cornerRadius = 8 * appConstant.heightRatio
        img.clipsToBounds = true
        img.contentMode = .scaleAspectFit
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    lazy var menuBtn : UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor.clear
        btn.tintColor =  UIColor.black
        btn.layer.shadowOpacity = 0
        btn.setImage(UIImage(named: "menuIcon"), for: .normal)
//        btn.addTarget(self, action: #selector(passhiddenbtn_press), for: .touchUpInside)
        return btn
    }()
    
    
    lazy var VideotopLogo : WKWebView = {
        var img  = WKWebView()
//        img.image = UIImage(named: "uploadvideoIcon")
//        img.layer.cornerRadius = 8 * appConstant.heightRatio
        img.clipsToBounds = true
        img.contentMode = .scaleAspectFill
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    var theLink : String?
    


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
//        let startdatetime = data
//        let fullNameArr = startdatetime?.components(separatedBy: "/")
//        let the_date = fullNameArr?[3] //First.
        
        
        view.backgroundColor = .white
        setUp()
        
        
        let Username =  "instagram" // Your Instagram Username here
        
        let url = URL(string: "https://instagram.com/\(Username)")!
        let request = URLRequest(url: url)
           let webView = WKWebView(frame: self.VideotopLogo.frame)
           webView.autoresizingMask = [.flexibleWidth, .flexibleHeight] //It assigns Custom View height and width
           webView.navigationDelegate = self
           
           webView.load(request)
           self.VideotopLogo.addSubview(webView)
        
        
//        let twitchURL = NSURL(string: "twitch://open/")
//
//        let fbWebUrl : NSURL = NSURL(string: "https://player.twitch.tv/?channel=\(theLink ?? "")&parent=test.responseauction.com&muted=false") ?? NSURL()
//
//
//        if (UIApplication.shared.canOpenURL(twitchURL! as URL)) {
//            // The Twitch app is installed, do whatever logic you need, and call -openURL:
//            UIApplication.shared.open(fbWebUrl as URL, options: [:], completionHandler: nil)
//        } else {
//            // The Twitch app is not installed. Prompt the user to install it!
//            UIApplication.shared.open(fbWebUrl as URL, options: [:], completionHandler: nil)
//        }
        
        
       
    }
    
    func setUp(){
        
        view.addSubview(headerView)
        view.addSubview(backBtn)
        view.addSubview(topLogo)
        view.addSubview(menuBtn)
        view.addSubview(VideotopLogo)

        NSLayoutConstraint.activate([
            
            
            headerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0 * appConstant.heightRatio),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0 * appConstant.widthRatio),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0 * appConstant.widthRatio),
            headerView.heightAnchor.constraint(equalToConstant: 100 * appConstant.heightRatio),
            
            backBtn.centerYAnchor.constraint(equalTo: topLogo.centerYAnchor, constant: 0 * appConstant.heightRatio),
            backBtn.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            backBtn.heightAnchor.constraint(equalToConstant: 30 * appConstant.heightRatio),
            backBtn.widthAnchor.constraint(equalToConstant: 30 * appConstant.heightRatio),
            
            topLogo.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -10 * appConstant.heightRatio),
            topLogo.leadingAnchor.constraint(equalTo: backBtn.trailingAnchor, constant: 2 * appConstant.widthRatio),
            topLogo.heightAnchor.constraint(equalToConstant: 35 * appConstant.heightRatio),
            topLogo.widthAnchor.constraint(equalToConstant: 131 * appConstant.heightRatio),
            
            menuBtn.centerYAnchor.constraint(equalTo: topLogo.centerYAnchor, constant: 0 * appConstant.heightRatio),
            menuBtn.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -20 * appConstant.widthRatio),
            menuBtn.heightAnchor.constraint(equalToConstant: 30 * appConstant.heightRatio),
            menuBtn.widthAnchor.constraint(equalToConstant: 30 * appConstant.heightRatio),
            
       
            self.VideotopLogo.topAnchor.constraint(equalTo: headerView.bottomAnchor,constant: 0 * appConstant.heightRatio),
            VideotopLogo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0 * appConstant.widthRatio),
            VideotopLogo.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0 * appConstant.widthRatio),
            VideotopLogo.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0 * appConstant.heightRatio),
    
        ])
        
    }
    
    
    @objc func backbtn_press()
    {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
    
}




//class TestController: UIViewController,UITextFieldDelegate {
//
//    lazy var headerView : UIView = {
//        let view = UIView()
//        view.backgroundColor = UIColor(named: Colors.Primary_Color)
//        view.layer.shadowColor = UIColor.black.cgColor
//        view.layer.shadowOpacity = 0.25
//        view.layer.shadowOffset = CGSize(width: 0, height: 2)
//        view.layer.shadowRadius = 5 * appConstant.heightRatio
//        view.clipsToBounds = false
////        view.layer.maskedCorners = [.layerMinXMaxYCorner,.layerMaxXMaxYCorner]
//        view.translatesAutoresizingMaskIntoConstraints = false
//        return view
//    }()
//
//    lazy var settingBtn : CustomButton = {
//        let btn = CustomButton()
//        btn.translatesAutoresizingMaskIntoConstraints = false
//        btn.backgroundColor = UIColor.clear
//        btn.layer.cornerRadius = 15 * appConstant.heightRatio
//        btn.layer.shadowOpacity = 0.5
//        btn.layer.shadowColor = UIColor.clear.cgColor
//        btn.contentMode = .scaleToFill
//        btn.setImage(UIImage(named: "settingIcon"), for: .normal)
//        btn.clipsToBounds = true
//        btn.tintColor = UIColor(named: Colors.Primary_Color)
//        btn.addTarget(self, action: #selector(settingActionBtn_Press), for: .touchUpInside)
//        return btn
//    }()
//
//
//    lazy var Perimg : UIImageView = {
//        let iv = UIImageView()
//        iv.layer.cornerRadius = 23 * appConstant.heightRatio
//        iv.backgroundColor = .clear
//        iv.image = UIImage(named: "dummypick")
//        iv.translatesAutoresizingMaskIntoConstraints = false
//        iv.contentMode = .scaleAspectFill
//        iv.clipsToBounds = true
//        return iv
//    }()
//
//    lazy var perNamelbl : UILabel = {
//        let lbl = UILabel()
//        lbl.clipsToBounds = true
//        lbl.textColor = UIColor.lightGray
//        lbl.textAlignment = .center
//        lbl.font = UIFont.appFont(ofSize: 15, weight: .regular)
//        lbl.text = "Alberto Raya"
//        lbl.numberOfLines = 0
//        lbl.adjustsFontSizeToFitWidth = true
//        lbl.sizeToFit()
//        lbl.translatesAutoresizingMaskIntoConstraints = false
//        return lbl
//    }()
//
//    lazy var LogoImg : UIImageView = {
//        var img  = UIImageView()
//        img.image = UIImage(named: "splash")
////        img.layer.cornerRadius = 8 * appConstant.heightRatio
//        img.clipsToBounds = true
//        img.isHidden = true
//        img.contentMode = .scaleAspectFill
//        img.translatesAutoresizingMaskIntoConstraints = false
//        return img
//    }()
//
//    lazy var DataTableview : UITableView = {
//        let tv = UITableView()
//        tv.showsVerticalScrollIndicator = false
//        tv.backgroundColor = UIColor.white
////        tv.layer.cornerRadius = 18 * appConstant.heightRatio
//        tv.clipsToBounds = true
//        tv.separatorStyle = .none
//        tv.separatorStyle = .none
//        tv.isScrollEnabled = true
//        tv.isUserInteractionEnabled = true
//        tv.translatesAutoresizingMaskIntoConstraints = false
//        return tv
//    }()
//
//    lazy var bottomView : UIView = {
//        let view = UIView()
//        view.backgroundColor = UIColor.white
////        view.layer.cornerRadius  = 36 * appConstant.heightRatio
//        view.clipsToBounds = false
////        view.layer.maskedCorners = [.layerMinXMaxYCorner,.layerMaxXMaxYCorner]
//        view.translatesAutoresizingMaskIntoConstraints = false
//        return view
//    }()
//
//    lazy var sendTextTF : EmojiTextField = {
//        let tf = EmojiTextField()
//        tf.backgroundColor = .white
//        tf.attributedPlaceholder = NSAttributedString(
//            string: "Type your message...",
//            attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: Colors.Primary_Color) ?? .systemPink])
//        tf.textColor = UIColor(named: Colors.Primary_Color)
//        tf.font = regular(size: 15)
//        tf.layer.cornerRadius = 23 * appConstant.heightRatio
//        tf.layer.borderColor = UIColor(named: Colors.Primary_Color)?.cgColor
//        tf.layer.borderWidth = 1 * appConstant.heightRatio
//        tf.setPadding(left: 10, right: 10)
////        tf.addToolbarInputAccessoryView(toolbarHeight: 44)
//        tf.translatesAutoresizingMaskIntoConstraints = false
//        return tf
//    }()
//
//    lazy var sendmsgBtn : CustomButton = {
//        let btn = CustomButton()
//        btn.translatesAutoresizingMaskIntoConstraints = false
//        btn.backgroundColor = UIColor.clear
//        btn.layer.cornerRadius = 15 * appConstant.heightRatio
//        btn.layer.shadowOpacity = 0.5
//        btn.layer.shadowColor = UIColor.clear.cgColor
//        btn.contentMode = .scaleToFill
//        btn.setImage(UIImage(named: "send"), for: .normal)
//        btn.clipsToBounds = true
//        btn.isUserInteractionEnabled = false
//        btn.layer.opacity = 0.2
//        btn.tintColor = UIColor(named: Colors.Primary_Color)
//        btn.addTarget(self, action: #selector(sendmsgBtn_press), for: .touchUpInside)
//        return btn
//    }()
//
//
//    //For Showing Credentails of PopUp
//    lazy var shadowView : UIView = {
//        var view = UIView()
//        view.backgroundColor = .clear
//        view.layer.masksToBounds = false
//        view.layer.shadowOffset = CGSize.zero
//        view.layer.cornerRadius = 10
//        view.layer.shadowRadius = 10
//        view.layer.shadowOpacity = 0.3
//        view.isHidden = true
//        view.translatesAutoresizingMaskIntoConstraints  = false
//        return view
//    }()
//
//    lazy var popUP:InfoPopUpView = {
//        var view = InfoPopUpView()
//        view.clipsToBounds = false
//        view.layer.cornerRadius  = 20 * appConstant.heightRatio
//        return view
//    }()
//
//    lazy var blurView : UIVisualEffectView = {
//        var blureffect : UIBlurEffect!
//        if #available(iOS 10.0 , *){
//            blureffect = UIBlurEffect(style: .dark)
//        }else{
//            blureffect = UIBlurEffect(style: .light)
//        }
//        var view = UIVisualEffectView (effect: blureffect)
//        view.frame = view.bounds
//        view.alpha = 0.5
//        view.isHidden = true
//        view.backgroundColor = .clear
//        view.autoresizingMask = [.flexibleWidth,.flexibleHeight]
//        view.translatesAutoresizingMaskIntoConstraints = false
//        return view
//    }()
//
//
//    lazy var confView : SPConfettiView = {
//        let view = SPConfettiView()
//        view.backgroundColor = UIColor.clear
////        view.type = .diamond
//        view.particles = [.star, .arc, .triangle, .circle, .heart]
//        view.isHidden = true
////        view.type = .image(UIImage(named: "smiley") ?? UIImage())
//
////        view.layer.cornerRadius  = 36 * appConstant.heightRatio
////        view.layer.shadowColor = UIColor.black.cgColor
////        view.layer.shadowOpacity = 0.25
////        view.layer.shadowOffset = CGSize(width: 0, height: 2)
////        view.layer.shadowRadius = 5 * appConstant.heightRatio
//        view.clipsToBounds = false
////        view.layer.maskedCorners = [.layerMinXMaxYCorner,.layerMaxXMaxYCorner]
//        view.translatesAutoresizingMaskIntoConstraints = false
//        return view
//    }()
//
//
//    var messages = [message]()
//    var count = 0
//    var arr = [0,1]
//    var theData = [String : Any]()
//    var chatId = String()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//
////        confView.startConfetti()
////        confView.isActive()
//
//        //onload popup will hide
//        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
//            self.shadowView.isHidden = false
//            self.blurView.isHidden = false
////            self.confView.stopConfetti()
////            self.confView.isHidden = true
//        }
//
//        popUP.cancelBtn.addTarget(self, action: #selector(hidePopUp), for: .touchUpInside)
//
//        DataTableview.delegate = self
//        DataTableview.dataSource = self
//        DataTableview.register(SenderTVCell.self, forCellReuseIdentifier: SenderTVCell.cellidentifier)
//        DataTableview.register(RecieverTVCell.self, forCellReuseIdentifier: RecieverTVCell.cellidentifier)
//
//        view.backgroundColor = .white
//        setUPUI()
//
////        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(sender:)), name: UIResponder.keyboardWillShowNotification, object: nil);
////
////        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(sender:)), name: UIResponder.keyboardWillHideNotification, object: nil);
//
//        sendTextTF.delegate = self
//
////        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard (_:)))
////        self.view.addGestureRecognizer(tapGesture)
//
//        //For Setting Login state
//        AppUserDefault.shared.isLogin = true
//
//        getdata()
//
////        readMessage()
//
//    }
//
//
//    func getdata()
//    {
//        let ref = Database.database().reference()
//        guard let uid = Auth.auth().currentUser?.uid else {
//            print("User Not Found")
//            return
//        }
//
//        chatId = uid
//
//        ref.child("users").child(uid).observe(.value, with: { (snapshot) in
//            if let dictionary = snapshot.value as? [String : Any] {
//                userDefaults.set(dictionary, forKey: "myKey")
//                print("The Name of User is",dictionary["name"] as? String)
//                self.theData = dictionary as [String : Any]
//                self.perNamelbl.text = dictionary["name"] as? String
//                self.Perimg.setImageFrom(dictionary["image"] as? String ?? "")
//                print("The User is",dictionary)
//            }
//        }) { (error) in
//             guard error == nil else{
//                               return
//                           }
//        }
//    }
//
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        sendTextTF.keyboardType = .asciiCapable
//        DataTableview.reloadData()
//
//        if AppUserDefault.shared.theme1 == true
//        {
//            LogoImg.isHidden = true
//            DataTableview.backgroundColor = .white
//        }
//        else if AppUserDefault.shared.theme2 == true
//        {
//            LogoImg.isHidden = false
//            LogoImg.image = UIImage(named: "Cottagecore2")
//            DataTableview.backgroundColor = .clear
//
//        }
//        else if AppUserDefault.shared.theme3 == true
//        {
//            LogoImg.isHidden = false
//            LogoImg.image = UIImage(named: "DarkAcademia")
//            DataTableview.backgroundColor = .clear
//
//
//        }
//        else if AppUserDefault.shared.theme4 == true
//        {
//            LogoImg.isHidden = false
//            LogoImg.image = UIImage(named: "")
//            DataTableview.backgroundColor = .clear
//
//        }
//        else if AppUserDefault.shared.theme5 == true
//        {
//
//            LogoImg.isHidden = false
//            LogoImg.image = UIImage(named: "")
//            DataTableview.backgroundColor = .clear
//
//        }
//
//        changingBackground()
//
//        let alreadyShownarray = getMessageData()
//        messages.append(contentsOf: alreadyShownarray ?? [])
//        print(alreadyShownarray ?? [])
//
//        isCommingFromSetting = true
//
//    }
//
//    func getMessageData() -> [message]? {
//          let userDefaults = UserDefaults.standard
//          do {
//            let user = try userDefaults.getData(forKey: "messages", castTo: [message].self)
//            print(user)
//            return user
//          } catch {
//            print(error.localizedDescription)
//            return nil
//          }
//        }
//
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        sendTextTF.keyboardType = .default
//        sendTextTF.reloadInputViews()
//    }
//
//
//    func setUPUI()
//    {
//        view.addSubview(LogoImg)
//        view.addSubview(headerView)
//        headerView.addSubview(settingBtn)
//        headerView.addSubview(Perimg)
//        headerView.addSubview(perNamelbl)
//        view.addSubview(DataTableview)
////        view.addSubview(bottomView)
//        view.addSubview(sendTextTF)
//        view.addSubview(sendmsgBtn)
//        view.addSubview(confView)
//        view.addSubview(blurView)
//        view.addSubview(shadowView)
//        shadowView.addSubview(popUP)
//
//        NSLayoutConstraint.activate([
//
//            headerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0 * appConstant.heightRatio),
//            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0 * appConstant.widthRatio),
//            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -0 * appConstant.widthRatio),
//            headerView.heightAnchor.constraint(equalToConstant: 120 * appConstant.heightRatio),
//
//            settingBtn.centerYAnchor.constraint(equalTo: headerView.centerYAnchor, constant: 0 * appConstant.heightRatio),
//            settingBtn.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -20 * appConstant.widthRatio),
//            settingBtn.heightAnchor.constraint(equalToConstant: 38 * appConstant.heightRatio),
//            settingBtn.widthAnchor.constraint(equalToConstant: 38 * appConstant.heightRatio),
//
//            Perimg.centerYAnchor.constraint(equalTo: headerView.centerYAnchor, constant: 0 * appConstant.heightRatio),
//            Perimg.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 20 * appConstant.widthRatio),
//            Perimg.heightAnchor.constraint(equalToConstant: 46 * appConstant.heightRatio),
//            Perimg.widthAnchor.constraint(equalToConstant: 46 * appConstant.heightRatio),
//
//            perNamelbl.leadingAnchor.constraint(equalTo: Perimg.trailingAnchor, constant: 12 * appConstant.heightRatio),
//            perNamelbl.centerYAnchor.constraint(equalTo: Perimg.centerYAnchor, constant: 0 * appConstant.heightRatio),
//
//            LogoImg.topAnchor.constraint(equalTo: view.topAnchor, constant: 0 * appConstant.heightRatio),
//            LogoImg.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0 * appConstant.widthRatio),
//            LogoImg.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0 * appConstant.widthRatio),
//            LogoImg.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0 * appConstant.heightRatio),
//
//            DataTableview.topAnchor.constraint(equalTo: view.topAnchor, constant: 120 * appConstant.heightRatio),
//            DataTableview.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0 * appConstant.widthRatio),
//            DataTableview.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -0 * appConstant.widthRatio),
//            DataTableview.bottomAnchor.constraint(equalTo: sendTextTF.topAnchor, constant: -10 * appConstant.widthRatio),
//
////            bottomView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0 * appConstant.heightRatio),
////            bottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0 * appConstant.widthRatio),
////            bottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -0 * appConstant.widthRatio),
////            bottomView.heightAnchor.constraint(equalToConstant: 150 * appConstant.heightRatio),
//
//            sendTextTF.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50 * appConstant.widthRatio),
//            sendTextTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20 * appConstant.widthRatio),
////            sendTextTF.widthAnchor.constraint(equalToConstant: 310 * appConstant.heightRatio),
//            sendTextTF.heightAnchor.constraint(equalToConstant: 50 * appConstant.heightRatio),
//
//            sendmsgBtn.leadingAnchor.constraint(equalTo: sendTextTF.trailingAnchor, constant: 6 * appConstant.heightRatio),
//            sendmsgBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20 * appConstant.heightRatio),
//            sendmsgBtn.centerYAnchor.constraint(equalTo: sendTextTF.centerYAnchor, constant: 0 * appConstant.heightRatio),
//            sendmsgBtn.heightAnchor.constraint(equalToConstant: 38 * appConstant.heightRatio),
//            sendmsgBtn.widthAnchor.constraint(equalToConstant: 38 * appConstant.heightRatio),
//
//            blurView.topAnchor.constraint(equalTo: view.topAnchor),
//            blurView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            blurView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            blurView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
//
//            shadowView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            shadowView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//            shadowView.heightAnchor.constraint(equalToConstant: 420 * appConstant.heightRatio),
//            shadowView.widthAnchor.constraint(equalToConstant: 288 * appConstant.widthRatio),
//
//            popUP.topAnchor.constraint(equalTo: shadowView.topAnchor),
//            popUP.leadingAnchor.constraint(equalTo: shadowView.leadingAnchor),
//            popUP.trailingAnchor.constraint(equalTo: shadowView.trailingAnchor),
//            popUP.bottomAnchor.constraint(equalTo: shadowView.bottomAnchor),
//
//
//            confView.topAnchor.constraint(equalTo: view.topAnchor),
//            confView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            confView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            confView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
//
//        ])
//
//    }
//
//
////    @objc func readMessage(){
////
////        Database.database().reference().child("chats").child(chatId).observe(.value) { snapshot in
////            self.messages.removeAll()
////            for item in snapshot.children{
////
////                if let snap = item as? DataSnapshot{
////                    if let dictionary = snap.value as? [String: AnyObject]
////                    {
////                        let msg = message()
//////                        msg.toid = dictionary["toid"] as! String
////                        msg.senderid = dictionary["senderid"] as! String
////                        msg.message = dictionary["message"] as! String
////                        msg.datetime = dictionary["datetime"] as! String
////                        self.messages.append(msg)
////                    }
////                }
////                DispatchQueue.main.async {
////
////                    self.DataTableview.reloadData()
////                    if self.messages.count>0{
////                        let index = IndexPath(row: self.messages.count - 1, section: 0)
////                        self.DataTableview.scrollToRow(at: index, at: .bottom, animated: true)
////                    }
////                }
////            }
////
////        } withCancel: { (error) in
////            print(error.localizedDescription)
////        }
////    }
//
//
//    func changingBackground()
//    {
//        if AppUserDefault.shared.color1 == true
//        {
//            Colors.Primary_Color = "Purple"
//            headerView.backgroundColor = UIColor(named: Colors.Primary_Color)
//        }
//        else if AppUserDefault.shared.color2 == true
//        {
//            Colors.Primary_Color = "PrimaryColor"
//            headerView.backgroundColor = UIColor(named: Colors.Primary_Color)
//
//        }
//        else if AppUserDefault.shared.color3 == true
//        {
//            Colors.Primary_Color = "Blue"
//            headerView.backgroundColor = UIColor(named: Colors.Primary_Color)
//
//        }
//        else if AppUserDefault.shared.color4 == true
//        {
//            Colors.Primary_Color = "Yellow"
//            headerView.backgroundColor = UIColor(named: Colors.Primary_Color)
//
//        }
//        else if AppUserDefault.shared.color5 == true
//        {
//            Colors.Primary_Color = "Green"
//            headerView.backgroundColor = UIColor(named: Colors.Primary_Color)
//
//        }
//
//    }
//
//    @objc func settingActionBtn_Press()
//    {
//
//        isCommingFromSetting = true
//
//        self.navigationController?.pushViewController(SettingController(), animated: true)
//
////                let settings = URL(string: "App-prefs:ACCESSIBILITY&path=GUIDED_ACCESS_TITLE")
////                UIApplication.shared.open(settings!, options: [UIApplication.OpenExternalURLOptionsKey.universalLinksOnly : false])
//        //                UIApplication.shared.open(settings!, options: [:], completionHandler: nil)
//
//    }
//
//
//    @objc func sendmsgBtn_press()
//    {
//        count += 1
//
//        isCommingFromSetting = false
//
//        self.view.endEditing(true)
//
//
//        if sendTextTF.text != ""
//        {
//
//            sendmsgBtn.isUserInteractionEnabled = true
//            sendmsgBtn.layer.opacity = 1
//
//            messages.append(message(senderid: "1", message: sendTextTF.text?.encodeChatString(), datetime: "01"))
//
//
//            let timeStamp: NSNumber = NSNumber(value: Int(NSDate().timeIntervalSince1970))
//            let udid = UUID().uuidString
//
//            guard let myId = Auth.auth().currentUser?.uid else {
//                print("User Not Found")
//                return
//            }
//
//
////            let dic = ["senderid" : myId ,"toid" : "123" ,"message" : sendTextTF.text?.encodeChatString() , "datetime" : Date().debugDescription]
////            Database.database().reference().child("chats").child(myId).child("\(timeStamp)").setValue(dic)
//
////            self.DataTableview.reloadData()
//
//
////            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){ [self] in
//
//
//            var theRandomEmoiji = emojiString + emojiString
//
//            if isEmoji(self.sendTextTF.text ?? "")
//            {
//                self.messages.append(message(senderid: "2", message: (self.sendTextTF.text?.encodeChatString())!! + (self.sendTextTF.text?.encodeChatString())!, datetime: "01"))
//
//            }
//            else
//            {
//                self.messages.append(message(senderid: "2", message: theRandomEmoiji.encodeChatString()! + (self.sendTextTF.text?.encodeChatString())!! + theRandomEmoiji.encodeChatString()!, datetime: "01"))
//            }
//
////            let dic2 = ["senderid" : "123" ,"toid" : myId ,"message" : (self.sendTextTF.text?.encodeChatString())!! + (self.sendTextTF.text?.encodeChatString())! , "datetime" : Date().debugDescription]
////            Database.database().reference().child("chats").child("123").child("\(timeStamp)").setValue(dic2)
//
//
//
////                self.messages.append(message(senderid: "2", message: (self.sendTextTF.text?.encodeChatString())! + (randomEmoji().encodeChatString()!), datetime: "01"))
//
//
//            DispatchQueue.main.async {
////                isCommingFromSetting = true
//                self.DataTableview.reloadData()
//                if self.messages.count>0{
//                    let index = IndexPath(row: self.messages.count - 1, section: 0)
//                    self.DataTableview.scrollToRow(at: index, at: .bottom, animated: true)
//                }
//            }
//
//            //            }
//
//            self.sendTextTF.text = ""
//
//
//        }
//        else
//        {
//            sendmsgBtn.isUserInteractionEnabled = false
//            sendmsgBtn.layer.opacity = 0.5
//
//        }
//
//        saveEventsData(messages)
//
//    }
//
//    func saveEventsData(_ data: [message]) {
//        let userDefaults = UserDefaults.standard
//        do {
//            try userDefaults.setData(data, forKey: "messages")
//          userDefaults.synchronize()
//        } catch let error{
//          print(error.localizedDescription)
//        }
//      }
//
//    @objc func dismissKeyboard (_ sender: UITapGestureRecognizer) {
//        sendTextTF.resignFirstResponder()
//    }
//
//    func randomEmoji() -> String {
//        let pointer = Unmanaged.passUnretained(self).toOpaque()
//               // You can adjust your range
//               //let range = 0x1F600...0x1F64F
//        let range = 0x1F300...0x1F3F0
//        let index = (pointer.hashValue % range.count)
//        let ord = range.lowerBound + index
//        guard let scalar = UnicodeScalar(ord) else { return "❓" }
//        return String(scalar)
//
//    }
//
//    public var emojiString: String {
//
//        let pointer = Unmanaged.passUnretained(self).toOpaque()
//         // You can adjust your range
//         //let range = 0x1F600...0x1F64F
//         let range = 0x1F300...0x1F3F0
//         let index = (pointer.hashValue % range.count)
//         let ord = range.lowerBound + index
//         guard let scalar = UnicodeScalar(ord) else { return "❓" }
//         return String(scalar)
//
//     }
//
//    @objc func hidePopUp()
//    {
//        self.shadowView.isHidden = true
//        self.blurView.isHidden = true
//    }
//
//    @objc func keyboardWillShow(sender: NSNotification) {
//         self.view.frame.origin.y = -320 // Move view 150 points upward
//    }
//
//    @objc func keyboardWillHide(sender: NSNotification) {
//         self.view.frame.origin.y = 0 // Move view to original position
//    }
//
//    func isEmoji(_ character: String?) -> Bool {
//
//            if character == "" || character == "\n" {
//                return false
//            }
//            let characterRender = UILabel(frame: CGRect(x: 0, y: 0, width: 1, height: 1))
//            characterRender.text = character
//            characterRender.backgroundColor = UIColor.black
//            characterRender.sizeToFit()
//            let rect: CGRect = characterRender.bounds
//            UIGraphicsBeginImageContextWithOptions(rect.size, true, 0.0)
//
//            if let contextSnap:CGContext = UIGraphicsGetCurrentContext() {
//                characterRender.layer.render(in: contextSnap)
//            }
//
//            let capturedImage: UIImage? = (UIGraphicsGetImageFromCurrentImageContext())
//            UIGraphicsEndImageContext()
//            var colorPixelFound:Bool = false
//
//            let imageRef = capturedImage?.cgImage
//            let width:Int = imageRef!.width
//            let height:Int = imageRef!.height
//
//            let colorSpace = CGColorSpaceCreateDeviceRGB()
//
//            let rawData = calloc(width * height * 4, MemoryLayout<CUnsignedChar>.stride).assumingMemoryBound(to: CUnsignedChar.self)
//
//                let bytesPerPixel:Int = 4
//                let bytesPerRow:Int = bytesPerPixel * width
//                let bitsPerComponent:Int = 8
//
//                let context = CGContext(data: rawData, width: Int(width), height: Int(height), bitsPerComponent: Int(bitsPerComponent), bytesPerRow: Int(bytesPerRow), space: colorSpace, bitmapInfo: CGImageAlphaInfo.premultipliedLast.rawValue | CGBitmapInfo.byteOrder32Big.rawValue)
//
//
//
//            context?.draw(imageRef!, in: CGRect(x: 0, y: 0, width: width, height: height))
//
//                var x:Int = 0
//                var y:Int = 0
//                while (y < height && !colorPixelFound) {
//
//                    while (x < width && !colorPixelFound) {
//
//                        let byteIndex: UInt  = UInt((bytesPerRow * y) + x * bytesPerPixel)
//                        let red = CGFloat(rawData[Int(byteIndex)])
//                        let green = CGFloat(rawData[Int(byteIndex+1)])
//                        let blue = CGFloat(rawData[Int(byteIndex + 2)])
//
//                        var h: CGFloat = 0.0
//                        var s: CGFloat = 0.0
//                        var b: CGFloat = 0.0
//                        var a: CGFloat = 0.0
//
//                        var c = UIColor(red:red, green:green, blue:blue, alpha:1.0)
//                        c.getHue(&h, saturation: &s, brightness: &b, alpha: &a)
//
//                        b = b/255.0
//
//                        if Double(b) > 0.0 {
//                            colorPixelFound = true
//                        }
//                        x+=1
//                    }
//                    x=0
//                    y+=1
//                }
//
//            return colorPixelFound
//    }
//
//}
//
//extension TestController :  UITableViewDelegate,UITableViewDataSource {
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//
//        if isCommingFromSetting == false
//        {
//            if messages.count == 0
//            {
//                print("Noting")
//            }
//            else
//            {
//                if messages.count % 4 == 0
//                {
//                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0){
//
//                        //                self.confView.startConfetti()
//                        self.confView.startAnimating()
//                        self.confView.isHidden = false
//                    }
//                }
//            }
//        }
//
//        return messages.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//        let data = messages[indexPath.row]
//
//        if data.senderid == "2"{
//
//            let cell = DataTableview.dequeueReusableCell(withIdentifier: RecieverTVCell.cellidentifier, for: indexPath) as! RecieverTVCell
//
//            if AppUserDefault.shared.bot1 == true
//            {
//                cell.recieverimg.image = UIImage(named: "Bot1")
//            }
//            else if AppUserDefault.shared.bot2 == true
//            {
//                cell.recieverimg.image = UIImage(named: "Bot2")
//
//            }
//            if AppUserDefault.shared.bot3 == true
//            {
//                cell.recieverimg.image = UIImage(named: "Bot3")
//
//            }
//            if AppUserDefault.shared.bot4 == true
//            {
//                cell.recieverimg.image = UIImage(named: "Bot4")
//
//            }
//            if AppUserDefault.shared.bot5 == true
//            {
//                cell.recieverimg.image = UIImage(named: "Bot4")
//            }
////            else {
////                cell.recieverimg.image = UIImage(named: "Bot1")
////            }
//
//            if isCommingFromSetting == false
//            {
//                if indexPath.row == messages.count - 1
//                {
//                    cell.recievertext.text = "Typing..."
//
//                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.5){
//
//                        isCommingFromSetting = true
//
//                        self.confView.stopAnimating()
//                        self.confView.isHidden = true
//                        tableView.reloadData()
//                        DispatchQueue.main.async {
//                            cell.recievertext.text = data.message.decodeChatString()
//                        }
//
//                    }
//                }
//                else
//                {
//                    cell.recievertext.text = data.message.decodeChatString()
//                }
//
//            }
//            else
//            {
//                cell.recievertext.text = data.message.decodeChatString()
//            }
//
//            return cell
//
//        }
//        else
//        {
//
//            let cell = DataTableview.dequeueReusableCell(withIdentifier: SenderTVCell.cellidentifier, for: indexPath) as! SenderTVCell
//
////            self.confView.startAnimating()
////            self.confView.isHidden = false
//
//            cell.sendertext.text = data.message.decodeChatString()
//
//            DispatchQueue.main.async {
//                cell.senderimg.setImageFrom(self.theData["image"] as? String ?? "")
//            }
////            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
////                self.confView.stopAnimating()
////                self.confView.isHidden = true
////            }
//
//            return cell
//
//        }
//    }
//
//
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UITableView.automaticDimension
//    }
//
//
//}
//
//extension TestController : UITextViewDelegate{
//
//
//    func textFieldDidBeginEditing(_ textField: UITextField) {
//        DispatchQueue.main.async {
//            isCommingFromSetting = true
//            self.DataTableview.reloadData()
//            if self.messages.count>0{
//                let index = IndexPath(row: self.messages.count - 1, section: 0)
//                self.DataTableview.scrollToRow(at: index, at: .bottom, animated: true)
//            }
//        }
//        sendmsgBtn.isUserInteractionEnabled = true
//        sendmsgBtn.layer.opacity = 0.5
//    }
//
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//
//        if textField.text != nil
//        {
//            sendmsgBtn.isUserInteractionEnabled = true
//            sendmsgBtn.layer.opacity = 1
//
//        }
//        else
//        {
//            sendmsgBtn.isUserInteractionEnabled = false
//            sendmsgBtn.layer.opacity = 0.5
//
//        }
//
//        return true
//
//    }
//
//    func textFieldShouldReturn(_ scoreText: UITextField) -> Bool {
//        self.view.endEditing(true)
//        return true
//    }
//
//}
