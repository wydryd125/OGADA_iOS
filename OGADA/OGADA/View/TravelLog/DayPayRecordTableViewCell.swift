//
//  DayPayRecordTableViewCell.swift
//  OGADA
//
//  Created by YoujinMac on 2020/03/10.
//  Copyright © 2020 didwndckd. All rights reserved.
//

import UIKit

class DayPayRecordTableViewCell: UITableViewCell {
    static let identifier = "DayPayRecordCell"
    
    private let titleImage = UIImageView()
    private let categoryImage = UIImageView()
    private let payTypeImage = UIImageView()

    private let titleLabel = UILabel()
    private let commentLabel = UILabel()
    private let amountLabel = UILabel()
    
    // MARK: initializer
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUI()
        setConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI
    private func setUI() {
        let titleFontSize: CGFloat = 22
        let commentFontSize: CGFloat = 15
        let amountFontSize: CGFloat = 20
        
        titleImage.contentMode = .scaleAspectFill
        
        categoryImage.contentMode = .scaleAspectFill
        
        payTypeImage.contentMode = .scaleAspectFit
        
        titleLabel.textColor = .text
        titleLabel.font = .boldSystemFont(ofSize: titleFontSize)
        
        commentLabel.textColor = .gray
        commentLabel.font = .systemFont(ofSize: commentFontSize)
        
        amountLabel.textColor = .text
        amountLabel.font = .boldSystemFont(ofSize: amountFontSize)
        
        
         [titleImage, categoryImage, titleLabel, commentLabel, payTypeImage, amountLabel].forEach {
             contentView.addSubview($0)
         }
         
        
//        [titleImage, titleLabel].forEach {
//            contentView.addSubview($0)
//        }
    }
    
    private func setConstraint() {
        
         [titleImage, categoryImage, titleLabel, commentLabel, payTypeImage, amountLabel].forEach {
             $0.translatesAutoresizingMaskIntoConstraints = false
         }
         
//        [titleImage, titleLabel].forEach {
//            $0.translatesAutoresizingMaskIntoConstraints = false
//        }
        
        let margin: CGFloat = 24
        let padding: CGFloat = 16
        
        let titleImageHeight: CGFloat = (contentView.frame.width) / 2 - (margin * 2)
        let miniImageHeight: CGFloat = 32
        
        NSLayoutConstraint.activate([
            titleImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: margin),
            titleImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: margin),
            titleImage.heightAnchor.constraint(equalToConstant: titleImageHeight),
            titleImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -margin),
            titleImage.widthAnchor.constraint(equalToConstant: titleImageHeight),
            
            categoryImage.topAnchor.constraint(equalTo: titleImage.topAnchor),
            categoryImage.leadingAnchor.constraint(equalTo: titleImage.trailingAnchor, constant: margin),
            categoryImage.heightAnchor.constraint(equalToConstant: miniImageHeight),
            categoryImage.widthAnchor.constraint(equalToConstant: miniImageHeight),
            
            titleLabel.topAnchor.constraint(equalTo: titleImage.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: categoryImage.trailingAnchor, constant: padding),
//            titleLabel.leadingAnchor.constraint(equalTo: titleImage.trailingAnchor, constant: padding),

            commentLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: padding),
//            commentLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            commentLabel.leadingAnchor.constraint(equalTo: categoryImage.leadingAnchor),

            amountLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -margin),
            amountLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),

            payTypeImage.topAnchor.constraint(equalTo: amountLabel.topAnchor),
            payTypeImage.leadingAnchor.constraint(equalTo: categoryImage.leadingAnchor),
            payTypeImage.heightAnchor.constraint(equalToConstant: miniImageHeight),
            payTypeImage.widthAnchor.constraint(equalToConstant: miniImageHeight)
            
        ])
    }
    
    
    //MARK: - configure
    func configure(titleImage: UIImage, categoryImage: UIImage, title: String, comment: String, payTypeImage: UIImage, amount: Int, exchangeType: String) {
        self.titleImage.image = titleImage /*?? UIImage(named: DayPayRecord)*/
        self.categoryImage.image = categoryImage
        self.titleLabel.text = title
        self.commentLabel.text = comment
        self.payTypeImage.image = payTypeImage
        self.amountLabel.text = "\(amount) \(exchangeType)"
    }
}
