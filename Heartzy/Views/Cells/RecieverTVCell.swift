//
//  RecieverTVCell.swift
//  Heartzy
//
//  Created by waseeem on 11/7/22.
//

import UIKit

class RecieverTVCell: UITableViewCell {

    lazy var recieverimg : UIImageView = {
        let iv = UIImageView()
        iv.layer.cornerRadius = 18 * appConstant.heightRatio
        iv.layer.borderColor = UIColor(named: Colors.Primary_Color)?.cgColor
        iv.layer.borderWidth = 1
        iv.backgroundColor = .clear
        iv.image = UIImage(named: "Bot4")
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        return iv
    }()
    
    lazy var recieverTextView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: Colors.light_Color)
//        view.layer.cornerRadius  = 36 * appConstant.heightRatio
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.25
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        view.layer.shadowRadius = 5 * appConstant.heightRatio
        view.clipsToBounds = false

        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    lazy var recievertext : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor(named: Colors.Primary_Color)
        lbl.textAlignment = .left
        lbl.font = UIFont.appFont(ofSize: 17, weight: .medium)
        lbl.text = "Typing..."
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    static var cellidentifier = "chooserecieverCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style , reuseIdentifier : reuseIdentifier)
        self.backgroundColor = .clear
        let cellBGView = UIView()
        cellBGView.backgroundColor = .clear
        self.selectedBackgroundView = cellBGView
        setupCell()
        

        recieverTextView.layer.maskedCorners = [.layerMaxXMaxYCorner,.layerMaxXMinYCorner,.layerMinXMinYCorner]
        recieverTextView.layer.cornerRadius = 20
        recieverTextView.clipsToBounds = true
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
        
        contentView.addSubview(recieverimg)
        contentView.addSubview(recieverTextView)
        recieverTextView.addSubview(recievertext)

        
        NSLayoutConstraint.activate([
            
            recieverimg.bottomAnchor.constraint(equalTo: recieverTextView.bottomAnchor),
            recieverimg.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            recieverimg.heightAnchor.constraint(equalToConstant: 36 * appConstant.heightRatio),
            recieverimg.widthAnchor.constraint(equalToConstant: 36 * appConstant.heightRatio),
            
            
//            recieverTextView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15 * appConstant.heightRatio),
//            recieverTextView.leadingAnchor.constraint(equalTo: recieverimg.trailingAnchor, constant: 12 * appConstant.widthRatio),
//            recieverTextView.widthAnchor.constraint(lessThanOrEqualTo: contentView.widthAnchor, multiplier: 0.7 * appConstant.heightRatio),
//            recieverTextView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15 * appConstant.heightRatio),


            recieverTextView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10 * appConstant.heightRatio),
            recieverTextView.leadingAnchor.constraint(equalTo: recieverimg.trailingAnchor, constant: 12 * appConstant.widthRatio),
            recieverTextView.widthAnchor.constraint(lessThanOrEqualTo: contentView.widthAnchor, multiplier: 0.7 * appConstant.heightRatio),

            recieverTextView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10 * appConstant.heightRatio),

            
            recievertext.topAnchor.constraint(equalTo: recieverTextView.topAnchor, constant: 10 * appConstant.heightRatio),
            recievertext.leadingAnchor.constraint(equalTo: recieverTextView.leadingAnchor, constant: 15 * appConstant.widthRatio),
            recievertext.trailingAnchor.constraint(equalTo: recieverTextView.trailingAnchor, constant: -15 * appConstant.widthRatio),
            recievertext.bottomAnchor.constraint(equalTo: recieverTextView.bottomAnchor, constant: -10 * appConstant.heightRatio),

                        
            
        ])
        
        
    }
    
    
}
