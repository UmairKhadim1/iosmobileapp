//
//  Helper.swift
//  Guardians
//
//  Created by waseeem on 11/1/22.
//

import Foundation
import UIKit

//Extension of TextField
public extension UITextField {

    func addToolbarInputAccessoryView(toolbarHeight: CGFloat) {
        let timeCancelButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action:#selector(endEditing(_:)))
        timeCancelButton.tintColor = UIColor.blue
        let dateFlexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)

        let toolbar = UIToolbar()

        toolbar.frame = CGRect(x: 0, y: 0, width: bounds.width, height: toolbarHeight)
        toolbar.items = [dateFlexSpace,timeCancelButton]
        toolbar.isTranslucent = false
    //    toolbar.barTintColor = .selectedBtn
        toolbar.contentMode = .right

        inputAccessoryView = toolbar
    }


}



//Extension of UIFont
extension UIFont {
    class func appFont(
        ofSize size : CGFloat = UIFont.systemFontSize,
        weight : Weight = .regular,
        
        autoScale : Bool = true
    ) -> UIFont {
        return UIFont.systemFont(ofSize: autoScale ? size.dp : size, weight: weight)
    }
}


extension CGFloat {
    var dp: CGFloat {
        
        let width = UIScreen.main.bounds.width
        let device = UIScreen.main.traitCollection.userInterfaceIdiom
        
        if (device == .phone) {
            if (width <= 320) {
                // iPod(Gen7)
                // iPhone(5s, SEGen1)
                return self * 0.75
            } else if (width <= 375) {
                // iPhone(SEGen2 6, 6s, 7, 8, X, Xs, 11pro, 12mini, 13mini)
                return self * 0.95
            } else if (width <= 414) {
                // iPhone(6+, 6s+, 7+, 8+, XsMax, XR, 11, 11proMax, 12, 12pro, 13, 13pro)
                return self
            } else if (width <= 744) {
                // iPhone(12proMax, 13proMax)
                return self * 1.2
            }
        } else if (device == .pad) {
            if (width <= 744) {
                // ipad(miniGen6, )
                return self * 1.4
            } else if (width <= 768) {
                // ipad(Gen5, Gen6, Air, Air2, Pro9.7)
                return self * 1.45
            } else if (width <= 810) {
                // ipad(Gen9)
                return self * 1.5
            } else if (width <= 834) {
                // ipad(AirGen3, AirGen5, Pro10.5, Pro11Gen1, Pro11Gen3)
                return self * 1.55
            } else if (width <= 1024) {
                // ipad(Pro12.9Gen1, Pro12.9Gen2, Pro12.9Gen3, Pro12.9Gen5)
                return self * 1.85
            }
        }
        
        return self
    }
}

//alertmsg
func alertWithMsg(vc:UIViewController,msg:String,title:String){
    
    let alert = UIAlertController(title: title, message: msg,         preferredStyle: UIAlertController.Style.alert)

    alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { _ in
        //Cancel Action
        
    }))
//    alert.addAction(UIAlertAction(title: title,
//                                  style: UIAlertAction.Style.default,
//                                  handler: {(_: UIAlertAction!) in
//                                    //Sign out action
 //   }))
    vc.present(alert, animated: true, completion: nil)
}



class ConfigurableTapAreaButton : UIButton {
    
    var tapRect = CGRect.zero

    override init(frame: CGRect) {
        super.init(frame: frame)
        tapRect = bounds
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        return tapRect.contains(point)
    }

    func setTapArea(rect: CGRect) {
        tapRect = rect
    }
 
    func changeTapAreaBy(insets: UIEdgeInsets) {

        let dx = insets.left
        let dy = insets.top
        let dw = insets.right  - dx
        let dh = insets.bottom - dy

        tapRect = CGRect(     x: tapRect.origin.x    + dx,
                              y: tapRect.origin.y    + dy,
                          width: tapRect.size.width  + dw,
                         height: tapRect.size.height + dh)
    }
}



class ActivityIndicator {
    
  static var shared = ActivityIndicator()

    var vSpinner: UIView?
    
    func showSpinner(onView : UIView) {
        
          let spinnerView = UIView.init(frame: onView.bounds)
          spinnerView.backgroundColor = UIColor.clear//UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
          let ai = UIActivityIndicatorView.init(style: .large)
          ai.color = .black
          ai.startAnimating()
          ai.center = spinnerView.center
          DispatchQueue.main.async {
            spinnerView.addSubview(ai)
            onView.addSubview(spinnerView)
          }
        
        self.vSpinner = spinnerView
    }
    
    func removeSpinner() {
      DispatchQueue.main.async {
          self.vSpinner?.removeFromSuperview()
          self.vSpinner = nil
          
      }
        
    }
    
}



class Helper{
    
    static func validateEmail(_ email: String) -> Bool {
        let emailTest = NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}")
        return emailTest.evaluate(with: email)
    }
    
    
}


//For Giving padding to Text Input of TextField
extension UITextField {

   func setPadding(left: CGFloat? = nil, right: CGFloat? = nil){
       if let left = left {
          let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: left, height: self.frame.size.height))
          self.leftView = paddingView
          self.leftViewMode = .always
       }

       if let right = right {
           let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: right, height: self.frame.size.height))
           self.rightView = paddingView
           self.rightViewMode = .always
       }
   }

}



//For One Time Password TextField
class OneTimeCodeTextField: UITextField {

    var didEnterLastDigit: ((String) -> Void)?
    
    var defaultCharacter = ""
    
    private var isConfigured = false
    
    private var digitLabels = [UILabel]()
    
    private lazy var tapRecognizer: UITapGestureRecognizer = {
        let recognizer = UITapGestureRecognizer()
        recognizer.addTarget(self, action: #selector(becomeFirstResponder))
        return recognizer
    }()
    
    func configure(with slotCount: Int = 6) {
        guard isConfigured == false else { return }
        isConfigured.toggle()
        
        configureTextField()
        
        let labelsStackView = createLabelsStackView(with: slotCount)
        addSubview(labelsStackView)
        
        addGestureRecognizer(tapRecognizer)
        
        NSLayoutConstraint.activate([
            labelsStackView.topAnchor.constraint(equalTo: topAnchor),
            labelsStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            labelsStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            labelsStackView.bottomAnchor.constraint(equalTo: bottomAnchor)
            ])
        
    }

    private func configureTextField() {
        tintColor = .clear
        textColor = .clear
      //  keyboardType = .numberPad
        textContentType = .oneTimeCode
        
        addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        delegate = self
    }
    
    private func createLabelsStackView(with count: Int) -> UIStackView {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 8
        
        for _ in 1 ... count {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.textAlignment = .center
            label.font = .systemFont(ofSize: 15)
            label.isUserInteractionEnabled = true
            label.text = defaultCharacter
//            label.backgroundColor = UIColor.lightGray
            label.layer.cornerRadius = 10
            label.layer.borderColor = UIColor(named: Colors.Primary_Color)?.cgColor
            label.layer.borderWidth = 1
            label.layer.cornerRadius = 12 * appConstant.heightRatio
            label.textColor = UIColor.black

            stackView.addArrangedSubview(label)
            
            digitLabels.append(label)
        }
        
        return stackView
    }
    
    @objc
    private func textDidChange() {
        
        guard let text = self.text, text.count <= digitLabels.count else { return }
        
        for i in 0 ..< digitLabels.count {
            let currentLabel = digitLabels[i]
            
            if i < text.count {
                let index = text.index(text.startIndex, offsetBy: i)
                currentLabel.text = String(text[index])
            } else {
                currentLabel.text = defaultCharacter
            }
        }
        
        if text.count == digitLabels.count {
            didEnterLastDigit?(text)
        }
        
      
    }
    
}

extension OneTimeCodeTextField: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let characterCount = textField.text?.count else { return false }
        return characterCount < digitLabels.count || string == ""
    }
    
    
}



//
class SingleDigitField: UITextField {
    var pressedDelete = false
    override func willMove(toSuperview newSuperview: UIView?) {
        keyboardType = .numberPad
        textAlignment = .center
        backgroundColor = .clear
        layer.cornerRadius = 15 * appConstant.heightRatio
        isSecureTextEntry = true
        isUserInteractionEnabled = false
    }
    override func caretRect(for position: UITextPosition) -> CGRect { .zero }
    override func selectionRects(for range: UITextRange) -> [UITextSelectionRect] { [] }
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool { false }
    override func deleteBackward() {
        pressedDelete = true
        sendActions(for: .editingChanged)
    }
}



//
enum GradientDirection {
    case leftToRight
    case rightToLeft
    case topToBottom
    case bottomToTop
}

extension UIView {
    func gradientBackground(from color1: UIColor, to color2: UIColor, direction: GradientDirection) {
        let gradient = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = [color1.cgColor, color2.cgColor]

        switch direction {
        case .leftToRight:
            gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
            gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
        case .rightToLeft:
            gradient.startPoint = CGPoint(x: 1.0, y: 0.5)
            gradient.endPoint = CGPoint(x: 0.0, y: 0.5)
        case .bottomToTop:
            gradient.startPoint = CGPoint(x: 0.5, y: 1.0)
            gradient.endPoint = CGPoint(x: 0.5, y: 0.0)
        default:
            break
        }

        self.layer.insertSublayer(gradient, at: 0)
    }
    
    func layerGradient() {
            let layer : CAGradientLayer = CAGradientLayer()
            layer.frame.size = self.frame.size
            layer.frame.origin = CGPointMake(0.0,0.0)
            layer.cornerRadius = CGFloat(frame.width / 20)

            let color1 = UIColor(red:254, green:216, blue: 247, alpha:1).cgColor
            let color2 = UIColor(red:196, green:221, blue: 254, alpha:1).cgColor

            layer.colors = [color1,color2]
            self.layer.insertSublayer(layer, at: 0)
        }
    
    
    func setGradientColor(colorOne: UIColor, colorTwo: UIColor) {

           let gradientLayer = CAGradientLayer()
           gradientLayer.frame = bounds
           gradientLayer.colors = [colorOne.cgColor, colorTwo.cgColor]
           gradientLayer.locations = [0.0,0.1]
           gradientLayer.startPoint = CGPoint(x: 1.0, y: 1.0)
           gradientLayer.endPoint = CGPoint(x: 0.0, y: 0.0)

           layer.insertSublayer(gradientLayer, at: 0)
      }
    
    @discardableResult
    func setGradietColor(colorOne: UIColor, colorTwo: UIColor) -> CALayer {

        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [colorOne.cgColor, colorTwo.cgColor]
        gradientLayer.locations = [0.0,0.1]
        gradientLayer.startPoint = CGPoint(x: 1.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 0.0, y: 0.0)

        layer.insertSublayer(gradientLayer, at: 0)
        return layer
   }
    
}


class EmojiTextField: UITextField {

    // required for iOS 13
    override var textInputContextIdentifier: String? { "" } // return non-nil to show the Emoji keyboard ¯\_(ツ)_/¯

    override var textInputMode: UITextInputMode? {
        for mode in UITextInputMode.activeInputModes {
            if mode.primaryLanguage == "emoji" {
                return mode
            }
        }
        return nil
    }
}


// Access Shared Defaults Object
let userDefaults = UserDefaults.standard

protocol ObjectSavable {
  func setData<Object>(_ object: Object, forKey: String) throws where Object: Encodable
  func getData<Object>(forKey: String, castTo type: Object.Type) throws -> Object where Object: Decodable
}


enum ObjectSavableError: String, LocalizedError {
  case unableToEncode = "Unable to encode object into data"
  case noValue = "No data object found for the given key"
  case unableToDecode = "Unable to decode object into given type"
  var errorDescription: String? {
    rawValue
  }
}

extension UserDefaults: ObjectSavable {
 
    func setData<Object>(_ object: Object, forKey: String) throws where Object: Encodable {
    let encoder = JSONEncoder()
    do {
      let data = try encoder.encode(object)
      set(data, forKey: forKey)
    } catch {
      throw ObjectSavableError.unableToEncode
    }
  }
    
  func getData<Object>(forKey: String, castTo type: Object.Type) throws -> Object where Object: Decodable {
    guard let data = data(forKey: forKey) else { throw ObjectSavableError.noValue }
    let decoder = JSONDecoder()
    do {
      let object = try decoder.decode(type, from: data)
      return object
    } catch {
      throw ObjectSavableError.unableToDecode
    }
  }
}



extension UIButton {

        func pulsate() {

            let pulse = CASpringAnimation(keyPath: "transform.scale")
            pulse.duration = 0.2
            pulse.fromValue = 0.95
            pulse.toValue = 1.0
            pulse.autoreverses = true
            pulse.repeatCount = 2
            pulse.initialVelocity = 0.5
            pulse.damping = 1.0

            layer.add(pulse, forKey: "pulse")
        }

        func flash() {

            let flash = CABasicAnimation(keyPath: "opacity")
            flash.duration = 0.2
            flash.fromValue = 1
            flash.toValue = 0.1
            flash.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
            flash.autoreverses = true
            flash.repeatCount = 3

            layer.add(flash, forKey: nil)
        }


        func shake() {

            let shake = CABasicAnimation(keyPath: "position")
            shake.duration = 0.05
            shake.repeatCount = 2
            shake.autoreverses = true

            let fromPoint = CGPoint(x: center.x - 5, y: center.y)
            let fromValue = NSValue(cgPoint: fromPoint)

            let toPoint = CGPoint(x: center.x + 5, y: center.y)
            let toValue = NSValue(cgPoint: toPoint)

            shake.fromValue = fromValue
            shake.toValue = toValue

            layer.add(shake, forKey: "position")
        }
    }



extension Character {
  var isSimpleEmoji: Bool {
    guard let firstScalar = unicodeScalars.first else {
      return false
    }
    return firstScalar.properties.isEmoji && firstScalar.value > 0x238C
  }
var isCombinedIntoEmoji: Bool {
    unicodeScalars.count > 1 && unicodeScalars.first?.properties.isEmoji ?? false
  }
var isEmoji: Bool { isSimpleEmoji || isCombinedIntoEmoji }
}



extension String {
    
 func iscontainTextEmoji(find: String) -> Bool{
     return find is String || find is Int
}
    
  var isSingleEmoji: Bool {
    return count == 1 && containsEmoji
  }
  var containsEmoji: Bool {
    return contains { $0.isEmoji }
  }
  var containsOnlyEmoji: Bool {
    return !isEmpty && !contains { !$0.isEmoji }
  }
  var emojiString: String {
    return emojis.map { String($0) }.reduce("", +)
  }
  var emojis: [Character] {
    return filter { $0.isEmoji }
  }
  var emojiScalars: [UnicodeScalar] {
    return filter { $0.isEmoji }.flatMap { $0.unicodeScalars }
  }
    
}
