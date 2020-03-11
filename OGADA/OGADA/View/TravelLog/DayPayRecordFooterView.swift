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
        super.init(frame: .zero)
        
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
        
        dottedTwoLine.image = UIImage(named: "dotted two line black")
        
        moneyImage.image = UIImage(named: "money")
        
        cardImage.image = UIImage(named: "card")
        
        payTypeText.text = "종류"
        payTypeText.textColor = fiexedTextColor
        payTypeText.font = fiexedTextFont
        
        amountText.text = "금액"
        amountText.textColor = fiexedTextColor
        amountText.font = fiexedTextFont
        
        totalAmountText.text = "총 금액"
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
        
        
        [payTypeText, amountText, totalAmountText, dottedLine, dottedTwoLine, moneyImage, cardImage, foreignCashLabel, krwCashLabel, foreignCardLabel, krwCardLabel, foreignTotalLabel, krwTotalLabel].forEach {
            addSubview($0)
        }
        
    }
    
    private func setConstraint() {
        [payTypeText, amountText, totalAmountText, dottedLine, dottedTwoLine, moneyImage, cardImage, foreignCashLabel, krwCashLabel, foreignCardLabel, krwCardLabel, foreignTotalLabel, krwTotalLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
               }
        
        let margin: CGFloat = 32
        let padding: CGFloat = 16
        
        let lineWidth: CGFloat = frame.width
        let miniImageSize: CGFloat = 40
        
        
        
        NSLayoutConstraint.activate([
            
        ])
        
    }
    
}
