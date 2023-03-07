//
//  Image+Extension.swift
//  Heartzy
//
//  Created by waseeem on 11/16/22.
//

import Foundation
import UIKit
import ImageIO

extension UIImageView {
    private var activityIndicator: UIActivityIndicatorView {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.hidesWhenStopped = true
        activityIndicator.color = UIColor.black
        self.addSubview(activityIndicator)
        
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        
        let centerX = NSLayoutConstraint(item: self,
                                         attribute: .centerX,
                                         relatedBy: .equal,
                                         toItem: activityIndicator,
                                         attribute: .centerX,
                                         multiplier: 1,
                                         constant: 0)
        let centerY = NSLayoutConstraint(item: self,
                                         attribute: .centerY,
                                         relatedBy: .equal,
                                         toItem: activityIndicator,
                                         attribute: .centerY,
                                         multiplier: 1,
                                         constant: 0)
        self.addConstraints([centerX, centerY])
        return activityIndicator
    }
    
    func setImageFrom(_ urlString: String, completion: (() -> Void)? = nil) {
        guard let url = URL(string: urlString) else { return }
        
        let session = URLSession(configuration: .default)
        let activityIndicator = self.activityIndicator
        
        DispatchQueue.main.async {
            activityIndicator.startAnimating()
        }
        
        let downloadImageTask = session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
            } else {
                if let imageData = data {
                    DispatchQueue.main.async {[weak self] in
                        var image = UIImage(data: imageData)
                        self?.image = nil
                        self?.image = image
                        image = nil
                        completion?()
                    }
                }
            }
            DispatchQueue.main.async {
                activityIndicator.stopAnimating()
                activityIndicator.removeFromSuperview()
            }
            
            session.finishTasksAndInvalidate()
            
        }
        
        downloadImageTask.resume()
        
    }
    
}


extension UIImage {

func fixedOrientation() -> UIImage? {
    guard imageOrientation != UIImage.Orientation.up else {
        // This is default orientation, don't need to do anything
        return self.copy() as? UIImage
    }

    guard let cgImage = self.cgImage else {
        // CGImage is not available
        return nil
    }

    guard let colorSpace = cgImage.colorSpace, let ctx = CGContext(data: nil, width: Int(size.width), height: Int(size.height), bitsPerComponent: cgImage.bitsPerComponent, bytesPerRow: 0, space: colorSpace, bitmapInfo: CGImageAlphaInfo.premultipliedLast.rawValue) else {
        return nil // Not able to create CGContext
    }

    var transform: CGAffineTransform = CGAffineTransform.identity

    switch imageOrientation {
    case .down, .downMirrored:
        transform = transform.translatedBy(x: size.width, y: size.height)
        transform = transform.rotated(by: CGFloat.pi)
    case .left, .leftMirrored:
        transform = transform.translatedBy(x: size.width, y: 0)
        transform = transform.rotated(by: CGFloat.pi / 2.0)
    case .right, .rightMirrored:
        transform = transform.translatedBy(x: 0, y: size.height)
        transform = transform.rotated(by: CGFloat.pi / -2.0)
    case .up, .upMirrored:
        break
    @unknown default:
        break
    }

    // Flip image one more time if needed to, this is to prevent flipped image
    switch imageOrientation {
    case .upMirrored, .downMirrored:
        transform = transform.translatedBy(x: size.width, y: 0)
        transform = transform.scaledBy(x: -1, y: 1)
    case .leftMirrored, .rightMirrored:
        transform = transform.translatedBy(x: size.height, y: 0)
        transform = transform.scaledBy(x: -1, y: 1)
    case .up, .down, .left, .right:
        break
    @unknown default:
        break
    }

    ctx.concatenate(transform)

    switch imageOrientation {
    case .left, .leftMirrored, .right, .rightMirrored:
        ctx.draw(cgImage, in: CGRect(x: 0, y: 0, width: size.height, height: size.width))
    default:
        ctx.draw(cgImage, in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        break
    }

    guard let newCGImage = ctx.makeImage() else { return nil }
    return UIImage.init(cgImage: newCGImage, scale: 1, orientation: .up)
}
    
}
