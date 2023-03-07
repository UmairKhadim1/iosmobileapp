//
//  VerifyController.swift
//  Heartzy
//
//  Created by waseeem on 11/7/22.
//

import UIKit
import Firebase
import FirebaseAuth

class VerifyPhoneNumController: UIViewController {
    
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
        lbl.text = "Verify Phone"
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
        lbl.text = "Code is sent to (704) 555-0127"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var changePhoneNumBtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor.clear
        btn.setTitle("Change number", for: .normal)
        btn.clipsToBounds = true
        btn.contentEdgeInsets = UIEdgeInsets(top: 0,left: 2,bottom: 0,right: 2)
        btn.titleLabel!.adjustsFontSizeToFitWidth = true
        btn.titleLabel?.font = UIFont.appFont(ofSize: 15, weight: .regular)
        btn.setTitleColor(UIColor(named: Colors.Primary_Color), for: .normal)
        btn.layer.shadowColor = UIColor.clear.cgColor
        btn.addTarget(self, action: #selector(changeNumBtn_Press), for: .touchUpInside)
        return btn
    }()
    
    
    lazy var PhoneNumbTF : OneTimeCodeTextField = {
        let tf = OneTimeCodeTextField()
        tf.backgroundColor = .clear
        tf.textColor = .black
        tf.keyboardType = .numberPad
        tf.addToolbarInputAccessoryView(toolbarHeight: 44)
        tf.font =  UIFont.appFont(ofSize: 15, weight: .regular)
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    lazy var notRecievedtitlelbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.lightGray
        lbl.textAlignment = .left
        lbl.font = UIFont.appFont(ofSize: 15, weight: .regular)
        lbl.text = "Didn’t receive the OTP ?"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var resendotpBtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor.clear
        btn.setTitle("Resend OTP", for: .normal)
        btn.titleLabel?.font = UIFont.appFont(ofSize: 15, weight: .regular)
        btn.setTitleColor(UIColor(named: Colors.Primary_Color), for: .normal)
        btn.layer.shadowColor = UIColor.clear.cgColor
        btn.addTarget(self, action: #selector(resendotpBtn_Press), for: .touchUpInside)
        return btn
    }()
    
    
    lazy var nextBtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Verify", for: .normal)
        btn.layer.shadowRadius = 0
        btn.backgroundColor = UIColor(named: Colors.Primary_Color)
        btn.addTarget(self, action: #selector(nextBtn_press), for: .touchUpInside)
        return btn
    }()
    
    var phoneNumber = "+923075371160"
    var verificationID = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        setUPUI()
        
        phonenumdesclbl.text = "Code is sent to \(phoneNumber)"
        
        PhoneNumbTF.defaultCharacter = ""
        PhoneNumbTF.configure()
    }
    
    func setUPUI()
    {
        let margin = view.layoutMarginsGuide
        view.addSubview(phonelogoImg)
        view.addSubview(phonenumHeaderlbl)
        view.addSubview(phonenumdesclbl)
        view.addSubview(changePhoneNumBtn)
        view.addSubview(PhoneNumbTF)
        view.addSubview(notRecievedtitlelbl)
        view.addSubview(resendotpBtn)
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
            
            changePhoneNumBtn.centerYAnchor.constraint(equalTo: phonenumdesclbl.centerYAnchor, constant: 0 * appConstant.heightRatio),
            changePhoneNumBtn.leadingAnchor.constraint(equalTo: phonenumdesclbl.trailingAnchor, constant: 2 * appConstant.heightRatio),
            changePhoneNumBtn.widthAnchor.constraint(equalToConstant: 100 * appConstant.widthRatio),
//            changePhoneNumBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25 * appConstant.widthRatio),
            
            self.PhoneNumbTF.topAnchor.constraint(equalTo: self.phonenumdesclbl.bottomAnchor,constant: 45 * appConstant.heightRatio),
            self.PhoneNumbTF.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20 * appConstant.widthRatio),
            self.PhoneNumbTF.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20 * appConstant.widthRatio),
            self.PhoneNumbTF.heightAnchor.constraint(equalToConstant: 50 * appConstant.heightRatio),
            
            notRecievedtitlelbl.topAnchor.constraint(equalTo: PhoneNumbTF.bottomAnchor, constant: 16 * appConstant.heightRatio),
            notRecievedtitlelbl.leadingAnchor.constraint(equalTo: PhoneNumbTF.leadingAnchor),
            
            resendotpBtn.centerYAnchor.constraint(equalTo: notRecievedtitlelbl.centerYAnchor, constant: 0 * appConstant.heightRatio),
            resendotpBtn.leadingAnchor.constraint(equalTo: notRecievedtitlelbl.trailingAnchor, constant: 2 * appConstant.heightRatio),
//            resendotpBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -35 * appConstant.widthRatio),
            
            nextBtn.bottomAnchor.constraint(equalTo: margin.bottomAnchor, constant: -25 * appConstant.heightRatio),
            nextBtn.widthAnchor.constraint(equalToConstant: 150 * appConstant.heightRatio),
//            nextBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 21 * appConstant.widthRatio),
            nextBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -21 * appConstant.widthRatio),
            nextBtn.heightAnchor.constraint(equalToConstant: 50 * appConstant.heightRatio),
        
        ])
        
        
        
    }
    
    
    @objc func changeNumBtn_Press()
    {
        self.navigationController?.pushViewController(PhoneNumberController(), animated: true)
    }
    
    @objc func resendotpBtn_Press()
    {
        
        
        PhoneAuthProvider.provider()
            .verifyPhoneNumber(phoneNumber, uiDelegate: nil) { verificationID, error in
                if let error = error {
                    ActivityIndicator.shared.removeSpinner()

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
                    
                    
                    alertWithMsg(vc: self, msg: "Code Sended successfully", title: "Alert!")
                }
            }
        
    }
    

    @objc func nextBtn_press()
    {
        
        let valid = validate()
        if !valid.1{
            alertWithMsg(vc: self, msg: valid.0 ?? "OTP is required.", title: "Alert!")
        }else{
            
            ActivityIndicator.shared.showSpinner(onView: self.view)

            let credential = PhoneAuthProvider.provider().credential(
                withVerificationID: verificationID,
                verificationCode: PhoneNumbTF.text ?? ""
            )
            
            Auth.auth().signIn(with: credential) { authData, error in
                if error != nil
                {
                    ActivityIndicator.shared.removeSpinner()
                    alertWithMsg(vc: self, msg: "Code is Invalid", title: "Alert!")
                    print(error?.localizedDescription)
                }
                else
                {
                    
                    ActivityIndicator.shared.removeSpinner()

                    
                    guard let userID = Auth.auth().currentUser?.uid else{
                        return
                    }
                    
                    print(userID)
                    
//                    let vc = CreatePasscodeController()
//                    vc.phoneNumber = self.phoneNumber
//                    self.navigationController?.pushViewController(vc, animated: true)
                    
                    let vc = CreateProfileController()
                    vc.phoneNumber = self.phoneNumber
                    self.navigationController?.pushViewController(vc, animated: true)
                }
            }
            
        }

    }

}


extension VerifyPhoneNumController
{
    func validate() -> (String?, Bool) {
        
        let name = PhoneNumbTF.text?.trimmingCharacters(in: .whitespacesAndNewlines)
      

        if name!.count  <= 2 {
            return("OTP is required.", false)
        }
        
        return(nil,true)
    }
    
}

