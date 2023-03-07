//
//  BotIconController.swift
//  Heartzy
//
//  Created by waseeem on 11/8/22.
//

import UIKit

class BotIconController: UIViewController {

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
        lbl.text = "Bot Icons"
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
    
    let dataArray = ["Bot 1","Bot 2","Bot 3","Bot 4","Bot 5"]
    let imgArray = ["Bot1","Bot2","Bot3","Bot4","Bot5"]



    override func viewDidLoad() {
        super.viewDidLoad()

        DataTableview.delegate = self
        DataTableview.dataSource = self
        DataTableview.register(chatThemeTVCell.self, forCellReuseIdentifier: chatThemeTVCell.cellidentifier)
        
        view.backgroundColor = .white
        setUPUI()
   
        DataTableview.allowsSelection = true

            // ensure that deselect is called on all other cells when a cell is selected
        DataTableview.allowsMultipleSelection = false
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


extension BotIconController :  UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        let cell = DataTableview.dequeueReusableCell(withIdentifier: chatThemeTVCell.cellidentifier, for: indexPath) as! chatThemeTVCell
            
        cell.itemtext.text = dataArray[indexPath.row]
        cell.itemImg.image = UIImage(named: imgArray[indexPath.row])
//        cell.toggleimg.tag = indexPath.row
//        cell.toggleimg.addTarget(self, action: #selector(tappedMe), for: .touchUpInside)
        if imgArray[indexPath.row] == "Bot1" && AppUserDefault.shared.bot1 == true
        {
            DispatchQueue.main.async {
                cell.toggleimg.setImage(UIImage(named: "checkedIcon"), for: .normal)
            }
        }
        else if imgArray[indexPath.row] == "Bot2" && AppUserDefault.shared.bot2 == true
        {
            DispatchQueue.main.async {
                cell.toggleimg.setImage(UIImage(named: "checkedIcon"), for: .normal)
            }
        }
        else if imgArray[indexPath.row] == "Bot3" && AppUserDefault.shared.bot3 == true
        {
            DispatchQueue.main.async {
                cell.toggleimg.setImage(UIImage(named: "checkedIcon"), for: .normal)
            }
        }
        else if imgArray[indexPath.row] == "Bot4" && AppUserDefault.shared.bot4 == true
        {
            DispatchQueue.main.async {
                cell.toggleimg.setImage(UIImage(named: "checkedIcon"), for: .normal)
            }
        }
        else if imgArray[indexPath.row] == "Bot5" && AppUserDefault.shared.bot5 == true
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
    
    
    @objc
    func tappedMe(_ sender: UIButton) {
        
//
//        if sender.tag == 0
//        {
//            if sender.isSelected == true
//            {
//                sender.isSelected = false
//                sender.setImage(UIImage(named: "uncheckedIcon"), for: .normal)
//
//            }
//            else
//            {
//                sender.isSelected = true
//                sender.setImage(UIImage(named: "checkedIcon"), for: .normal)
//            }
//        }
//        else if sender.tag == 1
//        {
//            if sender.isSelected == true
//            {
//                sender.isSelected = false
//                sender.setImage(UIImage(named: "uncheckedIcon"), for: .normal)
//
//            }
//            else
//            {
//                sender.isSelected = true
//                sender.setImage(UIImage(named: "checkedIcon"), for: .normal)
//            }
//        }
//        else if sender.tag == 2
//        {
//            if sender.isSelected == true
//            {
//                sender.isSelected = false
//                sender.setImage(UIImage(named: "uncheckedIcon"), for: .normal)
//
//            }
//            else
//            {
//                sender.isSelected = true
//                sender.setImage(UIImage(named: "checkedIcon"), for: .normal)
//            }
//        }
//        else if sender.tag == 3
//        {
//            if sender.isSelected == true
//            {
//                sender.isSelected = false
//                sender.setImage(UIImage(named: "uncheckedIcon"), for: .normal)
//
//            }
//            else
//            {
//                sender.isSelected = true
//                sender.setImage(UIImage(named: "checkedIcon"), for: .normal)
//            }
//        }
//        else if sender.tag == 4
//        {
//            if sender.isSelected == true
//            {
//                sender.isSelected = false
//                sender.setImage(UIImage(named: "uncheckedIcon"), for: .normal)
//
//            }
//            else
//            {
//                sender.isSelected = true
//                sender.setImage(UIImage(named: "checkedIcon"), for: .normal)
//            }
//        }
//
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {


        let cell = DataTableview.cellForRow(at: indexPath) as! chatThemeTVCell
        
        cell.toggleimg.setImage(UIImage(named: "checkedIcon"), for: .normal)
        
        if indexPath.row == 0
        {
            AppUserDefault.shared.bot1 = true
            
            AppUserDefault.shared.bot2 = false
            AppUserDefault.shared.bot3 = false
            AppUserDefault.shared.bot4 = false
            AppUserDefault.shared.bot5 = false
            DataTableview.reloadData()

        }
        else if indexPath.row == 1
        {
            AppUserDefault.shared.bot2 = true
            
            AppUserDefault.shared.bot1 = false
            AppUserDefault.shared.bot3 = false
            AppUserDefault.shared.bot4 = false
            AppUserDefault.shared.bot5 = false
            DataTableview.reloadData()
        }
        else if indexPath.row == 2
        {
            AppUserDefault.shared.bot3 = true
            
            AppUserDefault.shared.bot1 = false
            AppUserDefault.shared.bot2 = false
            AppUserDefault.shared.bot4 = false
            AppUserDefault.shared.bot5 = false
            DataTableview.reloadData()
        }
        else if indexPath.row == 3
        {
            AppUserDefault.shared.bot4 = true
            
            AppUserDefault.shared.bot1 = false
            AppUserDefault.shared.bot2 = false
            AppUserDefault.shared.bot3 = false
            AppUserDefault.shared.bot5 = false
            DataTableview.reloadData()
        }
        else if indexPath.row == 4
        {
            AppUserDefault.shared.bot5 = true
            
            AppUserDefault.shared.bot1 = false
            AppUserDefault.shared.bot2 = false
            AppUserDefault.shared.bot3 = false
            AppUserDefault.shared.bot4 = false
            DataTableview.reloadData()
        }
        

    }

    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {

        let cell = DataTableview.cellForRow(at: indexPath) as! chatThemeTVCell
        
        cell.toggleimg.setImage(UIImage(named:
                                            "uncheckedIcon"), for: .normal)
        
        if indexPath.row == 0
        {
            AppUserDefault.shared.bot1 = false
        }
        else if indexPath.row == 1
        {
            AppUserDefault.shared.bot2 = false
        }
        else if indexPath.row == 2
        {
            AppUserDefault.shared.bot3 = false
        }
        else if indexPath.row == 3
        {
            AppUserDefault.shared.bot4 = false
        }
        else if indexPath.row == 4
        {
            AppUserDefault.shared.bot5 = false
        }
        
    }
    
    
}
