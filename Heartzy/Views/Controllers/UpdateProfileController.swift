//
//  UpdateProfileController.swift
//  Heartzy
//
//  Created by waseeem on 11/11/22.
//

import UIKit
import FirebaseAuth
import Firebase

var updateimageName1 : UIImage?
var updateimagenameof = ""

class UpdateProfileController: UIViewController {
    
    lazy var headerView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: Colors.header_Color)
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.25
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        view.layer.shadowRadius = 5 * appConstant.heightRatio
        view.clipsToBounds = false
//        view.layer.maskedCorners = [.layerMinXMaxYCorner,.layerMaxXMaxYCorner]
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var backBtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor.clear
        btn.layer.cornerRadius = 15 * appConstant.heightRatio
        btn.layer.shadowOpacity = 0.5
        btn.layer.shadowColor = UIColor.clear.cgColor
        btn.contentMode = .scaleToFill
        btn.setImage(UIImage(named: "backBtnIcon"), for: .normal)
        btn.clipsToBounds = true
        btn.tintColor = UIColor(named: Colors.Primary_Color)
        btn.addTarget(self, action: #selector(backBtn_Press), for: .touchUpInside)
        return btn
    }()
    
    lazy var resetTitlelbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor(named: Colors.Primary_Color)
        lbl.textAlignment = .center
        lbl.font = UIFont.appFont(ofSize: 24, weight: .semibold)
        lbl.text = "Profile"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()

    lazy var createPasstitlelbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor(named: Colors.Primary_Color)
        lbl.textAlignment = .center
        lbl.font = regular(size: 24)
        lbl.text = "Update Profile"
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
        btn.setTitle("Update", for: .normal)
        btn.layer.shadowRadius = 0
        btn.backgroundColor = UIColor(named: Colors.Primary_Color)
        btn.addTarget(self, action: #selector(nextBtn_press), for: .touchUpInside)
        return btn
    }()
    
    var imagePicker = UIImagePickerController() // instantiates an image picker controller.
    
    var theData = [String : Any]()

    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        setUPUI()
        
        getdata()
        
        
        self.nameTF.text = theData["name"] as? String
        self.Perimg.setImageFrom(theData["image"] as? String ?? "")
        let url = URL(string: theData["image"] as? String ?? "")

        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url ?? URL(fileURLWithPath: "")) {
                        if let image = UIImage(data: data) {
                            DispatchQueue.main.async {
                                self?.Perimg.image = image
                                updateimageName1 = image.fixedOrientation() ?? UIImage()
                            }
                        }
                    }
                }
        
    }
    
    func setUPUI()
    {
        let margin = view.layoutMarginsGuide
        view.addSubview(headerView)
        headerView.addSubview(backBtn)
        headerView.addSubview(resetTitlelbl)
        view.addSubview(createPasstitlelbl)
        view.addSubview(createPassdesclbl)
        view.addSubview(PerimgView)
        PerimgView.addSubview(Perimg)
        view.addSubview(PerimgBtn)
        view.addSubview(nameTF)
        view.addSubview(nextBtn)

        
        NSLayoutConstraint.activate([
            
            headerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0 * appConstant.heightRatio),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0 * appConstant.widthRatio),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -0 * appConstant.widthRatio),
            headerView.heightAnchor.constraint(equalToConstant: 120 * appConstant.heightRatio),
            
            backBtn.centerYAnchor.constraint(equalTo: headerView.centerYAnchor, constant: 0 * appConstant.heightRatio),
            backBtn.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            backBtn.heightAnchor.constraint(equalToConstant: 46 * appConstant.heightRatio),
            backBtn.widthAnchor.constraint(equalToConstant: 46 * appConstant.heightRatio),
            
            resetTitlelbl.centerYAnchor.constraint(equalTo: headerView.centerYAnchor, constant: 0 * appConstant.heightRatio),
            resetTitlelbl.centerXAnchor.constraint(equalTo: headerView.centerXAnchor, constant: 0 * appConstant.heightRatio),
            resetTitlelbl.leadingAnchor.constraint(equalTo: backBtn.trailingAnchor, constant: 12 * appConstant.heightRatio),
            resetTitlelbl.centerYAnchor.constraint(equalTo: backBtn.centerYAnchor, constant: 0 * appConstant.heightRatio),
        
            createPasstitlelbl.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 76 * appConstant.heightRatio),
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
    
    func getdata()
    {
        let ref = Database.database().reference()
        guard let uid = Auth.auth().currentUser?.uid else {
            print("User Not Found")
            return
        }
        ref.child("users").child(uid).observe(.value, with: { (snapshot) in
            if let dictionary = snapshot.value as? [String : Any] {
                self.theData = dictionary as? [String: Any] ?? [:]
                print("The User is",dictionary)
            }
        }) { (error) in
             guard error == nil else{
                               return
                           }
        }
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
            updateUser()
        }
    }
    
    func updateUser()
    {
                    
        ActivityIndicator.shared.showSpinner(onView: self.view)
        
        guard let name = nameTF.text
        else
        {
            print("Form Invalid")
            return
        }
        
            if let data = updateimageName1!.jpegData(compressionQuality: 0.5){
                
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
            
                        let val = ["name":name,"contact": self.theData["contact"] as? String,"image":downloadURL.absoluteString,"id":self.theData["id"] as? String ]
                        
                        self.regUserIntoDatabase(uid: self.theData["id"] as? String ?? "", values: val)
                        
                    }
                   
                    
                }
                
                
             }
        
    }
    
    private func regUserIntoDatabase(uid: String, values: [String: Any])
    {

        let ref = Database.database().reference()
        let userRef = ref.child("users").child(uid)
        userRef.updateChildValues(values, withCompletionBlock: {(err, ref) in

            ActivityIndicator.shared.removeSpinner()

            if err != nil {
                ActivityIndicator.shared.removeSpinner()
                print(err!)
                return
            }
            else {
                ActivityIndicator.shared.removeSpinner()
                print("DONE")
//                self.navigationController?.pushViewController(MessagesViewController(), animated: true)
                self.navigationController?.popViewController(animated: true)

            }
        })
    }
    
    
    
    
    
    @objc func backBtn_Press()
    {
        self.navigationController?.popViewController(animated: true)
    }
    

}



extension UpdateProfileController : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // MARK: - ImagePicker Delegate

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
           picker.dismiss(animated: true, completion: nil)
           if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
               Perimg.image = image

           //    let imageURL = info[UIImagePickerController.InfoKey.referenceURL] as! NSURL
               updateimageName1 = image
               if let url = info[UIImagePickerController.InfoKey.imageURL] as? URL {
                       updateimagenameof = url.lastPathComponent
                     //  fileType = url.pathExtension
                   }
               
           }

       }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion:nil)
    }

}



extension UpdateProfileController
{
    func validate() -> (String?, Bool) {
        
        let name = nameTF.text?.trimmingCharacters(in: .whitespacesAndNewlines)
   

        if name!.count  <= 2 {
            return("Name is required.", false)
        }
        
        if updateimageName1 == nil
        {
            return("Image is required.", false)
        }
        
        return(nil,true)
    }
        
}

