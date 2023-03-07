//
//  InfoPopUpView.swift
//  Heartzy
//
//  Created by waseeem on 11/8/22.
//

import UIKit

class InfoPopUpView: UIView {

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
        img.image = UIImage(named: "msg_How_To")
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
    
    
    lazy var cancelBtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor.clear
        btn.layer.cornerRadius = 25 * appConstant.heightRatio
        btn.layer.shadowOpacity = 0.5
        btn.layer.shadowColor = UIColor.clear.cgColor
        btn.contentMode = .scaleToFill
        btn.setImage(UIImage(named: "cancelIcon"), for: .normal)
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
        self.addSubview(cancelBtn)
        
        NSLayoutConstraint.activate([
            
            self.mainView.topAnchor.constraint(equalTo: self.topAnchor),
            self.mainView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.mainView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.mainView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            
            
            self.containerView.topAnchor.constraint(equalTo: mainView.topAnchor,constant: 50 * appConstant.heightRatio),
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


            
            cancelBtn.topAnchor.constraint(equalTo: containerView.topAnchor, constant: -15 * appConstant.heightRatio),
            cancelBtn.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 15 * appConstant.widthRatio),
            cancelBtn.heightAnchor.constraint(equalToConstant: 50 * appConstant.heightRatio),
            cancelBtn.widthAnchor.constraint(equalToConstant: 50 * appConstant.heightRatio),
            
            
        ])
        
    }

}
