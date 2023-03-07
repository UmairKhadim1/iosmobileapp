//
//  HowToLockController.swift
//  Heartzy
//
//  Created by waseeem on 12/16/22.
//

import UIKit
import AVKit

class HowToLockController: AVPlayerViewController {
    
    
    lazy var LogoImg : UIView = {
        var img  = UIView()
        img.clipsToBounds = true
        img.contentMode = .scaleAspectFill
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
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
    
    var avPlayer: AVPlayer?
    
    var isFromSetting = false

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        setUPUI()
        
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        setupAndPlay()
        
        if isFromSetting{
            
        }
        else
        {
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 39.0){
                
                let vc = GuidedAccessController()
                self.navigationController?.pushViewController(vc, animated: true)
                
                
            }
        }
        
        
    }
    
    
    func setUPUI()
    {
        
        let margin = view.layoutMarginsGuide
        view.addSubview(LogoImg)
        view.addSubview(nextBtn)

        
        NSLayoutConstraint.activate([
            
        LogoImg.topAnchor.constraint(equalTo: view.topAnchor, constant: 0 * appConstant.heightRatio),
        LogoImg.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0 * appConstant.widthRatio),
        LogoImg.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0 * appConstant.widthRatio),
        LogoImg.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0 * appConstant.heightRatio),
        
        
        nextBtn.bottomAnchor.constraint(equalTo: margin.bottomAnchor, constant: -25 * appConstant.heightRatio),
        nextBtn.widthAnchor.constraint(equalToConstant: 150 * appConstant.heightRatio),
//            nextBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 21 * appConstant.widthRatio),
        nextBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -21 * appConstant.widthRatio),
        nextBtn.heightAnchor.constraint(equalToConstant: 50 * appConstant.heightRatio),
        
        ])
        
    }
    
    func setupAndPlay() {
        
          let filepath: String? = Bundle.main.path(forResource: "HEARTSY_TUTORIAL", ofType: "mp4")
          let fileURL = URL.init(fileURLWithPath: filepath ?? "")

          // Setup AVPlayer
          avPlayer = AVPlayer(url: fileURL)
          self.player = avPlayer
//        self.player?.rate = 0.5; // Half speed
          let playerLayer = AVPlayerLayer(player: avPlayer)
        playerLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
           // add it to your view
           playerLayer.frame = self.LogoImg.bounds
          LogoImg.layer.addSublayer(playerLayer)
        
        
//          self.view.frame = CGRect(x: 44, y: 128, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)

          // Turn on video controlls
          self.showsPlaybackControls = true
        
          self.entersFullScreenWhenPlaybackBegins = true
        
          // play video
          self.player?.play()
      }
    
    
    @objc func nextBtn_press()
    {
        
        let vc = GuidedAccessController()
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    

}
