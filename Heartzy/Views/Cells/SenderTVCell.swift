//
//  SenderTVCell.swift
//  Heartzy
//
//  Created by waseeem on 11/7/22.
//

import UIKit

class SenderTVCell: UITableViewCell {
    
    lazy var senderimg : UIImageView = {
        let iv = UIImageView()
        iv.layer.cornerRadius = 18 * appConstant.heightRatio
        iv.layer.borderColor = UIColor(named: Colors.Primary_Color)?.cgColor
        iv.layer.borderWidth = 1
        iv.backgroundColor = .clear
        iv.image = UIImage(named: "")
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        return iv
    }()
    
    lazy var senderTextView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: Colors.Primary_Color)
//        view.layer.cornerRadius  = 36 * appConstant.heightRatio
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.25
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        view.layer.shadowRadius = 5 * appConstant.heightRatio
        view.clipsToBounds = false

        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var sendertext : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.backgroundColor = UIColor.clear
        lbl.textColor = UIColor.white
        lbl.textAlignment = .left
        lbl.font = UIFont.appFont(ofSize: 17, weight: .medium)
        lbl.text = "how are you"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    static var cellidentifier = "choosesenderCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style , reuseIdentifier : reuseIdentifier)
        self.backgroundColor = .clear
        let cellBGView = UIView()
        cellBGView.backgroundColor = .clear
        self.selectedBackgroundView = cellBGView
        setupCell()
        
        senderTextView.layer.maskedCorners = [.layerMinXMinYCorner,.layerMinXMaxYCorner,.layerMaxXMinYCorner]
        senderTextView.layer.cornerRadius = 20
        senderTextView.clipsToBounds = true
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
//        senderimg.image = nil
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    @objc func chnagebtn_press(){
        
    }
    
    func setupCell(){
        
        contentView.addSubview(senderimg)
        contentView.addSubview(senderTextView)
        senderTextView.addSubview(sendertext)

        
        NSLayoutConstraint.activate([
            
            senderimg.bottomAnchor.constraint(equalTo: senderTextView.bottomAnchor),
            senderimg.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20 * appConstant.widthRatio),
            senderimg.heightAnchor.constraint(equalToConstant: 36 * appConstant.heightRatio),
            senderimg.widthAnchor.constraint(equalToConstant: 36 * appConstant.heightRatio),
            
            
//            senderTextView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15 * appConstant.heightRatio),
//            senderTextView.trailingAnchor.constraint(equalTo: senderimg.leadingAnchor, constant: -12 * appConstant.widthRatio),
//            senderTextView.widthAnchor.constraint(lessThanOrEqualTo: contentView.widthAnchor, multiplier: 0.7 * appConstant.heightRatio),
//            senderTextView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15 * appConstant.heightRatio),

            senderTextView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10 * appConstant.heightRatio),
            senderTextView.trailingAnchor.constraint(equalTo: senderimg.leadingAnchor, constant: -12 * appConstant.widthRatio),
            senderTextView.widthAnchor.constraint(lessThanOrEqualTo: contentView.widthAnchor, multiplier: 0.7 * appConstant.heightRatio),
            senderTextView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10 * appConstant.heightRatio),


            
            sendertext.topAnchor.constraint(equalTo: senderTextView.topAnchor, constant: 10 * appConstant.heightRatio),
            sendertext.leadingAnchor.constraint(equalTo: senderTextView.leadingAnchor, constant: 15 * appConstant.widthRatio),
            sendertext.trailingAnchor.constraint(equalTo: senderTextView.trailingAnchor, constant: -15 * appConstant.widthRatio),
            sendertext.bottomAnchor.constraint(equalTo: senderTextView.bottomAnchor, constant: -10 * appConstant.heightRatio),
                        
            
        ])
        
        
    }
    

}
