//
//  AppConstant.swift
//  Heartzy
//
//  Created by waseeem on 11/7/22.
//

import Foundation
import UIKit

class appConstant {

    static let widthRatio = UIScreen.main.bounds.width/375.0
    static let heightRatio = UIScreen.main.bounds.height/812.0
   
   
    public static func screenWidth()->CGFloat{
        var width: CGFloat = 0
        if let window = UIApplication.shared.windows.first{
            width = window.frame.width
        }
        return width
    }
    
    public static func screenHeight()->CGFloat{
        var height: CGFloat = 0
        if let window = UIApplication.shared.windows.first{
            height = window.frame.height
        }
        return height
    }
 

}



//Use custom Button where you want
class CustomButton: UIButton {
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        setup()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

       setup()
    }
    
    func setup(){
        self.layer.cornerRadius = 8 * appConstant.heightRatio
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowRadius = 2
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.titleLabel?.font = UIFont(name:"Gill Sans", size: 20.0 * appConstant.heightRatio)
        self.setTitleColor(UIColor.white, for: .normal)
        self.contentMode = .scaleAspectFit
        self.clipsToBounds = false
    }
}
