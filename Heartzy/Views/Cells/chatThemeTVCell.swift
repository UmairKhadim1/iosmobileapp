//
//  chatThemeTVCell.swift
//  Heartzy
//
//  Created by waseeem on 11/8/22.
//

import UIKit

class chatThemeTVCell: UITableViewCell {

    lazy var itemImg : UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .clear
        iv.layer.cornerRadius = 12 * appConstant.heightRatio
        iv.image = UIImage(named: "uncheckedIcon")
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
        lbl.text = ""
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var toggleimg : UIButton = {
        var button = UIButton()
        button.backgroundColor = .clear
        button.setImage(UIImage(named: "uncheckedIcon"), for: .normal)
//        button.addTarget(self, action: #selector(backbtn_Press), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
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
    
    override var isSelected: Bool {
        didSet {
              contentView.backgroundColor =  isSelected ? UIColor(named: Colors.Primary_Color) : .white
            toggleimg.setImage(UIImage(named: isSelected ? "checkedIcon" : "uncheckedIcon"), for: .normal)
            
        }
    }
    
    func setupCell(){
        
        contentView.addSubview(itemImg)
        contentView.addSubview(itemtext)
        contentView.addSubview(toggleimg)
        
        NSLayoutConstraint.activate([
            

            itemImg.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 0 * appConstant.heightRatio),
            itemImg.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            itemImg.heightAnchor.constraint(equalToConstant: 46 * appConstant.heightRatio),
            itemImg.widthAnchor.constraint(equalToConstant: 46 * appConstant.heightRatio),
            
            itemtext.centerYAnchor.constraint(equalTo: itemImg.centerYAnchor, constant: 0 * appConstant.heightRatio),
            itemtext.leadingAnchor.constraint(equalTo: itemImg.trailingAnchor, constant: 8 * appConstant.widthRatio),
            
            toggleimg.centerYAnchor.constraint(equalTo: itemImg.centerYAnchor, constant: 0 * appConstant.heightRatio),
            toggleimg.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20 * appConstant.widthRatio),
            toggleimg.heightAnchor.constraint(equalToConstant: 24 * appConstant.heightRatio),
            toggleimg.widthAnchor.constraint(equalToConstant: 24 * appConstant.heightRatio),
                        
            
        ])
        
        
    }
    

}
