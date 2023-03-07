//
//  RequestForAccountDelController.swift
//  Heartzy
//
//  Created by waseeem on 2/3/23.
//

import UIKit

class RequestForAccountDelController: UIViewController {
    
    lazy var headerView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: Colors.header_Color)
//        view.layer.cornerRadius  = 36 * appConstant.heightRatio
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
    
    lazy var exitTitlelbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor(named: Colors.Primary_Color)
        lbl.textAlignment = .center
        lbl.font = UIFont.appFont(ofSize: 18, weight: .semibold)
        lbl.text = "Request For Account Deletion"
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var createPasstitlelbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor(named: Colors.Primary_Color)
        lbl.textAlignment = .center
        lbl.font = regular(size: 24)
        lbl.text = "Submit Your Detail's"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var NameHeaderlbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor(named: Colors.Primary_Color)
        lbl.textAlignment = .left
        lbl.font = regular(size: 24)
        lbl.text = "Enter Your Name"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var NameTF : UITextField = {
        let tf = UITextField()
        tf.attributedPlaceholder = NSAttributedString(
            string: "Enter Name",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray ?? .systemPink])
        tf.backgroundColor = .clear
        tf.textColor = UIColor(named: Colors.Primary_Color)
        tf.font = regular(size: 15)
        tf.layer.cornerRadius = 10 * appConstant.heightRatio
//        tf.keyboardType = .emailAddress
        tf.layer.borderColor = UIColor(named: Colors.Primary_Color)?.cgColor
        tf.layer.borderWidth = 1 * appConstant.heightRatio
        tf.autocorrectionType = .no
        tf.keyboardType = .numbersAndPunctuation
        tf.setPadding(left: 10, right: 10)
        tf.addToolbarInputAccessoryView(toolbarHeight: 44)
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
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
        btn.setTitle("Submit", for: .normal)
        btn.layer.shadowRadius = 0
        btn.backgroundColor = UIColor(named: Colors.Primary_Color)
        btn.addTarget(self, action: #selector(nextBtn_press), for: .touchUpInside)
        return btn
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        setUPUI()

    }
    
    func setUPUI()
    {
        view.addSubview(headerView)
        headerView.addSubview(backBtn)
        headerView.addSubview(exitTitlelbl)
        view.addSubview(createPasstitlelbl)
        view.addSubview(NameHeaderlbl)
        view.addSubview(NameTF)
        view.addSubview(phonenumHeaderlbl)
        view.addSubview(phoneNumberTF)
        view.addSubview(nextBtn)
        
        NSLayoutConstraint.activate([
            
            headerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0 * appConstant.heightRatio),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0 * appConstant.widthRatio),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -0 * appConstant.widthRatio),
            headerView.heightAnchor.constraint(equalToConstant: 120 * appConstant.heightRatio),
            
            backBtn.centerYAnchor.constraint(equalTo: headerView.centerYAnchor, constant: 0 * appConstant.heightRatio),
            backBtn.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            backBtn.heightAnchor.constraint(equalToConstant: 46 * appConstant.heightRatio),
            backBtn.widthAnchor.constraint(equalToConstant: 46 * appConstant.heightRatio),
            
            exitTitlelbl.centerYAnchor.constraint(equalTo: headerView.centerYAnchor, constant: 0 * appConstant.heightRatio),
            exitTitlelbl.centerXAnchor.constraint(equalTo: headerView.centerXAnchor, constant: 0 * appConstant.heightRatio),
            exitTitlelbl.leadingAnchor.constraint(equalTo: backBtn.trailingAnchor, constant: 12 * appConstant.heightRatio),
            exitTitlelbl.centerYAnchor.constraint(equalTo: backBtn.centerYAnchor, constant: 0 * appConstant.heightRatio),
            
            
            createPasstitlelbl.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 30 * appConstant.heightRatio),
            createPasstitlelbl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20 * appConstant.widthRatio),
            createPasstitlelbl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20 * appConstant.widthRatio),
            
            
            
            NameHeaderlbl.topAnchor.constraint(equalTo: createPasstitlelbl.bottomAnchor, constant: 60 * appConstant.heightRatio),
            NameHeaderlbl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20 * appConstant.widthRatio),
            NameHeaderlbl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20 * appConstant.widthRatio),
            
            
            NameTF.topAnchor.constraint(equalTo: NameHeaderlbl.bottomAnchor, constant: 2 * appConstant.heightRatio),
            NameTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20 * appConstant.widthRatio),
            NameTF.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20 * appConstant.widthRatio),
            NameTF.heightAnchor.constraint(equalToConstant: 50 * appConstant.heightRatio),
            
            
            phonenumHeaderlbl.topAnchor.constraint(equalTo: NameTF.bottomAnchor, constant: 20 * appConstant.heightRatio),
            phonenumHeaderlbl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20 * appConstant.widthRatio),
            phonenumHeaderlbl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20 * appConstant.widthRatio),
            
            
            phoneNumberTF.topAnchor.constraint(equalTo: phonenumHeaderlbl.bottomAnchor, constant: 2 * appConstant.heightRatio),
            phoneNumberTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20 * appConstant.widthRatio),
            phoneNumberTF.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20 * appConstant.widthRatio),
            phoneNumberTF.heightAnchor.constraint(equalToConstant: 50 * appConstant.heightRatio),
            
            
            
            nextBtn.topAnchor.constraint(equalTo: phoneNumberTF.bottomAnchor, constant: 30 * appConstant.heightRatio),
            nextBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 80 * appConstant.widthRatio),
            nextBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -80 * appConstant.widthRatio),
            nextBtn.heightAnchor.constraint(equalToConstant: 60 * appConstant.heightRatio),
            
        ])
    
}

    
    @objc func backBtn_Press()
    {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func nextBtn_press()
    {
        ActivityIndicator.shared.showSpinner(onView: self.view)

        let valid = validate()
        if !valid.1{
            ActivityIndicator.shared.removeSpinner()
            alertWithMsg(vc: self, msg: valid.0 ?? "Name is required.", title: "Alert!")
        }else{
            
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4)
            {
                ActivityIndicator.shared.removeSpinner()
                let alert = UIAlertController(title: "Alert!", message: "Your Delete Account Request Submited...",         preferredStyle: UIAlertController.Style.alert)
                
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { _ in
                    //Cancel Action
                    
                    self.navigationController?.popViewController(animated: true)
                    
                    
                }))
                //    alert.addAction(UIAlertAction(title: title,
                //                                  style: UIAlertAction.Style.default,
                //                                  handler: {(_: UIAlertAction!) in
                //                                    //Sign out action
                //   }))
                self.present(alert, animated: true, completion: nil)
            }
            
        }
    }
    
}


extension RequestForAccountDelController
{
    func validate() -> (String?, Bool) {
        
        let name = NameTF.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let phone = phoneNumberTF.text?.trimmingCharacters(in: .whitespacesAndNewlines)

        if name!.count  <= 2 {
            return("Name is required.", false)
        }
        
        if phone!.count  <= 2 {
            return("Phone Number is required.", false)
        }
        
        return(nil,true)
    }
    
}

