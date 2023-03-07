//
//  UIColor+.swift
//  WhiteNoiseDeepSleepSounds
//
//  Created by Asad Khan on 7/30/21.
//

import Foundation
import UIKit

class ActualGradientButton: UIButton {

    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }

    private lazy var gradientLayer: CAGradientLayer = {
        let l = CAGradientLayer()
        l.frame = self.bounds
        l.colors = [UIColor.systemPink.cgColor, UIColor.yellow.cgColor]
        l.startPoint = CGPoint(x: 0.5, y: 0.0)
        l.endPoint = CGPoint(x: 0.5, y: 1.0)
        l.cornerRadius = 16
        layer.insertSublayer(l, at: 0)
        return l
    }()
}
class GradientView: UIView {

    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }

    private lazy var gradientLayer: CAGradientLayer = {
        let l = CAGradientLayer()
        l.frame = self.bounds
        l.colors = [
            
            UIColor(red: 0.635, green: 0.39, blue: 0.946, alpha: 1).cgColor,

            UIColor(red: 0.046, green: 0.943, blue: 1, alpha: 1).cgColor

          ]
        l.startPoint = CGPoint(x: 0.25, y: 0.25)
        l.endPoint = CGPoint(x: 0.75, y: 0.25)
        l.cornerRadius = 16
        layer.insertSublayer(l, at: 0)
        return l
    }()
}

class Colors2 {
    
    var gl:CAGradientLayer!

    init() {
        let colorTop = UIColor(red: 192.0 / 255.0, green: 38.0 / 255.0, blue: 42.0 / 255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 35.0 / 255.0, green: 2.0 / 255.0, blue: 2.0 / 255.0, alpha: 1.0).cgColor

        self.gl = CAGradientLayer()
        self.gl.colors = [colorTop, colorBottom]
        self.gl.locations = [0.0, 1.0]
    }
}

//class GradientLabel: UILabel{
//
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        gradientLayer.frame = bounds
//    }
//
//    private lazy var gradientLayer: CAGradientLayer = {
//        let l = CAGradientLayer()
//        l.frame = self.bounds
//        l.colors = [
//            
//            UIColor(red: 0.8, green: 0.53, blue: 0.0, alpha: 1).cgColor,
//            UIColor(red: 1.0, green: 0.96, blue: 0.13, alpha: 1).cgColor,
//            UIColor(red: 0.76, green: 0.57, blue: 0.09, alpha: 1).cgColor,
//            UIColor(red: 0.99, green: 0.95, blue: 0.13, alpha: 1).cgColor,
//            UIColor(red: 0.67, green: 0.43, blue: 0.11, alpha: 1).cgColor
//          ]
//    
//        
//        l.shadowOpacity = 1
//        l.shadowRadius = 1
//        l.startPoint = CGPoint(x: 0.25, y: 0.25)
//        l.endPoint = CGPoint(x: 0.75, y: 0.25)
//        l.cornerRadius = 16
//        layer.insertSublayer(l, at: 0)
//        return l
//    }()
//}
class GradientLabel: UILabel {
    var gradientColors: [CGColor] = []

    override func drawText(in rect: CGRect) {
        if let gradientColor = drawGradientColor(in: rect, colors: gradientColors) {
            self.textColor = gradientColor
        }
        super.drawText(in: rect)
    }

    private func drawGradientColor(in rect: CGRect, colors: [CGColor]) -> UIColor? {
        let currentContext = UIGraphicsGetCurrentContext()
        currentContext?.saveGState()
        defer { currentContext?.restoreGState() }

        let size = rect.size
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        guard let gradient = CGGradient(colorsSpace: CGColorSpaceCreateDeviceRGB(),
                                        colors: colors as CFArray,
                                        locations: nil) else { return nil }

        let context = UIGraphicsGetCurrentContext()
        context?.drawLinearGradient(gradient,
                                    start: CGPoint.zero,
                                    end: CGPoint(x: size.width, y: 0),
                                    options: [])
        let gradientImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        guard let image = gradientImage else { return nil }
        return UIColor(patternImage: image)
    }
}

class headerGradientView: UIView {

    override func layoutSubviews() {
        super.layoutSubviews()

        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.topLeft, .bottomLeft, .topRight, .bottomRight], cornerRadii: CGSize(width: 20, height: 20))

        let gradient = CAGradientLayer()
        gradient.frame =  CGRect(origin: CGPoint.zero, size: frame.size)
        gradient.colors = [
            
            UIColor(red: 254, green: 216, blue: 247, alpha: 1).cgColor,

            UIColor(red: 196, green: 221, blue: 254, alpha: 1).cgColor

          ]

        let shape = CAShapeLayer()
        shape.lineWidth = 1
        shape.path = path.cgPath
        shape.strokeColor = UIColor.black.cgColor
        shape.fillColor = UIColor.clear.cgColor
        gradient.mask = shape

        layer.insertSublayer(gradient, at: 0)
    }
}
class TBView: UITableView {

    override func layoutSubviews() {
        super.layoutSubviews()

        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.topLeft, .bottomLeft, .topRight, .bottomRight], cornerRadii: CGSize(width: 20, height: 20))

        let gradient = CAGradientLayer()
        gradient.frame =  CGRect(origin: CGPoint.zero, size: frame.size)
        gradient.colors = [
            
            UIColor(red: 0.635, green: 0.39, blue: 0.946, alpha: 1).cgColor,

            UIColor(red: 0.046, green: 0.943, blue: 1, alpha: 1).cgColor

          ]

        let shape = CAShapeLayer()
        shape.lineWidth = 1
        shape.path = path.cgPath
        shape.strokeColor = UIColor.black.cgColor
        shape.fillColor = UIColor.clear.cgColor
        gradient.mask = shape

        layer.insertSublayer(gradient, at: 0)
    }
}


extension UIView {
    
    func setGradientBackground() {
        let colorTop =  UIColor(red: 226.0/255.0, green: 219.0/255.0, blue: 248.0/255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 208.0/255.0, green: 220.0/255.0, blue: 250.0/255.0, alpha: 1.0).cgColor
                    
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0 , 1.0]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        let gradientframe = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)
        gradientLayer.frame = gradientframe
                
        self.layer.insertSublayer(gradientLayer, at:0)
    }
    
    
}
