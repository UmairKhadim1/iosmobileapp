//
//  ConfirmNewPasscodeController.swift
//  Heartzy
//
//  Created by waseeem on 11/11/22.
//

import UIKit
import FirebaseAuth
import Firebase


class ConfirmNewPasscodeController: UIViewController {
    
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
    
    lazy var resetTitlelbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor(named: Colors.Primary_Color)
        lbl.textAlignment = .center
        lbl.font = UIFont.appFont(ofSize: 24, weight: .semibold)
        lbl.text = "Reset Passcode"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()

    lazy var confirmnewPasstitlelbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor(named: Colors.Primary_Color)
        lbl.textAlignment = .center
        lbl.font = regular(size: 32)
        lbl.text = "Confirm New Passcode"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var createPassdesclbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.lightGray
        lbl.textAlignment = .center
        lbl.font = UIFont.appFont(ofSize: 15, weight: .regular)
        lbl.text = "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint."
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    
    lazy var StackView: UIStackView = {
        let horizontalStackView = UIStackView()
        horizontalStackView.backgroundColor = .clear
        horizontalStackView.axis = .horizontal
        horizontalStackView.alignment = .fill
        horizontalStackView.distribution = .equalSpacing
        horizontalStackView.spacing = 8
        horizontalStackView.translatesAutoresizingMaskIntoConstraints = false
        return horizontalStackView
    }()
    
    
    lazy var firstDigitField : SingleDigitField = {
        let tf = SingleDigitField()
        tf.backgroundColor = .clear
        tf.textColor = UIColor(named: Colors.header_Color)
        tf.keyboardType = .numberPad
        tf.isSecureTextEntry = true
        tf.addToolbarInputAccessoryView(toolbarHeight: 44)
        tf.font =  UIFont.appFont(ofSize: 55, weight: .regular)
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    lazy var secondDigitField : SingleDigitField = {
        let tf = SingleDigitField()
        tf.backgroundColor = .clear
        tf.textColor = UIColor(named: Colors.header_Color)
        tf.keyboardType = .numberPad
        tf.isSecureTextEntry = true
        tf.addToolbarInputAccessoryView(toolbarHeight: 44)
        tf.font =  UIFont.appFont(ofSize: 55, weight: .regular)
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    lazy var thirdDigitField : SingleDigitField = {
        let tf = SingleDigitField()
        tf.backgroundColor = .clear
        tf.textColor = UIColor(named: Colors.header_Color)
        tf.keyboardType = .numberPad
        tf.isSecureTextEntry = true
        tf.addToolbarInputAccessoryView(toolbarHeight: 44)
        tf.font =  UIFont.appFont(ofSize: 55, weight: .regular)
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    lazy var fourthDigitField : SingleDigitField = {
        let tf = SingleDigitField()
        tf.backgroundColor = .clear
        tf.textColor = UIColor(named: Colors.header_Color)
        tf.keyboardType = .numberPad
        tf.isSecureTextEntry = true
        tf.addToolbarInputAccessoryView(toolbarHeight: 44)
        tf.font =  UIFont.appFont(ofSize: 55, weight: .regular)
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()

    var passCode = ""
    var theData = [String : Any]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        firstDigitField.layer.cornerRadius = 15 * appConstant.heightRatio
        firstDigitField.layer.borderWidth = 1.0
        firstDigitField.layer.borderColor = UIColor.red.cgColor
        firstDigitField.clipsToBounds = true
        
        secondDigitField.layer.cornerRadius = 15 * appConstant.heightRatio
        secondDigitField.layer.borderWidth = 1.0
        secondDigitField.layer.borderColor = UIColor.red.cgColor
        secondDigitField.clipsToBounds = true
        
        thirdDigitField.layer.cornerRadius = 15 * appConstant.heightRatio
        thirdDigitField.layer.borderWidth = 1.0
        thirdDigitField.layer.borderColor = UIColor.red.cgColor
        thirdDigitField.clipsToBounds = true
        
        
        fourthDigitField.layer.cornerRadius = 15 * appConstant.heightRatio
        fourthDigitField.layer.borderWidth = 1.0
        fourthDigitField.layer.borderColor = UIColor.red.cgColor
        fourthDigitField.clipsToBounds = true

        view.backgroundColor = .white
        setUPUI()

        [firstDigitField, secondDigitField, thirdDigitField, fourthDigitField].forEach {
            $0?.addTarget(self, action: #selector(editingChanged), for: .editingChanged)
        }
        firstDigitField.isUserInteractionEnabled = true
        firstDigitField.becomeFirstResponder()
    }
  
    
    func setUPUI()
    {
        view.addSubview(headerView)
        headerView.addSubview(backBtn)
        headerView.addSubview(resetTitlelbl)
        view.addSubview(confirmnewPasstitlelbl)
        view.addSubview(createPassdesclbl)
        view.addSubview(StackView)
        StackView.addArrangedSubview(firstDigitField)
        StackView.addArrangedSubview(secondDigitField)
        StackView.addArrangedSubview(thirdDigitField)
        StackView.addArrangedSubview(fourthDigitField)
        StackView.addSubview(firstDigitField)
        StackView.addSubview(secondDigitField)
        StackView.addSubview(thirdDigitField)
        StackView.addSubview(fourthDigitField)

        
        NSLayoutConstraint.activate([
            
            headerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0 * appConstant.heightRatio),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0 * appConstant.widthRatio),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -0 * appConstant.widthRatio),
            headerView.heightAnchor.constraint(equalToConstant: 120 * appConstant.heightRatio),
            
            backBtn.centerYAnchor.constraint(equalTo: headerView.centerYAnchor, constant: 0 * appConstant.heightRatio),
            backBtn.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            backBtn.heightAnchor.constraint(equalToConstant: 46 * appConstant.heightRatio),
            backBtn.widthAnchor.constraint(equalToConstant: 46 * appConstant.heightRatio),
            
            resetTitlelbl.centerYAnchor.constraint(equalTo: headerView.centerYAnchor, constant: 0 * appConstant.heightRatio),
            resetTitlelbl.centerXAnchor.constraint(equalTo: headerView.centerXAnchor, constant: 0 * appConstant.heightRatio),
            resetTitlelbl.leadingAnchor.constraint(equalTo: backBtn.trailingAnchor, constant: 12 * appConstant.heightRatio),
            resetTitlelbl.centerYAnchor.constraint(equalTo: backBtn.centerYAnchor, constant: 0 * appConstant.heightRatio),
        
            confirmnewPasstitlelbl.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 76 * appConstant.heightRatio),
            confirmnewPasstitlelbl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20 * appConstant.widthRatio),
            confirmnewPasstitlelbl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20 * appConstant.widthRatio),
        
            createPassdesclbl.topAnchor.constraint(equalTo: confirmnewPasstitlelbl.bottomAnchor, constant: 20 * appConstant.heightRatio),
            createPassdesclbl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12 * appConstant.widthRatio),
            createPassdesclbl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20 * appConstant.widthRatio),
            
            
            firstDigitField.heightAnchor.constraint(equalToConstant: 30 * appConstant.heightRatio),
            firstDigitField.widthAnchor.constraint(equalToConstant: 30 * appConstant.heightRatio),

            secondDigitField.heightAnchor.constraint(equalToConstant: 30 * appConstant.heightRatio),
            secondDigitField.widthAnchor.constraint(equalToConstant: 30 * appConstant.heightRatio),
            
            thirdDigitField.heightAnchor.constraint(equalToConstant: 30 * appConstant.heightRatio),
            thirdDigitField.widthAnchor.constraint(equalToConstant: 30 * appConstant.heightRatio),
            
            fourthDigitField.heightAnchor.constraint(equalToConstant: 30 * appConstant.heightRatio),
            fourthDigitField.widthAnchor.constraint(equalToConstant: 30 * appConstant.heightRatio),
            
            self.StackView.topAnchor.constraint(equalTo: self.createPassdesclbl.bottomAnchor,constant: 45 * appConstant.heightRatio),
            self.StackView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 70 * appConstant.widthRatio),
            self.StackView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -70 * appConstant.widthRatio),
            self.StackView.heightAnchor.constraint(equalToConstant: 30 * appConstant.heightRatio),
            
        ])
        
        
    }
    
    @objc func editingChanged(_ textField: SingleDigitField) {
        if textField.pressedDelete {
            textField.pressedDelete = false
            if textField.hasText {
                textField.text = ""
            } else {
                switch textField {
                case secondDigitField, thirdDigitField, fourthDigitField:
                    textField.resignFirstResponder()
                    textField.isUserInteractionEnabled = false
                    switch textField {
                    case secondDigitField:
                        firstDigitField.isUserInteractionEnabled = true
                        firstDigitField.becomeFirstResponder()
                        firstDigitField.text = ""
                    case thirdDigitField:
                        secondDigitField.isUserInteractionEnabled = true
                        secondDigitField.becomeFirstResponder()
                        secondDigitField.text = ""
                    case fourthDigitField:
                        thirdDigitField.isUserInteractionEnabled = true
                        thirdDigitField.becomeFirstResponder()
                        thirdDigitField.text = ""
                    default:
                        break
                    }
                default: break
                }
            }
        }

        guard textField.text?.count == 1, textField.text?.last?.isWholeNumber == true else {
            textField.text = ""
            return
        }
        switch textField {
        case firstDigitField, secondDigitField, thirdDigitField:
            textField.resignFirstResponder()
            textField.isUserInteractionEnabled = false
            switch textField {
            case firstDigitField:
                secondDigitField.isUserInteractionEnabled = true
                secondDigitField.becomeFirstResponder()
            case secondDigitField:
                thirdDigitField.isUserInteractionEnabled = true
                thirdDigitField.becomeFirstResponder()
            case thirdDigitField:
                fourthDigitField.isUserInteractionEnabled = true
                fourthDigitField.becomeFirstResponder()
            default: break
            }
        case fourthDigitField:
            fourthDigitField.resignFirstResponder()
            guard let value1 = firstDigitField.text else { return }
            guard let value2 = secondDigitField.text else { return }
            guard let value3 = thirdDigitField.text else { return }
            guard let value4 = fourthDigitField.text else { return }
           print(value1 + value2 + value3 + value4)
            
            let confirmPasscoode = value1 + value2 + value3 + value4
            
            if confirmPasscoode == passCode
            {
                
                updateUserPasscode()
    
            }
            else
            {
                fourthDigitField.becomeFirstResponder()
                alertWithMsg(vc: self, msg: "Passcode Doesn't Match Each Other", title: "Alert!")
            }
        default: break
        }
    }
    
    @objc func backBtn_Press()
    {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    func updateUserPasscode()
    {
                    
        ActivityIndicator.shared.showSpinner(onView: self.view)
        
        let val = ["name":self.theData["name"] as? String,"contact": self.theData["contact"] as? String,"image":self.theData["image"] as? String,"id":self.theData["id"] as? String,"password":self.passCode ]
                        
        self.regUserIntoDatabase(uid: self.theData["id"] as? String ?? "", values: val as? [String : Any] ?? [:])
                        
        
    }
    
    private func regUserIntoDatabase(uid: String, values: [String: Any])
    {

        let ref = Database.database().reference()
        let userRef = ref.child("users").child(uid)
        userRef.updateChildValues(values, withCompletionBlock: {(err, ref) in

            ActivityIndicator.shared.removeSpinner()

            if err != nil {
                ActivityIndicator.shared.removeSpinner()
                print(err!)
                return
            }
            else {
                ActivityIndicator.shared.removeSpinner()
                print("DONE")
                let vc = MessagesViewController()
                let rootNC = UINavigationController(rootViewController: vc)
                rootNC.navigationBar.isHidden = true
                UIApplication.shared.windows.first?.rootViewController = rootNC
                UIApplication.shared.windows.first?.makeKeyAndVisible()
            }
        })
    }

}
