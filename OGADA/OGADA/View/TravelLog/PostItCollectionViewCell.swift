//
//  TravelLogPostItCollectionViewCell.swift
//  OGADA
//
//  Created by YoujinMac on 2020/03/09.
//  Copyright © 2020 didwndckd. All rights reserved.
//

import UIKit

class PostItCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "PostItCell"
    
    private let cashTextLabel = UILabel()
    private let cardTextLabel = UILabel()
    private let totalTextLabel = UILabel()
    
    private let dayLabel = UILabel()
    private let dateLabel = UILabel()
    private let foreignCashLabel = UILabel()
    private let krwCashLabel = UILabel()
    private let foreignCardLabel = UILabel()
    private let krwCardLabel = UILabel()
    private let foreignTotalLabel = UILabel()
    private let krwTotalLabel = UILabel()
    
    private let backgroundImage = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setConstraint()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI
    private func setUI() {
        let dayFontSize: CGFloat = 16
        let dateFontSize: CGFloat = 9
        let fiexedTextFontSize: CGFloat = 13
        let foreignFontSize: CGFloat = 12
        let krwFontSize: CGFloat = 9
        
        let totalTextPlus: CGFloat = 2
        
        let krwTextColor: UIColor = .gray
        
        backgroundImage.contentMode = .scaleAspectFill
        
        cashTextLabel.text = "현금"
        cashTextLabel.textColor = .text
        cashTextLabel.font = .boldSystemFont(ofSize: fiexedTextFontSize)
        
        cardTextLabel.text = "카드"
        cardTextLabel.textColor = .text
        cardTextLabel.font = .boldSystemFont(ofSize: fiexedTextFontSize)
        
        totalTextLabel.text = "총금액"
        totalTextLabel.textColor = .text
        totalTextLabel.font = .boldSystemFont(ofSize: fiexedTextFontSize)
        
        dayLabel.textColor = .text
        dayLabel.font = .boldSystemFont(ofSize: dayFontSize)
        
        
        dateLabel.textColor = .gray
        dateLabel.font = .systemFont(ofSize: dateFontSize)
        
        foreignCashLabel.textColor = .text
        foreignCashLabel.font = .systemFont(ofSize: foreignFontSize)
        
        krwCashLabel.textColor = krwTextColor
        krwCashLabel.font = .systemFont(ofSize: krwFontSize)

        foreignCardLabel.textColor = .text
        foreignCardLabel.font = .systemFont(ofSize: foreignFontSize)

        krwCardLabel.textColor = krwTextColor
        krwCardLabel.font = .systemFont(ofSize: krwFontSize + totalTextPlus)
        
        foreignTotalLabel.textColor = .text
        foreignTotalLabel.font = .boldSystemFont(ofSize: foreignFontSize + totalTextPlus)

        krwTotalLabel.textColor = krwTextColor
        krwTotalLabel.font = .systemFont(ofSize: krwFontSize + totalTextPlus)
        
        contentView.addSubview(backgroundImage)
        
        backgroundImage.addSubview(cashTextLabel)
        backgroundImage.addSubview(cardTextLabel)
        backgroundImage.addSubview(totalTextLabel)
        backgroundImage.addSubview(dayLabel)
        backgroundImage.addSubview(dateLabel)
        backgroundImage.addSubview(foreignCashLabel)
        backgroundImage.addSubview(krwCashLabel)
        backgroundImage.addSubview(foreignCardLabel)
        backgroundImage.addSubview(krwCardLabel)
        backgroundImage.addSubview(foreignTotalLabel)
        backgroundImage.addSubview(krwTotalLabel)

        
    }
    
    private func setConstraint() {
        [backgroundImage, cashTextLabel, cardTextLabel, totalTextLabel, dayLabel, dateLabel,foreignCashLabel, krwCashLabel, foreignCardLabel, krwCardLabel, foreignTotalLabel, krwTotalLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        let margin: CGFloat = 8
        let padding: CGFloat = 2
        let fiexedTextMargin: CGFloat = margin + padding * 2
      
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            dayLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: margin),
            dayLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
                        
            dateLabel.topAnchor.constraint(equalTo: dayLabel.bottomAnchor, constant: padding),
            dateLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            cashTextLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: margin),
            cashTextLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: fiexedTextMargin),
            
//            foreignCashLabel.centerYAnchor.constraint(equalTo: cashTextLabel.centerYAnchor),
            foreignCashLabel.topAnchor.constraint(equalTo: cashTextLabel.topAnchor),
            foreignCashLabel.leadingAnchor.constraint(equalTo: cashTextLabel.trailingAnchor, constant: margin),
            
            krwCashLabel.topAnchor.constraint(equalTo: foreignCashLabel.bottomAnchor, constant: padding),
            krwCashLabel.leadingAnchor.constraint(equalTo: foreignCashLabel.leadingAnchor),
            
            cardTextLabel.topAnchor.constraint(equalTo: krwCashLabel.bottomAnchor, constant: margin),
            cardTextLabel.leadingAnchor.constraint(equalTo: cashTextLabel.leadingAnchor),
            
//            foreignCardLabel.centerYAnchor.constraint(equalTo: cardTextLabel.centerYAnchor),
            foreignCardLabel.topAnchor.constraint(equalTo: cardTextLabel.topAnchor),
            foreignCardLabel.leadingAnchor.constraint(equalTo: cardTextLabel.trailingAnchor, constant: margin),

            krwCardLabel.topAnchor.constraint(equalTo: foreignCardLabel.bottomAnchor, constant: padding),
            krwCardLabel.leadingAnchor.constraint(equalTo: foreignCardLabel.leadingAnchor),
            
            totalTextLabel.topAnchor.constraint(equalTo: krwCardLabel.bottomAnchor, constant: margin),
            totalTextLabel.leadingAnchor.constraint(equalTo: cashTextLabel.leadingAnchor),
            
//            foreignTotalLabel.centerYAnchor.constraint(equalTo: totalTextLabel.centerYAnchor),
            foreignTotalLabel.topAnchor.constraint(equalTo: totalTextLabel.topAnchor),
            foreignTotalLabel.leadingAnchor.constraint(equalTo: totalTextLabel.trailingAnchor, constant: margin),
            
            krwTotalLabel.topAnchor.constraint(equalTo: foreignTotalLabel.bottomAnchor, constant: padding),
            krwTotalLabel.leadingAnchor.constraint(equalTo: foreignTotalLabel.leadingAnchor)
        ])
        
       
        
    }
    
    //MARK: - Configure
    func configure(day: Int, date: String, foreignType type: String, foreignCash: Int, krwCash: Int, foreignCard: Int, krwCard: Int, foreignTotal: Int, krwTotal: Int, backgroundImage backimage: UIImage) {
        
        dayLabel.text = "\(day)일차"
        dateLabel.text = "\(date)"
        
        foreignCashLabel.text = "\(foreignCash) \(type)"
        krwCashLabel.text = "\(krwCash) KRW"
        
        foreignCardLabel.text = "\(foreignCard) \(type)"
        krwCardLabel.text = "\(krwCard) KRW"
        
        foreignTotalLabel.text = "\(foreignTotal) \(type)"
        krwTotalLabel.text = "\(krwTotal) KRW"
        
        backgroundImage.image = backimage
    }
    
}
