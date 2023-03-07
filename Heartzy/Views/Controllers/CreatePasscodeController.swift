//
//  CreatePasscodeController.swift
//  Heartzy
//
//  Created by waseeem on 11/7/22.
//

import UIKit

class CreatePasscodeController: UIViewController {
    
    lazy var createPasstitlelbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor(named: Colors.Primary_Color)
        lbl.textAlignment = .center
        lbl.font = regular(size: 24)
        lbl.text = "Create Passcode"
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
    
    var phoneNumber = ""
    var passCode = ""
    var verificationID = ""

    
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
        view.addSubview(createPasstitlelbl)
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
        
            createPasstitlelbl.topAnchor.constraint(equalTo: view.topAnchor, constant: 150 * appConstant.heightRatio),
            createPasstitlelbl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20 * appConstant.widthRatio),
            createPasstitlelbl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20 * appConstant.widthRatio),
        
            createPassdesclbl.topAnchor.constraint(equalTo: createPasstitlelbl.bottomAnchor, constant: 20 * appConstant.heightRatio),
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
            var firstTWO = "(\(firstDigitField.text!)\(secondDigitField.text!))"
            var SecondTWO = "(\(thirdDigitField.text!)\(fourthDigitField.text!))"
            
            guard let value1 = firstDigitField.text else { return }
            guard let value2 = secondDigitField.text else { return }
            guard let value3 = thirdDigitField.text else { return }
            guard let value4 = fourthDigitField.text else { return }
           print(value1 + value2 + value3 + value4)

//            var SecondTWO = (thirdDigitField.text) + (fourthDigitField.text)
            let vc = ConfirmPasscodeController()
            vc.passCode = value1 + value2 + value3 + value4
            vc.phoneNumber = phoneNumber
            self.navigationController?.pushViewController(vc, animated: true)

        default: break
        }
    }
    

}
