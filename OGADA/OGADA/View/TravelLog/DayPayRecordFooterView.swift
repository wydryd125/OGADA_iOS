//
//  DayPayRecordFooterView.swift
//  OGADA
//
//  Created by YoujinMac on 2020/03/11.
//  Copyright © 2020 didwndckd. All rights reserved.
//

import UIKit

class DayPayRecordFooterView: UIView {
    
    private let payTypeText = UILabel()
    private let amountText = UILabel()
    private let totalAmountText = UILabel()
    
    private let dottedLine = UIImageView()
    private let dottedLine2 = UIImageView()
    private let dottedTwoLine = UIImageView()
    private let moneyImage = UIImageView()
    private let cardImage = UIImageView()
    
    private let foreignCashLabel = UILabel()
    private let krwCashLabel = UILabel()
    private let foreignCardLabel = UILabel()
    private let krwCardLabel = UILabel()
    private let foreignTotalLabel = UILabel()
    private let krwTotalLabel = UILabel()
    
    // MARK: initializer
    init(foreignCash: Int, krwCash: Int, foreignCard: Int, krwCard: Int, foreignTotal: Int, krwTotal: Int, exchnageType: String) {
        
        super.init(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 290))
        
        foreignCashLabel.text = "\(foreignCash) \(exchnageType)"
        krwCashLabel.text = "\(krwCash) KRW"
        
        foreignCardLabel.text = "\(foreignCard) \(exchnageType)"
        krwCardLabel.text = "\(krwCard) KRW"
        
        foreignTotalLabel.text = "\(foreignTotal) \(exchnageType)"
        krwTotalLabel.text = "\(krwTotal) KRW"
        
        setUI()
        setConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI
    private func setUI() {
        
        let fiexedTextFont: UIFont = .systemFont(ofSize: 14)
        let foreignTextFont: UIFont = .boldSystemFont(ofSize: 18)
        let krwTextFont: UIFont = .systemFont(ofSize: 14)
        let foreignTotalFont: UIFont = .boldSystemFont(ofSize: 20)
        let krwTotalFont: UIFont = .systemFont(ofSize: 18)
        
        let fiexedTextColor: UIColor = .darkGray
        let foreignTextColor: UIColor = .darkGray
        let krwTextColor: UIColor = .gray
        
        dottedLine.image = UIImage(named: "dotted line black")
        dottedLine2.image = UIImage(named: "dotted line black")
        
        dottedTwoLine.image = UIImage(named: "dotted two line black")
        
        moneyImage.image = UIImage(named: "money")
        moneyImage.contentMode = .scaleAspectFill
        
        cardImage.image = UIImage(named: "card")
        cardImage.contentMode = .scaleAspectFit
        
        payTypeText.text = "종류"
        payTypeText.textColor = fiexedTextColor
        payTypeText.font = fiexedTextFont
        
        amountText.text = "금액"
        amountText.textColor = fiexedTextColor
        amountText.font = fiexedTextFont
        
        totalAmountText.text = "총 금액 : "
        totalAmountText.textColor = fiexedTextColor
        totalAmountText.font = fiexedTextFont
        
        foreignCashLabel.textColor = foreignTextColor
        foreignCashLabel.font = foreignTextFont
        
        krwCashLabel.textColor = krwTextColor
        krwCashLabel.font = krwTextFont
        
        foreignCardLabel.textColor = foreignTextColor
        foreignCardLabel.font = foreignTextFont
        
        krwCardLabel.textColor = krwTextColor
        krwCardLabel.font = krwTextFont
        
        foreignTotalLabel.textColor = foreignTextColor
        foreignTotalLabel.font = foreignTotalFont
        
        krwTotalLabel.textColor = krwTextColor
        krwTotalLabel.font = krwTotalFont
        
        
        [payTypeText, amountText, totalAmountText, dottedLine, dottedTwoLine, moneyImage, cardImage, foreignCashLabel, krwCashLabel, foreignCardLabel, krwCardLabel, foreignTotalLabel, krwTotalLabel, dottedLine2].forEach {
            addSubview($0)
        }
        
    }
    
    private func setConstraint() {
        [payTypeText, amountText, totalAmountText, dottedLine, dottedTwoLine, moneyImage, cardImage, foreignCashLabel, krwCashLabel, foreignCardLabel, krwCardLabel, foreignTotalLabel, krwTotalLabel, dottedLine2].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
               }
        
        let margin: CGFloat = 24
        let padding: CGFloat = 8
        
        let linHeight: CGFloat = 20
        let lineWidth: CGFloat = frame.width
        let miniImageSize: CGFloat = 40
        
        
        
        NSLayoutConstraint.activate([
            dottedLine.topAnchor.constraint(equalTo: topAnchor),
            dottedLine.widthAnchor.constraint(equalToConstant: frame.width - (padding * 2)),
            dottedLine.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            dottedLine.heightAnchor.constraint(equalToConstant: 20),
            
            payTypeText.topAnchor.constraint(equalTo: dottedLine.bottomAnchor),
            payTypeText.leadingAnchor.constraint(equalTo: leadingAnchor, constant: margin * 2),
            
            amountText.topAnchor.constraint(equalTo: payTypeText.topAnchor),
            amountText.leadingAnchor.constraint(equalTo: payTypeText.trailingAnchor, constant: margin * 3),
            
            dottedLine2.topAnchor.constraint(equalTo: payTypeText.bottomAnchor),
            dottedLine2.widthAnchor.constraint(equalToConstant: frame.width - (padding * 2)),
            dottedLine2.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            dottedLine2.heightAnchor.constraint(equalToConstant: 20),
            
            moneyImage.topAnchor.constraint(equalTo: dottedLine2.bottomAnchor, constant: padding),
            moneyImage.centerXAnchor.constraint(equalTo: payTypeText.centerXAnchor),
            moneyImage.heightAnchor.constraint(equalToConstant: miniImageSize),
            moneyImage.widthAnchor.constraint(equalToConstant: miniImageSize),
            
            
            foreignCashLabel.topAnchor.constraint(equalTo: moneyImage.topAnchor),
            foreignCashLabel.leadingAnchor.constraint(equalTo: amountText.leadingAnchor),

            krwCashLabel.topAnchor.constraint(equalTo: foreignCashLabel.bottomAnchor, constant: padding),
            krwCashLabel.leadingAnchor.constraint(equalTo: foreignCashLabel.leadingAnchor),

            cardImage.topAnchor.constraint(equalTo: krwCashLabel.bottomAnchor, constant: margin),
            cardImage.centerXAnchor.constraint(equalTo: moneyImage.centerXAnchor),
            cardImage.heightAnchor.constraint(equalToConstant: miniImageSize),
            cardImage.widthAnchor.constraint(equalToConstant: miniImageSize),
            
            
            foreignCardLabel.topAnchor.constraint(equalTo: cardImage.topAnchor),
            foreignCardLabel.leadingAnchor.constraint(equalTo: foreignCashLabel.leadingAnchor),
            
            krwCardLabel.topAnchor.constraint(equalTo: foreignCardLabel.bottomAnchor, constant: padding),
            krwCardLabel.leadingAnchor.constraint(equalTo: foreignCardLabel.leadingAnchor),
            
            dottedTwoLine.topAnchor.constraint(equalTo: krwCardLabel.bottomAnchor, constant: padding),
            dottedTwoLine.widthAnchor.constraint(equalToConstant: frame.width - (padding * 2)),
            dottedTwoLine.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            dottedTwoLine.heightAnchor.constraint(equalToConstant: linHeight),
            
            totalAmountText.topAnchor.constraint(equalTo: dottedTwoLine.bottomAnchor, constant: padding / 2),
            totalAmountText.centerXAnchor.constraint(equalTo: payTypeText.centerXAnchor),
            
            foreignTotalLabel.topAnchor.constraint(equalTo: totalAmountText.topAnchor),
            foreignTotalLabel.leadingAnchor.constraint(equalTo: foreignCardLabel.leadingAnchor),
            
            krwTotalLabel.topAnchor.constraint(equalTo: foreignTotalLabel.bottomAnchor, constant: padding),
            krwTotalLabel.leadingAnchor.constraint(equalTo: foreignTotalLabel.leadingAnchor)


        ])
        
    }
    
}
