//
//  MainCollectionViewCell.swift
//  temp
//
//  Created by 정유경 on 2020/03/07.
//  Copyright © 2020 정유경. All rights reserved.
//

import UIKit

class MainCollectionViewCell: UICollectionViewCell {
  
    static let identifier = "CustomCell"
    
    private let imageView = UIImageView()
    private let travelLabel = UILabel()
    private let departuredateLabel = UILabel()
    private let arrivaldateLabel = UILabel()
    private let customTitleLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: UI
    func setUI() {
        
        clipsToBounds = true
        layer.cornerRadius = 20
        
        imageView.contentMode = .scaleAspectFill
        imageView.image
        imageView.image = UIImage(named: "미국")
        
        imageView.backgroundColor = .opaqueSeparator
        contentView.addSubview(imageView)
        
        travelLabel.textAlignment = .center
        travelLabel.font = UIFont.boldSystemFont(ofSize: 32)
        travelLabel.text = "NewYork"
        travelLabel.textColor = .text
//        travelLabel.backgroundColor = .red
        contentView.addSubview(travelLabel)
        
        departuredateLabel.textAlignment = .left
        departuredateLabel.text = "2020.02.01"
        departuredateLabel.font = UIFont.systemFont(ofSize: 12)
        departuredateLabel.textColor = .text
//        departuredateLabel.backgroundColor = .blue
        contentView.addSubview(departuredateLabel)
        
        arrivaldateLabel.textAlignment = .right
        arrivaldateLabel.text = "2020.03.01"
        arrivaldateLabel.font = UIFont.systemFont(ofSize: 12)
        arrivaldateLabel.textColor = .text
//        arrivaldateLabel.backgroundColor = .blue
        contentView.addSubview(arrivaldateLabel)
       
        customTitleLabel.textAlignment = .center
        customTitleLabel.numberOfLines = 0
        customTitleLabel.text = "유꽁이와 즐거운 뉴욕여행"
        customTitleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        customTitleLabel.textColor = .text
//        customTitleLabel.backgroundColor = .white
        contentView.addSubview(customTitleLabel)
    }
    
    func setConstraints() {
        let padding: CGFloat = 8
        
        [imageView,travelLabel,departuredateLabel,arrivaldateLabel,customTitleLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        imageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
        travelLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding * 3).isActive = true
        travelLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding * 2).isActive = true
        travelLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding * 2).isActive = true
        travelLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.3).isActive = true
        
        departuredateLabel.topAnchor.constraint(equalTo: travelLabel.bottomAnchor, constant: padding * 8).isActive = true
        departuredateLabel.leadingAnchor.constraint(equalTo: travelLabel.leadingAnchor).isActive = true
        departuredateLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.5).isActive = true
        departuredateLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.08).isActive = true
        
        arrivaldateLabel.topAnchor.constraint(equalTo: departuredateLabel.bottomAnchor).isActive = true
        arrivaldateLabel.trailingAnchor.constraint(equalTo: travelLabel.trailingAnchor).isActive = true
        arrivaldateLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.5).isActive = true
        arrivaldateLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.08).isActive = true
        
        customTitleLabel.topAnchor.constraint(equalTo: arrivaldateLabel.bottomAnchor, constant: padding).isActive = true
        customTitleLabel.leadingAnchor.constraint(equalTo: travelLabel.leadingAnchor).isActive = true
        customTitleLabel.trailingAnchor.constraint(equalTo: travelLabel.trailingAnchor).isActive = true
        customTitleLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.16).isActive = true
        
    }
}
