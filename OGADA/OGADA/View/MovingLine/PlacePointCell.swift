//
//  PlacePointCellTableViewCell.swift
//  OGADA
//
//  Created by 양중창 on 2020/03/08.
//  Copyright © 2020 didwndckd. All rights reserved.
//

import UIKit

class PlacePointCell: UITableViewCell {
    
    static let identifire = "PlacePointCell"
    
    private let flowLabel = UILabel()
    private let titleLabel = UILabel()
    private let addressLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
        setConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: UI
    
    private func setUI() {
        [flowLabel, titleLabel, addressLabel].forEach({
            contentView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        })
        
        backgroundColor = .clear
        
        flowLabel.backgroundColor = .text
        flowLabel.textColor = .white
        flowLabel.textAlignment = .center
        flowLabel.clipsToBounds = true
        
        titleLabel.textColor = .text
        
        addressLabel.textColor = .subText
        addressLabel.numberOfLines = 0
        
    }
    
    private func setConstraint() {
        let margin: CGFloat = 4
        let xMargin = margin * 3
        let flowLabelYMargin = margin * 4
        let titleLabelYMargin = margin * 2
        
        flowLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: flowLabelYMargin).isActive = true
        flowLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: xMargin).isActive  = true
        flowLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -flowLabelYMargin).isActive = true
        flowLabel.widthAnchor.constraint(equalTo: flowLabel.heightAnchor).isActive = true
        
        titleLabel.leadingAnchor.constraint(equalTo: flowLabel.trailingAnchor, constant: xMargin).isActive = true
        titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: titleLabelYMargin).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        
        addressLabel.topAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 0).isActive = true
        addressLabel.leadingAnchor.constraint(equalTo: flowLabel.trailingAnchor, constant: xMargin).isActive = true
        addressLabel.heightAnchor.constraint(equalTo: titleLabel.heightAnchor, multiplier: 0.5).isActive = true
        
    }

    override func layoutIfNeeded() {
        super.layoutIfNeeded()
        
        let multiflier: CGFloat = 0.6
        
        let flowLabelFontSize = flowLabel.bounds.height * multiflier
        flowLabel.font = .systemFont(ofSize: flowLabelFontSize, weight: .semibold)
        flowLabel.layer.cornerRadius = flowLabel.bounds.width / 2
        
        let titleLablFontSize = titleLabel.bounds.height * multiflier
        titleLabel.font = .systemFont(ofSize: titleLablFontSize, weight: .regular)
        
        let addressLabelFontSize = addressLabel.bounds.height * 0.8
        addressLabel.font = .systemFont(ofSize: addressLabelFontSize, weight: .thin)
    }
    
    
    
    //MARK: Configure
    func configure(flow: String, title: String, address: String, isVisit: Bool) {
        
        flowLabel.text = flow
        titleLabel.text = title
        addressLabel.text = address
        let visitDisplayColor = isVisit ? UIColor.positive: UIColor.negative
        flowLabel.backgroundColor = visitDisplayColor
        
    }
    
}
