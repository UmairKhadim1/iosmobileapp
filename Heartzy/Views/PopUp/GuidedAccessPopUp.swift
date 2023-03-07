//
//  GuidedAccessPopUp.swift
//  Heartzy
//
//  Created by waseeem on 12/9/22.
//

import Foundation
import UIKit

class GuidedAccessPopUp: UIView {

    lazy var mainView : UIView = {
    var  view = UIView()
        view.backgroundColor = UIColor.clear
        view.translatesAutoresizingMaskIntoConstraints = false
       return view
    }()
    
    var containerView : UIView = {
        var  view = UIView()
        view.backgroundColor = UIColor.white
        view.layer.shadowColor = UIColor.white.cgColor
        view.layer.shadowRadius = 4
        view.layer.shadowOpacity = 0.10
        view.layer.shadowOffset = CGSize(width: 2, height: 2)
        view.clipsToBounds = false
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 12 * appConstant.heightRatio
        return view
    }()
        
    lazy var logoImg : UIImageView = {
        var img  = UIImageView()
        img.image = UIImage(named: "popupbackground")
        img.clipsToBounds = true
        img.layer.cornerRadius = 10
        img.contentMode = .scaleToFill
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    
    lazy var leftHeartImg : UIImageView = {
        var img  = UIImageView()
        img.image = UIImage(named: "leftHeartImg")
        img.clipsToBounds = true
        img.contentMode = .scaleAspectFill
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    lazy var rightHeartImg : UIImageView = {
        var img  = UIImageView()
        img.image = UIImage(named: "rightHeartImg")
        img.clipsToBounds = true
        img.contentMode = .scaleAspectFill
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    lazy var guidedpermtitlelbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.systemGray
        lbl.textAlignment = .center
        lbl.font = regular(size: 20)
        lbl.text = "Do you want to enable guided access mode?"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var bottomlineView : UIView = {
    var  view = UIView()
        view.backgroundColor = UIColor.systemGray
        view.translatesAutoresizingMaskIntoConstraints = false
       return view
    }()
    
    lazy var yesBtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor.clear
        btn.layer.cornerRadius = 0 * appConstant.heightRatio
        btn.layer.shadowOpacity = 0.0
        btn.layer.shadowColor = UIColor.clear.cgColor
//        btn.contentMode = .scaleToFill
//        btn.setImage(UIImage(named: "cancelIcon"), for: .normal)
        btn.titleLabel?.font = regular(size: 20)
        btn.setTitle("Yes", for: .normal)
        btn.setTitleColor(UIColor.red, for: .normal)
        btn.clipsToBounds = true
        btn.tintColor = UIColor(named: Colors.Primary_Color)
        return btn
    }()
    
    
    lazy var skipBtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor.clear
        btn.layer.cornerRadius = 0 * appConstant.heightRatio
        btn.layer.shadowOpacity = 0
        btn.layer.shadowColor = UIColor.clear.cgColor
        btn.titleLabel?.font = regular(size: 20)
        btn.setTitle("Skip", for: .normal)
        btn.setTitleColor(UIColor.systemGray, for: .normal)
//        btn.setImage(UIImage(named: "cancelIcon"), for: .normal)
        btn.clipsToBounds = true
        btn.tintColor = UIColor(named: Colors.Primary_Color)
        return btn
    }()
    
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
        self.backgroundColor = .clear
        self.translatesAutoresizingMaskIntoConstraints = false

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setUp(){
    
        self.addSubview(mainView)
        mainView.addSubview(containerView)
        containerView.addSubview(logoImg)
        containerView.addSubview(leftHeartImg)
        containerView.addSubview(rightHeartImg)
        self.addSubview(guidedpermtitlelbl)
        self.addSubview(bottomlineView)
        self.addSubview(yesBtn)
        self.addSubview(skipBtn)
        
        NSLayoutConstraint.activate([
            
            self.mainView.topAnchor.constraint(equalTo: self.topAnchor),
            self.mainView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.mainView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.mainView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            
            
            self.containerView.topAnchor.constraint(equalTo: mainView.topAnchor,constant: 100 * appConstant.heightRatio),
            self.containerView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor,constant: 20 * appConstant.heightRatio),
            self.containerView.bottomAnchor.constraint(equalTo: mainView.bottomAnchor,constant: -20 * appConstant.heightRatio),
            self.containerView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor,constant: -20 * appConstant.heightRatio),
            
        
            
            self.logoImg.topAnchor.constraint(equalTo: self.containerView.topAnchor,constant: 0 * appConstant.heightRatio),
            self.logoImg.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 0 * appConstant.widthRatio),
            self.logoImg.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -0 * appConstant.widthRatio),
            self.logoImg.bottomAnchor.constraint(equalTo: self.containerView.bottomAnchor,constant: -0 * appConstant.heightRatio),
            
            
            leftHeartImg.topAnchor.constraint(equalTo: containerView.topAnchor, constant: -40 * appConstant.heightRatio),
            leftHeartImg.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: -25 * appConstant.widthRatio),
            leftHeartImg.heightAnchor.constraint(equalToConstant: 92 * appConstant.heightRatio),
            leftHeartImg.widthAnchor.constraint(equalToConstant: 92 * appConstant.heightRatio),
            
            
            rightHeartImg.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 40 * appConstant.heightRatio),
            rightHeartImg.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 25 * appConstant.widthRatio),
            rightHeartImg.heightAnchor.constraint(equalToConstant: 92 * appConstant.heightRatio),
            rightHeartImg.widthAnchor.constraint(equalToConstant: 92 * appConstant.heightRatio),
            
            
            guidedpermtitlelbl.bottomAnchor.constraint(equalTo: bottomlineView.topAnchor, constant: -20 * appConstant.heightRatio),
            guidedpermtitlelbl.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 25 * appConstant.widthRatio),
            guidedpermtitlelbl.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -25 * appConstant.widthRatio),

            
            bottomlineView.bottomAnchor.constraint(equalTo: yesBtn.topAnchor, constant: -10 * appConstant.heightRatio),
            bottomlineView.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 0 * appConstant.widthRatio),
            bottomlineView.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -0 * appConstant.widthRatio),
            bottomlineView.heightAnchor.constraint(equalToConstant: 1 * appConstant.heightRatio),

            
            yesBtn.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -15 * appConstant.heightRatio),
            yesBtn.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -60 * appConstant.widthRatio),
            yesBtn.heightAnchor.constraint(equalToConstant: 38 * appConstant.heightRatio),
            yesBtn.widthAnchor.constraint(equalToConstant: 50 * appConstant.heightRatio),
            
            
            skipBtn.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -15 * appConstant.heightRatio),
            skipBtn.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 60 * appConstant.widthRatio),
            skipBtn.heightAnchor.constraint(equalToConstant: 38 * appConstant.heightRatio),
            skipBtn.widthAnchor.constraint(equalToConstant: 50 * appConstant.heightRatio),
            
            
        ])
        
    }

}



class GuidedAccessPopUp2: UIView {

    lazy var mainView : UIView = {
    var  view = UIView()
        view.backgroundColor = UIColor.clear
        view.translatesAutoresizingMaskIntoConstraints = false
       return view
    }()
    
    var containerView : UIView = {
        var  view = UIView()
        view.backgroundColor = UIColor.white
        view.layer.shadowColor = UIColor.white.cgColor
        view.layer.shadowRadius = 4
        view.layer.shadowOpacity = 0.10
        view.layer.shadowOffset = CGSize(width: 2, height: 2)
        view.clipsToBounds = false
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 12 * appConstant.heightRatio
        return view
    }()
        
    lazy var logoImg : UIImageView = {
        var img  = UIImageView()
        img.image = UIImage(named: "popupbackground")
        img.clipsToBounds = true
        img.layer.cornerRadius = 10
        img.contentMode = .scaleToFill
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    
    lazy var leftHeartImg : UIImageView = {
        var img  = UIImageView()
        img.image = UIImage(named: "leftHeartImg")
        img.clipsToBounds = true
        img.contentMode = .scaleAspectFill
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    lazy var rightHeartImg : UIImageView = {
        var img  = UIImageView()
        img.image = UIImage(named: "rightHeartImg")
        img.clipsToBounds = true
        img.contentMode = .scaleAspectFill
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    lazy var guidedpermtitlelbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.systemGray
        lbl.textAlignment = .center
        lbl.font = regular(size: 20)
        lbl.text = "Do you want to enable guided access mode?"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var bottomlineView : UIView = {
    var  view = UIView()
        view.backgroundColor = UIColor.systemGray
        view.translatesAutoresizingMaskIntoConstraints = false
       return view
    }()
    
    lazy var yesBtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor.clear
        btn.layer.cornerRadius = 0 * appConstant.heightRatio
        btn.layer.shadowOpacity = 0.0
        btn.layer.shadowColor = UIColor.clear.cgColor
//        btn.contentMode = .scaleToFill
//        btn.setImage(UIImage(named: "cancelIcon"), for: .normal)
        btn.titleLabel?.font = regular(size: 20)
        btn.setTitle("Ok", for: .normal)
        btn.setTitleColor(UIColor.red, for: .normal)
        btn.clipsToBounds = true
        btn.tintColor = UIColor(named: Colors.Primary_Color)
        return btn
    }()
    
    
    lazy var skipBtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor.clear
        btn.layer.cornerRadius = 0 * appConstant.heightRatio
        btn.layer.shadowOpacity = 0
        btn.layer.shadowColor = UIColor.clear.cgColor
        btn.titleLabel?.font = regular(size: 20)
        btn.setTitle("Skip", for: .normal)
        btn.isHidden = true
        btn.setTitleColor(UIColor.systemGray, for: .normal)
//        btn.setImage(UIImage(named: "cancelIcon"), for: .normal)
        btn.clipsToBounds = true
        btn.tintColor = UIColor(named: Colors.Primary_Color)
        return btn
    }()
    
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
        self.backgroundColor = .clear
        self.translatesAutoresizingMaskIntoConstraints = false

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setUp(){
    
        self.addSubview(mainView)
        mainView.addSubview(containerView)
        containerView.addSubview(logoImg)
        containerView.addSubview(leftHeartImg)
        containerView.addSubview(rightHeartImg)
        self.addSubview(guidedpermtitlelbl)
        self.addSubview(bottomlineView)
        self.addSubview(yesBtn)
//        self.addSubview(skipBtn)
        
        NSLayoutConstraint.activate([
            
            self.mainView.topAnchor.constraint(equalTo: self.topAnchor),
            self.mainView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.mainView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.mainView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            
            
            self.containerView.topAnchor.constraint(equalTo: mainView.topAnchor,constant: 100 * appConstant.heightRatio),
            self.containerView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor,constant: 20 * appConstant.heightRatio),
            self.containerView.bottomAnchor.constraint(equalTo: mainView.bottomAnchor,constant: -20 * appConstant.heightRatio),
            self.containerView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor,constant: -20 * appConstant.heightRatio),
            
        
            
            self.logoImg.topAnchor.constraint(equalTo: self.containerView.topAnchor,constant: 0 * appConstant.heightRatio),
            self.logoImg.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 0 * appConstant.widthRatio),
            self.logoImg.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -0 * appConstant.widthRatio),
            self.logoImg.bottomAnchor.constraint(equalTo: self.containerView.bottomAnchor,constant: -0 * appConstant.heightRatio),
            
            
            leftHeartImg.topAnchor.constraint(equalTo: containerView.topAnchor, constant: -40 * appConstant.heightRatio),
            leftHeartImg.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: -25 * appConstant.widthRatio),
            leftHeartImg.heightAnchor.constraint(equalToConstant: 92 * appConstant.heightRatio),
            leftHeartImg.widthAnchor.constraint(equalToConstant: 92 * appConstant.heightRatio),
            
            
            rightHeartImg.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 40 * appConstant.heightRatio),
            rightHeartImg.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 25 * appConstant.widthRatio),
            rightHeartImg.heightAnchor.constraint(equalToConstant: 92 * appConstant.heightRatio),
            rightHeartImg.widthAnchor.constraint(equalToConstant: 92 * appConstant.heightRatio),
            
            
            guidedpermtitlelbl.bottomAnchor.constraint(equalTo: bottomlineView.topAnchor, constant: -20 * appConstant.heightRatio),
            guidedpermtitlelbl.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 25 * appConstant.widthRatio),
            guidedpermtitlelbl.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -25 * appConstant.widthRatio),

            
            bottomlineView.bottomAnchor.constraint(equalTo: yesBtn.topAnchor, constant: -10 * appConstant.heightRatio),
            bottomlineView.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 0 * appConstant.widthRatio),
            bottomlineView.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -0 * appConstant.widthRatio),
            bottomlineView.heightAnchor.constraint(equalToConstant: 1 * appConstant.heightRatio),

            
            yesBtn.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -15 * appConstant.heightRatio),
            yesBtn.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 60 * appConstant.widthRatio),
            yesBtn.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -60 * appConstant.widthRatio),
            yesBtn.heightAnchor.constraint(equalToConstant: 38 * appConstant.heightRatio),
            yesBtn.widthAnchor.constraint(equalToConstant: 50 * appConstant.heightRatio),
            
            
//            skipBtn.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -15 * appConstant.heightRatio),
//            skipBtn.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 60 * appConstant.widthRatio),
//            skipBtn.heightAnchor.constraint(equalToConstant: 38 * appConstant.heightRatio),
//            skipBtn.widthAnchor.constraint(equalToConstant: 50 * appConstant.heightRatio),
//
            
        ])
        
    }

}

