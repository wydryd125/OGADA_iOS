//
//  TravelLogPostItCollectionViewCell.swift
//  OGADA
//
//  Created by YoujinMac on 2020/03/09.
//  Copyright © 2020 didwndckd. All rights reserved.
//

import UIKit

final class PostItCollectionViewCell: UICollectionViewCell {
    
    let identifier = "PostItCell"
    
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
        
        backgroundImage.contentMode = .scaleAspectFill
        
        cashTextLabel.text = "현금"
        
        cardTextLabel.text = "카드"
        
        totalTextLabel.text = "총금액"
        
//        dayLabel
        
        dateLabel.textColor = .gray
        
//        foreignCashLabel
//
//        krwCashLabel
//
//        foreignCardLabel
//
//        krwCardLabel
//
//        foreignTotalLabel
//
//        krwTotalLabel
        
        contentView.addSubview(backgroundImage)
        
//        backgroundImage.addSubview(cashTextLabel)
//        backgroundImage.addSubview(cardTextLabel)
//        backgroundImage.addSubview(totalTextLabel)
//        backgroundImage.addSubview(dayLabel)
//        backgroundImage.addSubview(dateLabel)
//        backgroundImage.addSubview(foreignCashLabel)
//        backgroundImage.addSubview(krwCashLabel)
//        backgroundImage.addSubview(foreignCardLabel)
//        backgroundImage.addSubview(krwCardLabel)
//        backgroundImage.addSubview(foreignTotalLabel)
//        backgroundImage.addSubview(krwTotalLabel)

        
    }
    
    private func setConstraint() {
        [backgroundImage, cashTextLabel, cardTextLabel, totalTextLabel, dayLabel, dateLabel,foreignCashLabel, krwCashLabel, foreignCardLabel, krwCardLabel, foreignTotalLabel, krwTotalLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        // 고정
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
            
//            cashTextLabel
            
//            cardTextLabel
            
//            totalTextLabel
            
        ])
        
        //유동적
        NSLayoutConstraint.activate([
//            dayLabel.topAnchor.constraint(equalTo: <#T##NSLayoutAnchor<NSLayoutYAxisAnchor>#>)
            
//            dateLabel
//            foreignCashLabel
//            krwCashLabel
//            foreignCardLabel
//            krwCardLabel
//            foreignTotalLabel
//            krwTotalLabel
        ])
        
    }
    
    
    func configure(day: Int, date: Int, foreignType type: String, foreignCash: Int, krwCash: Int, foreignCard: Int, krwCard: Int, foreignTotal: Int, krwTaotal: Int, backgroundImage backimage: UIImage) {
        
        dayLabel.text = "\(day)일차"
        dateLabel.text = "\(date)"
        
        foreignCashLabel.text = "\(foreignCash) \(type)"
        krwCashLabel.text = "\(krwCash) KRW"
        
        foreignCardLabel.text = "\(foreignCard) \(type)"
        krwCardLabel.text = "\(krwCard) KRW"
        
        foreignTotalLabel.text = "\(foreignTotal) \(type)"
        krwTotalLabel.text = "\(krwTaotal) KRW"
        
        backgroundImage.image = backimage
    }
    
}
