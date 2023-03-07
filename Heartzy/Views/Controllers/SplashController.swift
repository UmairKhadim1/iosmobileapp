//
//  SplashController.swift
//  Heartzy
//
//  Created by waseeem on 11/11/22.
//

import UIKit

class SplashController: UIViewController {

    lazy var LogoImg : UIImageView = {
        var img  = UIImageView()
        img.image = UIImage(named: "splash")
        img.clipsToBounds = true
        img.contentMode = .scaleAspectFill
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()

    var isFromLauch = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        setUPUI()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0){

            if self.isFromLauch{
                
                let vc = GuidedAccessController()
                vc.isFromLauch = true
                self.navigationController?.pushViewController(vc, animated: true)

            }
            else
            {
                self.navigationController?.pushViewController(OnBoardingController(), animated: true)
            }
            
        }
        
    }
    
    func setUPUI()
    {
        view.addSubview(LogoImg)
        
        
        NSLayoutConstraint.activate([
        
            LogoImg.topAnchor.constraint(equalTo: view.topAnchor, constant: 0 * appConstant.heightRatio),
            LogoImg.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0 * appConstant.widthRatio),
            LogoImg.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0 * appConstant.widthRatio),
            LogoImg.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0 * appConstant.heightRatio),
        
        ])
        
        
    }


}
