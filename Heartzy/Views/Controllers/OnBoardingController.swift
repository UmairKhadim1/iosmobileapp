//
//  OnBoardingController.swift
//  Heartzy
//
//  Created by waseeem on 11/7/22.
//

import UIKit

protocol Slider1Delegate {
    func btn1Press()
}
protocol Slider2Delegate {
    func btn2Press()
}

protocol Slider3Delegate {
    func btn3Press()
}

protocol Slider4Delegate {
    func btn4Press()
}

var onboard1 : Slider1Delegate?
var onboard2 : Slider2Delegate?
var onboard3 : Slider3Delegate?
var onboard4 : Slider4Delegate?

class OnBoardingController: UIViewController {
    
    lazy var backgroundimg: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "BackgroundImg")
        iv.backgroundColor = UIColor.clear
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()

    lazy var scrollViewContainer : UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var scrollView = UIScrollView()

    lazy var pageController : UIPageControl = {
        let page = UIPageControl()
        page.backgroundColor = .clear
        page.isUserInteractionEnabled = false
        page.translatesAutoresizingMaskIntoConstraints = false
        page.tintColor = .red
        page.pageIndicatorTintColor = .lightGray
        page.currentPageIndicatorTintColor = UIColor(named: Colors.Primary_Color)
        return page
    }()
    
//    lazy var priviousBtn : CustomButton = {
//        let btn = CustomButton()
//        btn.translatesAutoresizingMaskIntoConstraints = false
//        btn.backgroundColor = .clear
//        btn.setTitleColor(UIColor(named: "lightColor"), for: .normal)
//        btn.setTitle("Previous", for: .normal)
//        btn.addTarget(self, action: #selector(priviousBtn_press), for: .touchUpInside)
//        return btn
//    }()
    
    
    lazy var backcurleimg: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "backcurleimg")
        iv.backgroundColor = UIColor.clear
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
//        iv.tintColor = UIColor(named: Colors.PrimaryAppColor1)
   //     iv.tintColor = redBtnColor()
        iv.clipsToBounds = true
        return iv
    }()
    
    
    lazy var sliderHLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = .white
        lbl.textAlignment = .right
        lbl.font = UIFont.appFont(ofSize: 24, weight: .bold)
        lbl.text = "Find your Doctor"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var descLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = .white
        lbl.textAlignment = .right
        lbl.font = UIFont.appFont(ofSize: 15, weight: .regular)
        lbl.text = "Find the best healthcare providers that suits you the most with the tap on your mobile phone."
        lbl.numberOfLines = 3
//        lbl.sizeToFit()
//        lbl.adjustsFontSizeToFitWidth = true
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    
    
    lazy var buttonView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: Colors.Primary_Color)
        view.clipsToBounds = true
        view.layer.cornerRadius = 8 * appConstant.heightRatio
     //   view.layer.borderWidth = 1
       // view.layer.borderColor = textfieldBorderColor()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var buttonLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.white
        lbl.textAlignment = .center
        lbl.backgroundColor = UIColor.clear
        lbl.font = UIFont.appFont(ofSize: 15, weight: .bold)
        lbl.text = "Next"
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var backbtnIcon: UIImageView = {
        let iv = UIImageView()
//        iv.image = UIImage(named: "backIcon")
        iv.backgroundColor = UIColor.clear
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        iv.tintColor = UIColor(named: Colors.Primary_Color)
   //     iv.tintColor = redBtnColor()
        iv.clipsToBounds = true
        return iv
    }()
    
    lazy var nextBtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor.clear
        btn.addTarget(self, action: #selector(nextBtn_press), for: .touchUpInside)
        return btn
    }()
    
    lazy var skipBtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor.clear
        btn.setTitle("Skip", for: .normal)
        btn.setTitleColor(UIColor(named: Colors.Primary_Color), for: .normal)
      //  btn.titleLabel?.font = UIFont(name:"Gill Sans", size: 20.0 * appConstant.heightRatio)
        btn.layer.shadowColor = UIColor.clear.cgColor
//        btn.isHidden = true
        btn.addTarget(self, action: #selector(skipBtn_press), for: .touchUpInside)
        return btn
    }()
    
    
    var gotouser = ""
    
    var slideX = 0
    var slides:[UIView] = []
    var currentPage = 0
    var firstPage = false
    var secondPage = false
    var thirdPage = false
    var fourthPage = false

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
//        self.pageController.isHidden = true
        slides = createSlides()
        scrollView.contentSize = CGSize(width: self.scrollViewContainer.frame.width * 3,height: self.scrollViewContainer.frame.height)
        scrollView.delegate = self
        scrollView.isScrollEnabled = true
        setupSlideScrollView(slides: slides)
        pageController.numberOfPages = slides.count
        scrollViewContainer.bringSubviewToFront(pageController)
        pageController.currentPage = 0
     //   self.priviousBtn.isHidden = true
     //   self.skipBtn.isHidden = true
        onBoard1Data = self
        onBoard2Data = self
        onBoard3Data = self
       
        setup()
        
//        if currentPage == 0
//        {
//            self.priviousBtn.isHidden = true
//        }
//        else{
//            self.priviousBtn.isHidden = false
//        }
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.firstPage = false
        self.secondPage = false
        self.thirdPage = false
    }
    
    func setup(){
        let margin = view.layoutMarginsGuide
        view.addSubview(backgroundimg)
        view.addSubview(scrollViewContainer)
        scrollViewContainer.addSubview(scrollView)
        view.addSubview(pageController)
        view.addSubview(skipBtn)
        view.addSubview(buttonView)
        buttonView.addSubview(buttonLbl)
        buttonView.addSubview(backbtnIcon)
        buttonView.addSubview(nextBtn)
        
        NSLayoutConstraint.activate([
            
            
            backgroundimg.topAnchor.constraint(equalTo: view.topAnchor, constant: -20 * appConstant.heightRatio),
            backgroundimg.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0 * appConstant.widthRatio),
            backgroundimg.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0 * appConstant.widthRatio),
            backgroundimg.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 20 * appConstant.heightRatio),

            scrollViewContainer.topAnchor.constraint(equalTo: margin.topAnchor,constant: 0 * appConstant.heightRatio),
            scrollViewContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 0 * appConstant.widthRatio),
            scrollViewContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: 0 * appConstant.widthRatio),
            scrollViewContainer.bottomAnchor.constraint(equalTo: margin.bottomAnchor,constant: 0 * appConstant.heightRatio),
            
            scrollView.leadingAnchor.constraint(equalTo: scrollViewContainer.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: scrollViewContainer.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: scrollViewContainer.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: scrollViewContainer.bottomAnchor,constant: 0 * appConstant.heightRatio),
            
            
            skipBtn.trailingAnchor.constraint(equalTo: buttonView.leadingAnchor,constant: -12 * appConstant.widthRatio),
            skipBtn.centerYAnchor.constraint(equalTo: buttonView.centerYAnchor),
            
            
            pageController.bottomAnchor.constraint(equalTo: buttonView.topAnchor, constant:  -100 * appConstant.heightRatio),
            pageController.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pageController.heightAnchor.constraint(equalToConstant: 12 * appConstant.heightRatio),

            
            buttonView.bottomAnchor.constraint(equalTo: margin.bottomAnchor, constant: -25 * appConstant.heightRatio),
            buttonView.widthAnchor.constraint(equalToConstant: 150 * appConstant.heightRatio),
//            buttonView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 21 * appConstant.widthRatio),
            buttonView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -21 * appConstant.widthRatio),
            buttonView.heightAnchor.constraint(equalToConstant: 50 * appConstant.heightRatio),
            
            nextBtn.topAnchor.constraint(equalTo: buttonView.topAnchor, constant: 0 * appConstant.heightRatio),
            nextBtn.leadingAnchor.constraint(equalTo: buttonView.leadingAnchor,constant: 0 * appConstant.widthRatio),
            nextBtn.trailingAnchor.constraint(equalTo: buttonView.trailingAnchor,constant: 0 * appConstant.widthRatio),
            nextBtn.bottomAnchor.constraint(equalTo: buttonView.bottomAnchor,constant: 0 * appConstant.heightRatio),
            
            buttonLbl.centerYAnchor.constraint(equalTo: buttonView.centerYAnchor, constant: 0 * appConstant.heightRatio),
            buttonLbl.centerXAnchor.constraint(equalTo: buttonView.centerXAnchor,constant: 0 * appConstant.widthRatio),
          //  buttonLbl.trailingAnchor.constraint(equalTo: buttonView.trailingAnchor,constant: 10 * appConstant.widthRatio),
//            buttonLbl.bottomAnchor.constraint(equalTo: buttonView.bottomAnchor,constant: -10 * appConstant.heightRatio),
            
            
            backbtnIcon.centerYAnchor.constraint(equalTo: buttonView.centerYAnchor, constant: 0 * appConstant.heightRatio),
            backbtnIcon.trailingAnchor.constraint(equalTo: buttonView.trailingAnchor,constant: -23 * appConstant.widthRatio),
            backbtnIcon.heightAnchor.constraint(equalToConstant: 17 * appConstant.heightRatio),
            backbtnIcon.widthAnchor.constraint(equalToConstant: 18 * appConstant.heightRatio),
            
            
        ])
        
        
    }
    
    @objc func skipBtn_press(){
        if currentPage == 2{
            UserDefaults.standard.setValue(true, forKey: "onboarding")
        }
        let vc = GetStartedController()
        let rootNC = UINavigationController(rootViewController: vc)
        rootNC.navigationBar.isHidden = true
        UIApplication.shared.windows.first?.rootViewController = rootNC
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
    
    
    @objc func priviousBtn_press(){
        if currentPage == 0 {
            
        }else if currentPage == 1{
            self.currentPage = 0
            self.slideX = 0
            self.firstPage = false
            self.secondPage = false
            self.thirdPage = false
            self.fourthPage = false
         //   self.priviousBtn.isHidden = true
            self.scrollView.setContentOffset(CGPoint(x:0, y:0/*, width:pageWidth, height:self.scrollView.frame.height)*/), animated: true)
        }else if currentPage == 2{
            self.currentPage = 1
            let pageWidth:CGFloat = self.scrollView.frame.width
            self.slideX = Int(pageWidth)
            self.firstPage = true
            self.secondPage = false
            self.thirdPage = false
            self.fourthPage = false
            self.scrollView.setContentOffset(CGPoint(x:slideX, y:0/*, width:pageWidth, height:self.scrollView.frame.height)*/), animated: true)
            
        }
    }
    
    func createSlides() -> [UIView] {
        
       
        let slide1 = OnBoarding1.init()
        slide1.skipdatadelegate = self
        
//        let slide2 = OnBoarding2.init()
       
        let slide3 = OnBoarding3.init()

        return [slide1,slide3]
    }
    
    func setupSlideScrollView(slides : [UIView]) {
        scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(slides.count), height: scrollViewContainer.frame.height)
        scrollView.isPagingEnabled = true
        
        for i in 0 ..< slides.count {
            slides[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: view.frame.height)
            scrollView.addSubview(slides[i])
        }
    }

}



extension OnBoardingController : UIScrollViewDelegate{
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x/view.frame.width)
        pageController.currentPage = Int(pageIndex)
    }
    @objc func moveToNextPage() {
        //width of scrollView
        let pageWidth:CGFloat = self.scrollView.frame.width
        //Maximum width of scrollView based on number of images needed to animate
        let maxWidth:CGFloat = pageWidth * CGFloat(slides.count)
        let contentOffset:CGFloat = self.scrollView.contentOffset.x
        var slideX = contentOffset + pageWidth
        if contentOffset + pageWidth == maxWidth{
        //When attain maximum width of scrollView make X = 0 to start from beginning.
            slideX = 0
        }
        
        currentPage = currentPage + 1
      
        self.scrollView.setContentOffset(CGPoint(x:slideX, y:0/*, width:pageWidth, height:self.scrollView.frame.height)*/), animated: true)
    }

}

extension OnBoardingController: OnBoard1Delegate,OnBoard2Delegate,OnBoard3Delegate , skipDelegate{
  
    
    func slider1BtnPress() {
        if !firstPage{
            firstPage = true
            self.skipBtn.isHidden = false
//            self.navigationController?.pushViewController(GetStarted1Controller(), animated: true)
            moveToNextPage()
            
            
        }
    }
    
    func slider2BtnPress() {
//        if !secondPage{
//            secondPage = true
//            self.skipBtn.isHidden = false
////            self.navigationController?.pushViewController(GetStarted1Controller(), animated: true)
//            moveToNextPage()
//        }
        if !thirdPage{
            thirdPage = true
            self.navigationController?.pushViewController(GetStartedController(), animated: true)
        }
        
        
    }
    
    func slider3BtnPress() {
        if !thirdPage{
            thirdPage = true
            self.navigationController?.pushViewController(GetStartedController(), animated: true)
        }
    }
    
    func skipBtnPress() {
        self.navigationController?.pushViewController(GetStartedController(), animated: true)
    }
    
    
    
    @objc func nextBtn_press(){
        if currentPage == 0{
            slider1BtnPress()
        }else if currentPage == 1 {
            slider2BtnPress()
        }else if currentPage == 2{
            slider3BtnPress()
        }
       
    }
}
