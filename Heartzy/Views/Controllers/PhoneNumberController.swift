//
//  PhoneNumberController.swift
//  Heartzy
//
//  Created by waseeem on 11/7/22.
//

import UIKit
import Firebase
import FirebaseAuth

class PhoneNumberController: UIViewController {
    
    lazy var phonelogoImg : UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "phonelogoBG")
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        return iv
    }()
    
    lazy var phonenumHeaderlbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor(named: Colors.Primary_Color)
        lbl.textAlignment = .left
        lbl.font = regular(size: 24)
        lbl.text = "Enter Phone Number"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var phonenumdesclbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.lightGray
        lbl.textAlignment = .left
        lbl.font = UIFont.appFont(ofSize: 15, weight: .regular)
        lbl.text = "You will receive a 4 digit code for phone number verification."
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var phoneNumberTF : UITextField = {
        let tf = UITextField()
        tf.attributedPlaceholder = NSAttributedString(
            string: "+1(xxx)xxx-xxxx",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray ?? .systemPink])
        tf.backgroundColor = .clear
        tf.textColor = UIColor(named: Colors.Primary_Color)
        tf.font = regular(size: 15)
        tf.layer.cornerRadius = 10 * appConstant.heightRatio
        tf.keyboardType = .emailAddress
        tf.layer.borderColor = UIColor(named: Colors.Primary_Color)?.cgColor
        tf.layer.borderWidth = 1 * appConstant.heightRatio
        tf.autocorrectionType = .no
        tf.keyboardType = .numbersAndPunctuation
        tf.setPadding(left: 10, right: 10)
        tf.addToolbarInputAccessoryView(toolbarHeight: 44)
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    lazy var nextBtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Continue", for: .normal)
        btn.layer.shadowRadius = 0
        btn.backgroundColor = UIColor(named: Colors.Primary_Color)
        btn.addTarget(self, action: #selector(nextBtn_press), for: .touchUpInside)
        return btn
    }()

    var databaseRef: DatabaseReference!

    var bookList : [String] = []
    let ref = Database.database().reference().child("Users")
    
    var strings : [[String:Any]] = [[:]]
    
    var theUserData = [userData]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setUPUI()
        
        //Check First If User Exist
        checkUserExits()
    }
    
    func setUPUI()
    {
        let margin = view.layoutMarginsGuide
        view.addSubview(phonelogoImg)
        view.addSubview(phonenumHeaderlbl)
        view.addSubview(phonenumdesclbl)
        view.addSubview(phoneNumberTF)
        view.addSubview(nextBtn)

        
        NSLayoutConstraint.activate([
            
            phonelogoImg.topAnchor.constraint(equalTo: view.topAnchor, constant: 70 * appConstant.heightRatio),
            phonelogoImg.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 13 * appConstant.widthRatio),
            phonelogoImg.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -13 * appConstant.widthRatio),
            phonelogoImg.heightAnchor.constraint(equalToConstant: 277 * appConstant.heightRatio),
            
            phonenumHeaderlbl.topAnchor.constraint(equalTo: phonelogoImg.bottomAnchor, constant: 80 * appConstant.heightRatio),
            phonenumHeaderlbl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20 * appConstant.widthRatio),
            phonenumHeaderlbl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -38 * appConstant.widthRatio),
            
            phonenumdesclbl.topAnchor.constraint(equalTo: phonenumHeaderlbl.bottomAnchor, constant: 16 * appConstant.heightRatio),
            phonenumdesclbl.leadingAnchor.constraint(equalTo: phonenumHeaderlbl.leadingAnchor),
            phonenumdesclbl.trailingAnchor.constraint(equalTo: phonenumHeaderlbl.trailingAnchor),
            
            phoneNumberTF.topAnchor.constraint(equalTo: phonenumdesclbl.bottomAnchor, constant: 24 * appConstant.heightRatio),
            phoneNumberTF.leadingAnchor.constraint(equalTo: phonenumHeaderlbl.leadingAnchor),
            phoneNumberTF.trailingAnchor.constraint(equalTo: phonenumHeaderlbl.trailingAnchor),
            phoneNumberTF.heightAnchor.constraint(equalToConstant: 50 * appConstant.heightRatio),
        
            nextBtn.bottomAnchor.constraint(equalTo: margin.bottomAnchor, constant: -25 * appConstant.heightRatio),
            nextBtn.widthAnchor.constraint(equalToConstant: 150 * appConstant.heightRatio),
//            nextBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 21 * appConstant.widthRatio),
            nextBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -21 * appConstant.widthRatio),
            nextBtn.heightAnchor.constraint(equalToConstant: 50 * appConstant.heightRatio),
        ])
        
    }
    
    @objc func nextBtn_press()
    {
        
        
        
        let valid = validate()
        if !valid.1{
            alertWithMsg(vc: self, msg: valid.0 ?? "Phone number is required.", title: "Alert!")
        }else{
            
            ActivityIndicator.shared.showSpinner(onView: self.view)
            
//            Auth.auth().settings?.isAppVerificationDisabledForTesting = true
            
            // set this to remove reCaptcha web
//            Auth.auth().settings?.isAppVerificationDisabledForTesting = true

            Auth.auth().settings?.isAppVerificationDisabledForTesting = false
            
            var theNumber = ""
          
            if phoneNumberTF.text.hasPrefix(["+"])
            {
                print(phoneNumberTF.text.hasPrefix(["+"]))
                theNumber = phoneNumberTF.text ?? ""
            }
            else
            {
                print(phoneNumberTF.text.hasPrefix(["+"]))
                theNumber = "+\(phoneNumberTF.text ?? "")"
            }
            

            PhoneAuthProvider.provider()
                .verifyPhoneNumber(theNumber, uiDelegate: nil) { verificationID, error in
                    if let error = error {
                        ActivityIndicator.shared.removeSpinner()
                        alertWithMsg(vc: self, msg: error.localizedDescription, title: "Alert!")
                        print(error.localizedDescription)
                        return
                    }
                    else
                    {
                        ActivityIndicator.shared.removeSpinner()

                        // Sign in using the verificationID and the code sent to the user
                        // ...
                        
                        // Change language code to English.
                        Auth.auth().languageCode = "en";
                        UserDefaults.standard.set(verificationID, forKey: "authVerificationID")
                        
                        
                        let verificationID = UserDefaults.standard.string(forKey: "authVerificationID")
                        
                            let vc = VerifyPhoneNumController()
                            vc.phoneNumber = self.phoneNumberTF.text ?? ""
                            vc.verificationID = verificationID ?? ""
                            self.navigationController?.pushViewController(vc, animated: true)

                    }
                    
                }
            
        }
    
    }
    
    
    func checkUserExits()
    {
        
        print("The data of all user\(strings)")
        databaseRef = Database.database().reference()

        databaseRef.child("users").queryOrderedByKey().observe(.childAdded, with: { (snapshot) in
         if let dictionary = snapshot.value as? [String : Any] {
            do {
                self.strings.append(dictionary)
                print("The data of all user\(self.strings)")
                var thedta = userData(id: dictionary["id"] as? String, contacts: dictionary["contacts"] as? String, password: dictionary["password"] as? String, name: dictionary["name"] as? String, image: dictionary["image"] as? String)
                self.theUserData.append(thedta)
                
            }
        }

    })
        
    }
    

}



extension PhoneNumberController
{
    func validate() -> (String?, Bool) {
        
        let name = phoneNumberTF.text?.trimmingCharacters(in: .whitespacesAndNewlines)
      

        if name!.count  <= 2 {
            return("Phone number is required.", false)
        }
        
        return(nil,true)
    }
    
}


extension Optional where Wrapped: StringProtocol {
    func hasPrefix(_ ss: [String]) -> Bool {
        guard let s = self else { return false }
        return ss.first(where: s.hasPrefix) != nil
    }
}
