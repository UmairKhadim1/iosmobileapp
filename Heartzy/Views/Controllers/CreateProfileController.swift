//
//  CreateProfileController.swift
//  Heartzy
//
//  Created by waseeem on 11/7/22.
//

import UIKit
import Firebase
import FirebaseAuth

var imageName1 : UIImage?
var editimagenameof = ""

class CreateProfileController: UIViewController {
    
    lazy var createPasstitlelbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor(named: Colors.Primary_Color)
        lbl.textAlignment = .center
        lbl.font = regular(size: 24)
        lbl.text = "Create Profile"
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
        lbl.isHidden = true
        lbl.font = UIFont.appFont(ofSize: 15, weight: .regular)
        lbl.text = "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint."
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var PerimgView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.clear
        view.clipsToBounds = true
        view.layer.borderColor = UIColor(named: Colors.Primary_Color)?.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 49 * appConstant.heightRatio
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var Perimg : UIImageView = {
        let iv = UIImageView()
        iv.layer.cornerRadius = 12
        iv.backgroundColor = .clear
        iv.image = UIImage(named: "MaskIcon")
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()

    lazy var PerimgBtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor.clear
        btn.layer.cornerRadius = 12 * appConstant.heightRatio
        btn.layer.shadowOpacity = 0.5
        btn.layer.shadowColor = UIColor.clear.cgColor
        btn.contentMode = .scaleToFill
        btn.setImage(UIImage(named: "MaskEdit"), for: .normal)
        btn.clipsToBounds = true
        btn.tintColor = UIColor(named: Colors.Primary_Color)
        btn.addTarget(self, action: #selector(PerimgBtn_press), for: .touchUpInside)
        return btn
    }()
    
    
    lazy var nameTF : UITextField = {
        let tf = UITextField()
        tf.attributedPlaceholder = NSAttributedString(
            string: "Enter Name",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: Colors.Primary_Color) ?? .systemPink])
        tf.backgroundColor = .clear
        tf.textColor = UIColor(named: Colors.Primary_Color)
        tf.font = regular(size: 15)
        tf.layer.cornerRadius = 10 * appConstant.heightRatio
        tf.layer.borderColor = UIColor(named: Colors.Primary_Color)?.cgColor
        tf.layer.borderWidth = 1 * appConstant.heightRatio
        tf.setPadding(left: 10, right: 10)
        tf.addToolbarInputAccessoryView(toolbarHeight: 44)
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    lazy var nextBtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Continue", for: .normal)
        btn.layer.shadowRadius = 0
        btn.backgroundColor = UIColor(named: Colors.Primary_Color)
        btn.addTarget(self, action: #selector(nextBtn_press), for: .touchUpInside)
        return btn
    }()
    
    var imagePicker = UIImagePickerController() // instantiates an image picker controller.
    var phoneNumber = ""
    var email = ""
    var password = "12345678"
    var passCode = ""
    var verificationCode = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        setUPUI()
    }
    
    func setUPUI()
    {
        let margin = view.layoutMarginsGuide
        view.addSubview(createPasstitlelbl)
        view.addSubview(createPassdesclbl)
        view.addSubview(PerimgView)
        PerimgView.addSubview(Perimg)
        view.addSubview(PerimgBtn)
        view.addSubview(nameTF)
        view.addSubview(nextBtn)

        
        NSLayoutConstraint.activate([
        
            createPasstitlelbl.topAnchor.constraint(equalTo: view.topAnchor, constant: 150 * appConstant.heightRatio),
            createPasstitlelbl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20 * appConstant.widthRatio),
            createPasstitlelbl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20 * appConstant.widthRatio),
        
            createPassdesclbl.topAnchor.constraint(equalTo: createPasstitlelbl.bottomAnchor, constant: 20 * appConstant.heightRatio),
            createPassdesclbl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12 * appConstant.widthRatio),
            createPassdesclbl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20 * appConstant.widthRatio),
        
            PerimgView.topAnchor.constraint(equalTo: createPassdesclbl.bottomAnchor, constant: 20 * appConstant.heightRatio),
            PerimgView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0 * appConstant.heightRatio),
            PerimgView.heightAnchor.constraint(equalToConstant: 98 * appConstant.heightRatio),
            PerimgView.widthAnchor.constraint(equalToConstant: 98 * appConstant.heightRatio),
            
            Perimg.topAnchor.constraint(equalTo: PerimgView.topAnchor, constant: 0 * appConstant.heightRatio),
            Perimg.leadingAnchor.constraint(equalTo: PerimgView.leadingAnchor,constant: 0 * appConstant.widthRatio),
            Perimg.trailingAnchor.constraint(equalTo: PerimgView.trailingAnchor,constant: 0 * appConstant.widthRatio),
            Perimg.bottomAnchor.constraint(equalTo: PerimgView.bottomAnchor, constant: 0 * appConstant.heightRatio),
            
            PerimgBtn.centerYAnchor.constraint(equalTo: PerimgView.centerYAnchor, constant: 28 * appConstant.heightRatio),
            PerimgBtn.centerXAnchor.constraint(equalTo: PerimgView.trailingAnchor,constant: -9 * appConstant.widthRatio),
            PerimgBtn.heightAnchor.constraint(equalToConstant: 24 * appConstant.heightRatio),
            PerimgBtn.widthAnchor.constraint(equalToConstant: 24 * appConstant.heightRatio),
            
            nameTF.topAnchor.constraint(equalTo: PerimgView.bottomAnchor, constant: 24 * appConstant.heightRatio),
            nameTF.leadingAnchor.constraint(equalTo: createPasstitlelbl.leadingAnchor),
            nameTF.trailingAnchor.constraint(equalTo: createPasstitlelbl.trailingAnchor),
            nameTF.heightAnchor.constraint(equalToConstant: 50 * appConstant.heightRatio),
            
            nextBtn.bottomAnchor.constraint(equalTo: margin.bottomAnchor, constant: -25 * appConstant.heightRatio),
            nextBtn.widthAnchor.constraint(equalToConstant: 150 * appConstant.heightRatio),
//            nextBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 21 * appConstant.widthRatio),
            nextBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -21 * appConstant.widthRatio),
            nextBtn.heightAnchor.constraint(equalToConstant: 50 * appConstant.heightRatio),
            
            
        ])
        
        
    }
    
    @objc func PerimgBtn_press()
    {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
          imagePicker.delegate = self
          imagePicker.sourceType = .photoLibrary
          imagePicker.allowsEditing = false

          present(imagePicker, animated: true, completion: nil)
         
        }
    }
    
    @objc func nextBtn_press()
    {
        let valid = validate()
        if !valid.1{
            alertWithMsg(vc: self, msg: valid.0 ?? "Name is required.", title: "Alert!")
        }else{
            signUP()
        }
    }
    
    func signUP()
    {
        
        guard let name = nameTF.text
        else
        {
            print("Form Invalid")
            return
        }
        guard imageName1 != nil else{
            print("Select image")
            return
        }
        
        ActivityIndicator.shared.showSpinner(onView: self.view)
        
            
            if let data = imageName1!.jpegData(compressionQuality: 0.5){
                
                let timeStamp: NSNumber = NSNumber(value: Int(NSDate().timeIntervalSince1970))
                
                let storageRef = Storage.storage().reference().child("Images").child("\(timeStamp.stringValue).png")
                
                storageRef.putData(data, metadata: nil) { (data, error) in
                    guard error == nil else{
                        return
                    }
                    storageRef.downloadURL { (url, error) in
                        guard let downloadURL = url else {
                              // Uh-oh, an error occurred!
                              return
                            }
                        guard let userID = Auth.auth().currentUser?.uid else{
                            return
                        }
                        
                        let val = ["name":name,"contact":self.phoneNumber,"image":downloadURL.absoluteString,"id":userID,"password":self.passCode ]
                        
                        self.regUserIntoDatabase(uid: userID, values: val)
                        
                    }
                   
                    
                }
                
                
             }
        
    }
    
    private func regUserIntoDatabase(uid: String, values: [String: Any])
    {
        let ref = Database.database().reference()
        let userRef = ref.child("users").child(uid)
        userRef.updateChildValues(values, withCompletionBlock: {(err, ref) in
            if err != nil {
                
                ActivityIndicator.shared.removeSpinner()
                
                print(err!)
                return
            }
            else {
                
                ActivityIndicator.shared.removeSpinner()

                print("DONE")
//                let vc = MessagesViewController()
//                let rootNC = UINavigationController(rootViewController: vc)
//                rootNC.navigationBar.isHidden = true
//                UIApplication.shared.windows.first?.rootViewController = rootNC
//                UIApplication.shared.windows.first?.makeKeyAndVisible()
                
                self.assignNill()
                
//                let vc = PermissionTutorialController()
//                let rootNC = UINavigationController(rootViewController: vc)
//                rootNC.navigationBar.isHidden = true
//                UIApplication.shared.windows.first?.rootViewController = rootNC
//                UIApplication.shared.windows.first?.makeKeyAndVisible()

                let vc = PricingPlanController()
                vc.modalPresentationStyle = .fullScreen
                self.present(vc,animated: true)
            }
            
        })
     
        
    }
    
    func assignNill() {
        
        AppUserDefault.shared.isFirstTime = true
        UserDefaults.standard.set(nil, forKey: "messages")
        
    }
    

}



extension CreateProfileController : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // MARK: - ImagePicker Delegate

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
           picker.dismiss(animated: true, completion: nil)
           if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
               Perimg.image = image

           //    let imageURL = info[UIImagePickerController.InfoKey.referenceURL] as! NSURL
               imageName1 = image
               if let url = info[UIImagePickerController.InfoKey.imageURL] as? URL {
                       editimagenameof = url.lastPathComponent
                     //  fileType = url.pathExtension
                   }
               
           }

       }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion:nil)
    }
    
}



extension CreateProfileController
{
    func validate() -> (String?, Bool) {
        
        let name = nameTF.text?.trimmingCharacters(in: .whitespacesAndNewlines)
   

        if name!.count  <= 2 {
            return("Name is required.", false)
        }
        
        if imageName1 == nil
        {
            return("Image is required.", false)
        }
        
        return(nil,true)
    }
    
}

