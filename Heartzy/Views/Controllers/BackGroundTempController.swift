//
//  BackGroundTempController.swift
//  Heartzy
//
//  Created by waseeem on 11/8/22.
//

import UIKit

class BackGroundTempController: UIViewController {

    lazy var headerView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: Colors.header_Color)
//        view.layer.cornerRadius  = 36 * appConstant.heightRatio
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
    
    lazy var chatThemeTitlelbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor(named: Colors.Primary_Color)
        lbl.textAlignment = .center
        lbl.font = UIFont.appFont(ofSize: 22, weight: .semibold)
        lbl.text = "Background Templates"
        lbl.numberOfLines = 0
//        lbl.adjustsFontSizeToFitWidth = true
//        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var DataTableview : UITableView = {
        let tv = UITableView()
        tv.showsVerticalScrollIndicator = false
        tv.backgroundColor = UIColor.white
        tv.layer.cornerRadius = 18 * appConstant.heightRatio
        tv.clipsToBounds = true
        tv.separatorStyle = .none
        tv.separatorStyle = .none
        tv.isScrollEnabled = true
        tv.isUserInteractionEnabled = true
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    let dataArray = ["None","Confetti","Dark Academia","Night Sky","Stars","Flowers"]
    let imgArray = ["None","Cottagecore","DarkAcademia","NightSky","Stars","Flowers"]



    override func viewDidLoad() {
        super.viewDidLoad()

        DataTableview.delegate = self
        DataTableview.dataSource = self
        DataTableview.register(chatThemeTVCell
        .self, forCellReuseIdentifier: chatThemeTVCell.cellidentifier)
        
        view.backgroundColor = .white
        setUPUI()
    }
    
    func setUPUI()
    {
        view.addSubview(headerView)
        headerView.addSubview(backBtn)
        headerView.addSubview(chatThemeTitlelbl)
        view.addSubview(DataTableview)

        
        NSLayoutConstraint.activate([
            
            headerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0 * appConstant.heightRatio),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0 * appConstant.widthRatio),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -0 * appConstant.widthRatio),
            headerView.heightAnchor.constraint(equalToConstant: 120 * appConstant.heightRatio),
            
            backBtn.centerYAnchor.constraint(equalTo: headerView.centerYAnchor, constant: 0 * appConstant.heightRatio),
            backBtn.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            backBtn.heightAnchor.constraint(equalToConstant: 46 * appConstant.heightRatio),
            backBtn.widthAnchor.constraint(equalToConstant: 46 * appConstant.heightRatio),
            
            chatThemeTitlelbl.centerYAnchor.constraint(equalTo: headerView.centerYAnchor, constant: 0 * appConstant.heightRatio),
            chatThemeTitlelbl.centerXAnchor.constraint(equalTo: headerView.centerXAnchor, constant: 0 * appConstant.heightRatio),
            chatThemeTitlelbl.leadingAnchor.constraint(equalTo: backBtn.trailingAnchor, constant: 12 * appConstant.heightRatio),
            chatThemeTitlelbl.centerYAnchor.constraint(equalTo: backBtn.centerYAnchor, constant: 0 * appConstant.heightRatio),
            
            DataTableview.topAnchor.constraint(equalTo: self.headerView.bottomAnchor, constant: 10 * appConstant.heightRatio),
            DataTableview.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10 * appConstant.widthRatio),
            DataTableview.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10 * appConstant.widthRatio),
            DataTableview.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50 * appConstant.widthRatio),
            
            ])
        
    }
    
    
    @objc func backBtn_Press()
    {
        self.navigationController?.popViewController(animated: true)
    }

}


extension BackGroundTempController :  UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        let cell = DataTableview.dequeueReusableCell(withIdentifier: chatThemeTVCell.cellidentifier, for: indexPath) as! chatThemeTVCell
            
        cell.itemtext.text = dataArray[indexPath.row]
        cell.itemImg.image = UIImage(named: imgArray[indexPath.row])
        
        
        if imgArray[indexPath.row] == "None" && AppUserDefault.shared.theme1 == true
        {
            DispatchQueue.main.async {
                cell.toggleimg.setImage(UIImage(named: "checkedIcon"), for: .normal)
            }
        }
        else if imgArray[indexPath.row] == "Cottagecore" && AppUserDefault.shared.theme2 == true
        {
            DispatchQueue.main.async {
                cell.toggleimg.setImage(UIImage(named: "checkedIcon"), for: .normal)
            }
        }
        else if imgArray[indexPath.row] == "DarkAcademia" && AppUserDefault.shared.theme3 == true
        {
            DispatchQueue.main.async {
                cell.toggleimg.setImage(UIImage(named: "checkedIcon"), for: .normal)
            }
        }
        else if imgArray[indexPath.row] == "NightSky" && AppUserDefault.shared.theme4 == true
        {
            DispatchQueue.main.async {
                cell.toggleimg.setImage(UIImage(named: "checkedIcon"), for: .normal)
            }
        }
        else if imgArray[indexPath.row] == "Stars" && AppUserDefault.shared.theme5 == true
        {
            DispatchQueue.main.async {
                cell.toggleimg.setImage(UIImage(named: "checkedIcon"), for: .normal)
            }
        }
        else if imgArray[indexPath.row] == "Flowers" && AppUserDefault.shared.theme6 == true
        {
            DispatchQueue.main.async {
                cell.toggleimg.setImage(UIImage(named: "checkedIcon"), for: .normal)
            }
        }
        else
        {
            DispatchQueue.main.async {
                cell.toggleimg.setImage(UIImage(named: "uncheckedIcon"), for: .normal)
            }
        }
        
        return cell
            
    
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {


        let cell = DataTableview.cellForRow(at: indexPath) as! chatThemeTVCell
        
        cell.toggleimg.setImage(UIImage(named: "checkedIcon"), for: .normal)
        
        if indexPath.row == 0
        {
            AppUserDefault.shared.theme1 = true
            
            AppUserDefault.shared.theme2 = false
            AppUserDefault.shared.theme3 = false
            AppUserDefault.shared.theme4 = false
            AppUserDefault.shared.theme5 = false
            AppUserDefault.shared.theme6 = false
            DataTableview.reloadData()

        }
        else if indexPath.row == 1
        {
            AppUserDefault.shared.theme2 = true
            
            AppUserDefault.shared.theme1 = false
            AppUserDefault.shared.theme3 = false
            AppUserDefault.shared.theme4 = false
            AppUserDefault.shared.theme5 = false
            AppUserDefault.shared.theme6 = false
            DataTableview.reloadData()
        }
        else if indexPath.row == 2
        {
            AppUserDefault.shared.theme3 = true
            
            AppUserDefault.shared.theme1 = false
            AppUserDefault.shared.theme2 = false
            AppUserDefault.shared.theme4 = false
            AppUserDefault.shared.theme5 = false
            AppUserDefault.shared.theme6 = false
            DataTableview.reloadData()
        }
        else if indexPath.row == 3
        {
            AppUserDefault.shared.theme4 = true
            
            AppUserDefault.shared.theme1 = false
            AppUserDefault.shared.theme2 = false
            AppUserDefault.shared.theme3 = false
            AppUserDefault.shared.theme5 = false
            AppUserDefault.shared.theme6 = false
            DataTableview.reloadData()
        }
        else if indexPath.row == 4
        {
            AppUserDefault.shared.theme5 = true
            
            AppUserDefault.shared.theme1 = false
            AppUserDefault.shared.theme2 = false
            AppUserDefault.shared.theme3 = false
            AppUserDefault.shared.theme4 = false
            AppUserDefault.shared.theme6 = false
            DataTableview.reloadData()
        }
        else if indexPath.row == 5
        {
            AppUserDefault.shared.theme6 = true
            
            AppUserDefault.shared.theme1 = false
            AppUserDefault.shared.theme2 = false
            AppUserDefault.shared.theme3 = false
            AppUserDefault.shared.theme4 = false
            AppUserDefault.shared.theme5 = false
            DataTableview.reloadData()
        }
        

    }

    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {

        let cell = DataTableview.cellForRow(at: indexPath) as! chatThemeTVCell
        
        cell.toggleimg.setImage(UIImage(named: "uncheckedIcon"), for: .normal)
        
        if indexPath.row == 0
        {
            AppUserDefault.shared.theme1 = false
        }
        else if indexPath.row == 1
        {
            AppUserDefault.shared.theme2 = false
        }
        else if indexPath.row == 2
        {
            AppUserDefault.shared.theme3 = false
        }
        else if indexPath.row == 3
        {
            AppUserDefault.shared.theme4 = false
        }
        else if indexPath.row == 4
        {
            AppUserDefault.shared.theme5 = false
        }
        else if indexPath.row == 5
        {
            AppUserDefault.shared.theme6 = false
        }
        
    }
    
    
    
}
