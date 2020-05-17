//
//  MainButtonCollectionViewCell.swift
//  temp
//
//  Created by 정유경 on 2020/03/07.
//  Copyright © 2020 정유경. All rights reserved.
//

import UIKit

protocol MainButtonCollectionViewCellDelegate: class {
    func didTapAddButton()
}

class MainButtonCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "ButtonCustomCell"
    
    private let travelAddButton = UIButton()
    private let buttonCellLabel = UILabel()
    private let OGADALabel = UILabel()

    weak var delegate: MainButtonCollectionViewCellDelegate?
    
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
       
        let textSize: CGFloat = 14
        let subTextSize: CGFloat = 16
        
        
        contentView.backgroundColor = .text
        clipsToBounds = true
        layer.cornerRadius = 20
        
        travelAddButton.setImage(UIImage(named: "addButton"), for: .normal)
        travelAddButton.addTarget(self, action: #selector(didTapAddButton), for: .touchUpInside)
        travelAddButton.backgroundColor = .text
        contentView.addSubview(travelAddButton)
        
        
        OGADALabel.text = "OGADA"
        OGADALabel.font = UIFont.boldSystemFont(ofSize: subTextSize)
        OGADALabel.textAlignment = .center
        OGADALabel.textColor = .background
//        OGADALabel.backgroundColor = .gray
        contentView.addSubview(OGADALabel)
        
        buttonCellLabel.text = "새로운 여정을 추가하세요!"
        buttonCellLabel.font = UIFont.systemFont(ofSize: textSize)
        buttonCellLabel.textAlignment = .center
        buttonCellLabel.textColor = .background
//        buttonCellLabel.backgroundColor = .darkGray
        contentView.addSubview(buttonCellLabel)
   

    }
    func setConstraints() {
        let padding: CGFloat = 8
        
        [travelAddButton,OGADALabel,buttonCellLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        travelAddButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        travelAddButton.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.4).isActive = true
        travelAddButton.heightAnchor.constraint(equalTo: travelAddButton.widthAnchor).isActive = true
        travelAddButton.bottomAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        
        OGADALabel.topAnchor.constraint(equalTo: contentView.centerYAnchor, constant: padding * 2).isActive = true
        OGADALabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        
        buttonCellLabel.topAnchor.constraint(equalTo: OGADALabel.bottomAnchor, constant: padding * 2).isActive = true
        buttonCellLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        
    }
    // MARK: Action
    @objc func didTapAddButton(_ button: UIButton) {
        delegate?.didTapAddButton()
    }
}
