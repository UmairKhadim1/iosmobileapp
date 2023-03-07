//
//  AppUserDefault.swift
//  Heartzy
//
//  Created by waseeem on 11/16/22.
//

import Foundation



class AppUserDefault {
    
    static let shared = AppUserDefault()
    private init(){}
    
    // Handling in app login
    
    //For Bot Icon Handling
    var isLogin :  Bool? {
        set {
            UserDefaults.standard.set(newValue, forKey:"isLogin" )
            UserDefaults.standard.synchronize()
        }
        get {
            return UserDefaults.standard.bool(forKey: "isLogin")
        }
    }
    
    
    var isFirstTime :  Bool? {
        set {
            UserDefaults.standard.set(newValue, forKey:"isFirstTime" )
            UserDefaults.standard.synchronize()
        }
        get {
            return UserDefaults.standard.bool(forKey: "isFirstTime")
        }
    }
    
    var bot1 :  Bool? {
        set {
            UserDefaults.standard.set(newValue, forKey:"bot1" )
            UserDefaults.standard.synchronize()
        }
        get {
            return UserDefaults.standard.bool(forKey: "bot1")
        }
    }
    
    var bot2 :  Bool? {
        set {
            UserDefaults.standard.set(newValue, forKey:"bot2" )
            UserDefaults.standard.synchronize()
        }
        get {
            return UserDefaults.standard.bool(forKey: "bot2")
        }
    }
    
    var bot3 :  Bool? {
        set {
            UserDefaults.standard.set(newValue, forKey:"bot3" )
            UserDefaults.standard.synchronize()
        }
        get {
            return UserDefaults.standard.bool(forKey: "bot3")
        }
    }
    
    var bot4 :  Bool? {
        set {
            UserDefaults.standard.set(newValue, forKey:"bot4" )
            UserDefaults.standard.synchronize()
        }
        get {
            return UserDefaults.standard.bool(forKey: "bot4")
        }
    }
    
    var bot5 :  Bool? {
        set {
            UserDefaults.standard.set(newValue, forKey:"bot5" )
            UserDefaults.standard.synchronize()
        }
        get {
            return UserDefaults.standard.bool(forKey: "bot5")
        }
    }
    
    //For Theme
    var theme1 :  Bool? {
        set {
            UserDefaults.standard.set(newValue, forKey:"theme1" )
            UserDefaults.standard.synchronize()
        }
        get {
            return UserDefaults.standard.bool(forKey: "theme1")
        }
    }
    
    var theme2 :  Bool? {
        set {
            UserDefaults.standard.set(newValue, forKey:"theme2" )
            UserDefaults.standard.synchronize()
        }
        get {
            return UserDefaults.standard.bool(forKey: "theme2")
        }
    }
    
    var theme3 :  Bool? {
        set {
            UserDefaults.standard.set(newValue, forKey:"theme3" )
            UserDefaults.standard.synchronize()
        }
        get {
            return UserDefaults.standard.bool(forKey: "theme3")
        }
    }
    
    var theme4 :  Bool? {
        set {
            UserDefaults.standard.set(newValue, forKey:"theme4" )
            UserDefaults.standard.synchronize()
        }
        get {
            return UserDefaults.standard.bool(forKey: "theme4")
        }
    }
    
    var theme5 :  Bool? {
        set {
            UserDefaults.standard.set(newValue, forKey:"theme5" )
            UserDefaults.standard.synchronize()
        }
        get {
            return UserDefaults.standard.bool(forKey: "theme5")
        }
    }
    var theme6 :  Bool? {
        set {
            UserDefaults.standard.set(newValue, forKey:"theme6" )
            UserDefaults.standard.synchronize()
        }
        get {
            return UserDefaults.standard.bool(forKey: "theme6")
        }
    }
    
    //For Color Theme
    var color1 :  Bool? {
        set {
            UserDefaults.standard.set(newValue, forKey:"color1" )
            UserDefaults.standard.synchronize()
        }
        get {
            return UserDefaults.standard.bool(forKey: "color1")
        }
    }
    
    var color2 :  Bool? {
        set {
            UserDefaults.standard.set(newValue, forKey:"color2" )
            UserDefaults.standard.synchronize()
        }
        get {
            return UserDefaults.standard.bool(forKey: "color2")
        }
    }
    
    var color3 :  Bool? {
        set {
            UserDefaults.standard.set(newValue, forKey:"color3" )
            UserDefaults.standard.synchronize()
        }
        get {
            return UserDefaults.standard.bool(forKey: "color3")
        }
    }
    
    var color4 :  Bool? {
        set {
            UserDefaults.standard.set(newValue, forKey:"color4" )
            UserDefaults.standard.synchronize()
        }
        get {
            return UserDefaults.standard.bool(forKey: "color4")
        }
    }
    
    var color5 :  Bool? {
        set {
            UserDefaults.standard.set(newValue, forKey:"color5" )
            UserDefaults.standard.synchronize()
        }
        get {
            return UserDefaults.standard.bool(forKey: "color5")
        }
    }
    
    var isAppOpenCount :  String? {
        set {
            UserDefaults.standard.set(newValue, forKey:"isAppOpenCount" )
            UserDefaults.standard.synchronize()
        }
        get {
            return UserDefaults.standard.string(forKey: "isAppOpenCount")
        }
    }
    
    var isPayment :  Bool? {
        set {
            UserDefaults.standard.set(newValue, forKey:"isPayment" )
            UserDefaults.standard.synchronize()
        }
        get {
            return UserDefaults.standard.bool(forKey: "isPayment")
        }
    }
    
}
