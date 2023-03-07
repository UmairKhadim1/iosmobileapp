//
//  Colors.swift
//  Heartzy
//
//  Created by waseeem on 11/7/22.
//

import Foundation
import UIKit


enum Colors {
    
    static var Primary_Color = "PrimaryColor"
    static var purple_Color = "Purple"
    static var blue_Color = "Blue"
    static var yellow_Color = "Yellow"
    static var green_Color = "Green"
    
    static var light_Color = "lightColor"
    static var header_Color = "HeaderColor"
    static var bottom_Color = "bottomColor"
    static var top_Color = "topColor"    
}


func semiBold(size: Double) -> UIFont{
    return UIFont(name: "DynaPuff-SemiBold", size: size * appConstant.heightRatio)!
}

func medium(size: Double) -> UIFont{
    return UIFont(name: "DynaPuff-Medium", size: size * appConstant.heightRatio)!
}


func regular(size: Double) -> UIFont{
    return UIFont(name: "DynaPuff-Regular", size: size * appConstant.heightRatio)!
}

func bold(size: Double) -> UIFont{
    return UIFont(name: "DynaPuff-Bold", size: size * appConstant.heightRatio)!
}
