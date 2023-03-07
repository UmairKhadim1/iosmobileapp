//
//  SettingTVCell.swift
//  Heartzy
//
//  Created by waseeem on 11/8/22.
//

import UIKit

class SettingTVCell: UITableViewCell {
    
    lazy var cellView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: Colors.header_Color)
        view.layer.cornerRadius  = 15 * appConstant.heightRatio
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.25
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        view.layer.shadowRadius = 5 * appConstant.heightRatio
        view.clipsToBounds = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    lazy var itemImg : UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .clear
        iv.image = UIImage(named: "BotIcon")
        iv.tintColor = UIColor(named: Colors.Primary_Color)
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        return iv
    }()
    
    
    lazy var itemtext : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor(named: Colors.Primary_Color)
        lbl.textAlignment = .left
        lbl.font = UIFont.appFont(ofSize: 17, weight: .medium)
        lbl.text = "Templates"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var forwardImg : UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .clear
        iv.image = UIImage(named: "forwardIcon")
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        iv.tintColor = UIColor(named: Colors.Primary_Color)
        iv.clipsToBounds = true
        return iv
    }()
    
    static var cellidentifier = "chooserecieverCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style , reuseIdentifier : reuseIdentifier)
        self.backgroundColor = .clear
        let cellBGView = UIView()
        cellBGView.backgroundColor = .clear
        self.selectedBackgroundView = cellBGView
        setupCell()

    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
//        recieverimg.image = nil
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    @objc func chnagebtn_press(){
        
    }
    
    func setupCell(){
        
        contentView.addSubview(cellView)
        cellView.addSubview(itemImg)
        cellView.addSubview(itemtext)
        cellView.addSubview(forwardImg)
        
        NSLayoutConstraint.activate([
            
            cellView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10 * appConstant.heightRatio),
            cellView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10 * appConstant.widthRatio),
            cellView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10 * appConstant.widthRatio),
            cellView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10 * appConstant.heightRatio),
            
            itemImg.centerYAnchor.constraint(equalTo: cellView.centerYAnchor, constant: 0 * appConstant.heightRatio),
            itemImg.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            itemImg.heightAnchor.constraint(equalToConstant: 22 * appConstant.heightRatio),
            itemImg.widthAnchor.constraint(equalToConstant: 22 * appConstant.widthRatio),
            
            
            itemtext.centerYAnchor.constraint(equalTo: itemImg.centerYAnchor, constant: 0 * appConstant.heightRatio),
            itemtext.leadingAnchor.constraint(equalTo: itemImg.trailingAnchor, constant: 8 * appConstant.widthRatio),
            
            forwardImg.centerYAnchor.constraint(equalTo: itemImg.centerYAnchor, constant: 0 * appConstant.heightRatio),
            forwardImg.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -20 * appConstant.widthRatio),
            forwardImg.heightAnchor.constraint(equalToConstant: 18 * appConstant.heightRatio),
            forwardImg.widthAnchor.constraint(equalToConstant: 18 * appConstant.widthRatio),
                        
            
        ])
        
        
    }
    

}
