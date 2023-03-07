//
//  GetStartedController.swift
//  Heartzy
//
//  Created by waseeem on 11/7/22.
//

import UIKit

class GetStartedController: UIViewController {

    lazy var backgroundimg: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "getStartedbg")
        iv.backgroundColor = UIColor.clear
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    lazy var logoImg : UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "getStarted")
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        return iv
    }()
    
    lazy var nextBtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Let’s Get Started", for: .normal)
        btn.layer.shadowRadius = 0
        btn.backgroundColor = UIColor(named: Colors.Primary_Color)
        btn.addTarget(self, action: #selector(getStartedBtn_Press), for: .touchUpInside)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        setUPUI()
    }
    
    func setUPUI()
    {
        let margin = view.layoutMarginsGuide
        view.addSubview(backgroundimg)
        view.addSubview(logoImg)
        view.addSubview(nextBtn)
        
        NSLayoutConstraint.activate([
        
            backgroundimg.topAnchor.constraint(equalTo: view.topAnchor, constant: 0 * appConstant.heightRatio),
            backgroundimg.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0 * appConstant.widthRatio),
            backgroundimg.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0 * appConstant.widthRatio),
            backgroundimg.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0 * appConstant.heightRatio),
            
            logoImg.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0 * appConstant.widthRatio),
            logoImg.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0 * appConstant.widthRatio),
            logoImg.widthAnchor.constraint(equalToConstant: 260 * appConstant.heightRatio),
            logoImg.heightAnchor.constraint(equalToConstant: 354 * appConstant.heightRatio),
            
            nextBtn.bottomAnchor.constraint(equalTo: margin.bottomAnchor, constant: -25 * appConstant.heightRatio),
            nextBtn.widthAnchor.constraint(equalToConstant: 171 * appConstant.heightRatio),
            nextBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -21 * appConstant.widthRatio),
            nextBtn.heightAnchor.constraint(equalToConstant: 50 * appConstant.heightRatio),
        
        ])
        
    }
    
    @objc func getStartedBtn_Press(){

        self.navigationController?.pushViewController(PhoneNumberController(), animated: true)
        
    }
    
}
