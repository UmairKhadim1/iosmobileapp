//
//  OnBoarding2.swift
//  Heartzy
//
//  Created by waseeem on 11/7/22.
//

import UIKit

protocol OnBoard2Delegate{
    func slider2BtnPress()
}

var onBoard2Data : OnBoard2Delegate?

class OnBoarding2: UIView {
    
    lazy var headerlbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor(named: Colors.Primary_Color)
        lbl.textAlignment = .center
        lbl.font = regular(size: 40)
        lbl.text = "create Passcode"
        lbl.numberOfLines = 0
//        lbl.adjustsFontSizeToFitWidth = true
//        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var sliderImage : UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "OnBoard2")
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        return iv
    }()
        
    var skipdatadelegate : skipDelegate?

    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        self.clipsToBounds = true
        onboard2 = self
        setup()
        
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        
    }
    
    
    func setup(){
        
        self.addSubview(sliderImage)
        self.addSubview(headerlbl)
        
        
        NSLayoutConstraint.activate([
            
            headerlbl.topAnchor.constraint(equalTo: self.topAnchor,constant: 40 * appConstant.heightRatio),
            headerlbl.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 20 * appConstant.widthRatio),
            headerlbl.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -20 * appConstant.widthRatio),
            
            sliderImage.topAnchor.constraint(equalTo: headerlbl.bottomAnchor,constant: 80 * appConstant.heightRatio),
            sliderImage.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0 * appConstant.widthRatio),
            sliderImage.widthAnchor.constraint(equalToConstant: 260 * appConstant.heightRatio),
            sliderImage.heightAnchor.constraint(equalToConstant: 354 * appConstant.heightRatio),
            
        ])
    }
    
}

extension OnBoarding2: Slider2Delegate{
    func btn2Press() {
        
    }
}

