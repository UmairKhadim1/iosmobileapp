//
//  SettingController.swift
//  Heartzy
//
//  Created by waseeem on 11/8/22.
//

import UIKit
import Firebase
import FirebaseAuth
import WebKit


class SettingController: UIViewController, WKNavigationDelegate {
    
    var gradient = CAGradientLayer()
    
    lazy var headerView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: Colors.header_Color)
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.25
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        view.layer.shadowRadius = 5 * appConstant.heightRatio
        view.clipsToBounds = false
//        view.layer.maskedCorners = [.layerMinXMaxYCorner,.layerMaxXMaxYCorner]
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var backBtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor.clear
        btn.layer.cornerRadius = 15 * appConstant.heightRatio
        btn.layer.shadowOpacity = 0.5
        btn.layer.shadowColor = UIColor.clear.cgColor
        btn.contentMode = .scaleToFill
        btn.setImage(UIImage(named: "backBtnIcon"), for: .normal)
        btn.clipsToBounds = true
        btn.tintColor = UIColor(named: Colors.Primary_Color)
        btn.addTarget(self, action: #selector(backBtn_Press), for: .touchUpInside)
        return btn
    }()
    
    lazy var settingTitlelbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor(named: Colors.Primary_Color)
        lbl.textAlignment = .center
        lbl.font = UIFont.appFont(ofSize: 24, weight: .semibold)
        lbl.text = "Settings"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    
    lazy var PerimgView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.clear
        view.clipsToBounds = true
        view.layer.borderColor = UIColor(named: Colors.Primary_Color)?.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 49 * appConstant.heightRatio
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var Perimg : UIImageView = {
        let iv = UIImageView()
        iv.layer.cornerRadius = 12
        iv.backgroundColor = .clear
        iv.image = UIImage(named: "MaskIcon")
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()

    lazy var PerimgBtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor.clear
        btn.layer.cornerRadius = 15 * appConstant.heightRatio
        btn.layer.shadowOpacity = 0.5
        btn.layer.shadowColor = UIColor.clear.cgColor
        btn.contentMode = .scaleToFill
        btn.setImage(UIImage(named: "MaskEdit"), for: .normal)
        btn.clipsToBounds = true
        btn.isHidden = true
        btn.tintColor = UIColor(named: Colors.Primary_Color)
        btn.addTarget(self, action: #selector(PerimgBtn_press), for: .touchUpInside)
        return btn
    }()
    
    lazy var namelbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor(named: Colors.Primary_Color)
        lbl.textAlignment = .center
        lbl.font = UIFont.appFont(ofSize: 18 * appConstant.heightRatio)
        lbl.text = "Alberto Raya"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var editBtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor.clear
        btn.layer.cornerRadius = 15 * appConstant.heightRatio
        btn.layer.shadowOpacity = 0.5
        btn.layer.shadowColor = UIColor.clear.cgColor
        btn.contentMode = .scaleAspectFill
        btn.setImage(UIImage(named: "editIcon"), for: .normal)
        btn.tintColor = UIColor(named: Colors.Primary_Color)
        btn.clipsToBounds = true
        btn.tintColor = UIColor(named: Colors.Primary_Color)
        btn.addTarget(self, action: #selector(update_Profile), for: .touchUpInside)
        return btn
    }()
    
    
    lazy var DataTableview : UITableView = {
        let tv = UITableView()
        tv.showsVerticalScrollIndicator = false
        tv.backgroundColor = UIColor.white
        tv.layer.cornerRadius = 18 * appConstant.heightRatio
        tv.clipsToBounds = true
        tv.separatorStyle = .none
        tv.separatorStyle = .none
        tv.isScrollEnabled = true
        tv.isUserInteractionEnabled = true
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    lazy var VideotopLogo : WKWebView = {
        var img  = WKWebView()
//        img.image = UIImage(named: "uploadvideoIcon")
//        img.layer.cornerRadius = 8 * appConstant.heightRatio
        img.clipsToBounds = true
        img.isHidden = true
        img.contentMode = .scaleAspectFill
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
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
    
    lazy var popUP:InfoPopUpView = {
        var view = InfoPopUpView()
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
    
    
    //For Showing Credentails of Exit_PopUp
    lazy var ExitshadowView : UIView = {
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
    
    lazy var ExitpopUP:ExitPopUPView = {
        var view = ExitPopUPView()
        view.clipsToBounds = false
        view.layer.cornerRadius  = 20 * appConstant.heightRatio
        return view
    }()
    
    lazy var ExitblurView : UIVisualEffectView = {
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
    
    var imagePicker = UIImagePickerController() // instantiates an image picker controller.
    
    let dataArray = ["Background","Themes","Bot Icons","How to?","Exit","Delete Account"]
    
    let imgArray = ["Templates","Themes","BotIcons","eye","exit","delete"]

    var theData = [String : Any]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        popUP.cancelBtn.addTarget(self, action: #selector(hidePopUp), for: .touchUpInside)
        
        ExitpopUP.cancelBtn.addTarget(self, action: #selector(ExithidePopUp), for: .touchUpInside)

        
        DataTableview.delegate = self
        DataTableview.dataSource = self
        DataTableview.register(SettingTVCell.self, forCellReuseIdentifier: SettingTVCell.cellidentifier)
        
        view.backgroundColor = .white
        setUPUI()
        
        getdata()
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        changingBackground()
    }
    
    func setUPUI()
    {
        view.addSubview(headerView)
        headerView.addSubview(backBtn)
        headerView.addSubview(settingTitlelbl)
        view.addSubview(PerimgView)
        PerimgView.addSubview(Perimg)
        view.addSubview(PerimgBtn)
        view.addSubview(namelbl)
        view.addSubview(VideotopLogo)
        view.addSubview(editBtn)
        view.addSubview(DataTableview)
        view.addSubview(blurView)
        view.addSubview(shadowView)
        shadowView.addSubview(popUP)
        view.addSubview(ExitblurView)
        view.addSubview(ExitshadowView)
        ExitshadowView.addSubview(ExitpopUP)

        
        NSLayoutConstraint.activate([
            
            //Header Constraints
            headerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0 * appConstant.heightRatio),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0 * appConstant.widthRatio),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -0 * appConstant.widthRatio),
            headerView.heightAnchor.constraint(equalToConstant: 120 * appConstant.heightRatio),
            
            backBtn.centerYAnchor.constraint(equalTo: headerView.centerYAnchor, constant: 0 * appConstant.heightRatio),
            backBtn.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            backBtn.heightAnchor.constraint(equalToConstant: 46 * appConstant.heightRatio),
            backBtn.widthAnchor.constraint(equalToConstant: 46 * appConstant.heightRatio),
            
            settingTitlelbl.centerYAnchor.constraint(equalTo: headerView.centerYAnchor, constant: 0 * appConstant.heightRatio),
            settingTitlelbl.centerXAnchor.constraint(equalTo: headerView.centerXAnchor, constant: 0 * appConstant.heightRatio),
            settingTitlelbl.leadingAnchor.constraint(equalTo: backBtn.trailingAnchor, constant: 12 * appConstant.heightRatio),
            settingTitlelbl.centerYAnchor.constraint(equalTo: backBtn.centerYAnchor, constant: 0 * appConstant.heightRatio),
            
            PerimgView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 20 * appConstant.heightRatio),
            PerimgView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0 * appConstant.heightRatio),
            PerimgView.heightAnchor.constraint(equalToConstant: 98 * appConstant.heightRatio),
            PerimgView.widthAnchor.constraint(equalToConstant: 98 * appConstant.heightRatio),
            
            Perimg.topAnchor.constraint(equalTo: PerimgView.topAnchor, constant: 0 * appConstant.heightRatio),
            Perimg.leadingAnchor.constraint(equalTo: PerimgView.leadingAnchor,constant: 0 * appConstant.widthRatio),
            Perimg.trailingAnchor.constraint(equalTo: PerimgView.trailingAnchor,constant: 0 * appConstant.widthRatio),
            Perimg.bottomAnchor.constraint(equalTo: PerimgView.bottomAnchor, constant: 0 * appConstant.heightRatio),
            
            PerimgBtn.centerYAnchor.constraint(equalTo: PerimgView.centerYAnchor, constant: 28 * appConstant.heightRatio),
            PerimgBtn.centerXAnchor.constraint(equalTo: PerimgView.trailingAnchor,constant: -7 * appConstant.widthRatio),
            PerimgBtn.heightAnchor.constraint(equalToConstant: 24 * appConstant.heightRatio),
            PerimgBtn.widthAnchor.constraint(equalToConstant: 24 * appConstant.heightRatio),
            
            namelbl.topAnchor.constraint(equalTo: PerimgView.bottomAnchor, constant: 20 * appConstant.heightRatio),
            namelbl.centerXAnchor.constraint(equalTo: PerimgView.centerXAnchor, constant: 0 * appConstant.heightRatio),
            
            editBtn.centerYAnchor.constraint(equalTo: namelbl.centerYAnchor, constant: 0 * appConstant.heightRatio),
            editBtn.leadingAnchor.constraint(equalTo: namelbl.trailingAnchor, constant: 4 * appConstant.heightRatio),
            editBtn.heightAnchor.constraint(equalToConstant: 24 * appConstant.heightRatio),
            editBtn.widthAnchor.constraint(equalToConstant: 24 * appConstant.heightRatio),
            
            
            DataTableview.topAnchor.constraint(equalTo: self.namelbl.bottomAnchor, constant: 10 * appConstant.heightRatio),
            DataTableview.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10 * appConstant.widthRatio),
            DataTableview.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10 * appConstant.widthRatio),
            DataTableview.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50 * appConstant.widthRatio),
            
            
            VideotopLogo.topAnchor.constraint(equalTo: self.namelbl.bottomAnchor, constant: 10 * appConstant.heightRatio),
            VideotopLogo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0 * appConstant.widthRatio),
            VideotopLogo.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0 * appConstant.widthRatio),
            VideotopLogo.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0 * appConstant.heightRatio),
            
            
            blurView.topAnchor.constraint(equalTo: view.topAnchor),
            blurView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            blurView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            blurView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            
            shadowView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            shadowView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            shadowView.heightAnchor.constraint(equalToConstant: 420 * appConstant.heightRatio),
            shadowView.widthAnchor.constraint(equalToConstant: 288 * appConstant.widthRatio),
            
            popUP.topAnchor.constraint(equalTo: shadowView.topAnchor),
            popUP.leadingAnchor.constraint(equalTo: shadowView.leadingAnchor),
            popUP.trailingAnchor.constraint(equalTo: shadowView.trailingAnchor),
            popUP.bottomAnchor.constraint(equalTo: shadowView.bottomAnchor),
            
            
            ExitblurView.topAnchor.constraint(equalTo: view.topAnchor),
            ExitblurView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            ExitblurView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            ExitblurView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            
            ExitshadowView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            ExitshadowView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            ExitshadowView.heightAnchor.constraint(equalToConstant: 420 * appConstant.heightRatio),
            ExitshadowView.widthAnchor.constraint(equalToConstant: 288 * appConstant.widthRatio),
            
            ExitpopUP.topAnchor.constraint(equalTo: ExitshadowView.topAnchor),
            ExitpopUP.leadingAnchor.constraint(equalTo: ExitshadowView.leadingAnchor),
            ExitpopUP.trailingAnchor.constraint(equalTo: ExitshadowView.trailingAnchor),
            ExitpopUP.bottomAnchor.constraint(equalTo: ExitshadowView.bottomAnchor),
            

        ])
        
    }

    
    
    func changingBackground()
    {
        if AppUserDefault.shared.color1 == true
        {
            Colors.Primary_Color = "Purple"
//            headerView.backgroundColor = UIColor(named: Colors.Primary_Color)
        }
        else if AppUserDefault.shared.color2 == true
        {
            Colors.Primary_Color = "PrimaryColor"
//            headerView.backgroundColor = UIColor(named: Colors.Primary_Color)

        }
        else if AppUserDefault.shared.color3 == true
        {
            Colors.Primary_Color = "Blue"
//            headerView.backgroundColor = UIColor(named: Colors.Primary_Color)

        }
        else if AppUserDefault.shared.color4 == true
        {
            Colors.Primary_Color = "Yellow"
//            headerView.backgroundColor = UIColor(named: Colors.Primary_Color)

        }
        else if AppUserDefault.shared.color5 == true
        {
            Colors.Primary_Color = "Green"
//            headerView.backgroundColor = UIColor(named: Colors.Primary_Color)

        }
        
    }
    
    func getdata()
    {
        let ref = Database.database().reference()
        guard let uid = Auth.auth().currentUser?.uid else {
            print("User Not Found")
            return
        }
        ref.child("users").child(uid).observe(.value, with: { (snapshot) in
            if let dictionary = snapshot.value as? [String : Any] {
                userDefaults.set(dictionary, forKey: "myKey")
                print("The Name of User is",dictionary["name"] as? String)
                self.theData = dictionary as [String : Any]
                self.namelbl.text = dictionary["name"] as? String
                self.Perimg.setImageFrom(dictionary["image"] as? String ?? "")
                print("The User is",dictionary)
            }
        }) { (error) in
             guard error == nil else{
                               return
                           }
        }
    }
    
    @objc func backBtn_Press()
    {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func update_Profile()
    {
        let vc = UpdateProfileController()
        vc.theData = theData
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func PerimgBtn_press()
    {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
          imagePicker.delegate = self
          imagePicker.sourceType = .photoLibrary
          imagePicker.allowsEditing = false

          present(imagePicker, animated: true, completion: nil)
          }
    }
    
    @objc func hidePopUp()
    {
        self.shadowView.isHidden = true
        
        self.blurView.isHidden = true
    }
    
    @objc func ExithidePopUp()
    {
        self.ExitshadowView.isHidden = true
        
        self.ExitblurView.isHidden = true
    }

}


extension SettingController : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // MARK: - ImagePicker Delegate

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
           picker.dismiss(animated: true, completion: nil)
           if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
               Perimg.image = image

           //    let imageURL = info[UIImagePickerController.InfoKey.referenceURL] as! NSURL
               imageName1 = image
               if let url = info[UIImagePickerController.InfoKey.imageURL] as? URL {
                       editimagenameof = url.lastPathComponent
                     //  fileType = url.pathExtension
                   }
               
           }

       }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion:nil)
    }
    
}


extension SettingController :  UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        let cell = DataTableview.dequeueReusableCell(withIdentifier: SettingTVCell.cellidentifier, for: indexPath) as! SettingTVCell
            
        cell.itemtext.text = dataArray[indexPath.row]
        cell.itemImg.image = UIImage(named: imgArray[indexPath.row])
       
        return cell
            
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0
        {
            self.navigationController?.pushViewController(BackGroundTempController(), animated: true)
        }
        else if indexPath.row == 1
        {
            self.navigationController?.pushViewController(ChatThemeController(), animated: true)
        }
        else if indexPath.row == 2
        {
            self.navigationController?.pushViewController(BotIconController(), animated: true)
        }
        else if indexPath.row == 3
        {
//            self.shadowView.isHidden = false
//            self.blurView.isHidden = false
            let vc = HowToLockController()
            vc.isFromSetting = true
            self.present(vc, animated: true)
        }
        else if indexPath.row == 4
        {
//            AppUserDefault.shared.isLogin = false
            
            self.ExitshadowView.isHidden = false
            self.ExitblurView.isHidden = false

//            let vc = TestController()
//            self.navigationController?.pushViewController(vc, animated: true)
            
        }
        else if indexPath.row == 5
        {
            let vc = RequestForAccountDelController()
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
        
        //            let settings = URL(string: "App-prefs:ACCESSIBILITY&path=GUIDED_ACCESS_TITLE/GuidedAccessSecurityLinkList")
        //            UIApplication.shared.open(settings!, options: [UIApplication.OpenExternalURLOptionsKey.universalLinksOnly : false])
                    
            
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
}
