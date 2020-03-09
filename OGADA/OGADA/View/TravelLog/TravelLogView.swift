//
//  TravelLogView.swift
//  OGADA
//
//  Created by 양중창 on 2020/03/07.
//  Copyright © 2020 didwndckd. All rights reserved.
//

import UIKit


class BudgetView: UIView {
    
    var totalBudget: Int
    var krwCashBalance: Int
    var krwCardBalance: Int
    var foreignCashBalance: Int
    var foreignCardBalance: Int
    let exchangeType: String
    
    private let totalTextLabel = UILabel()
    private let balanceTextLabel = UILabel()
    private let moneyImage = UIImageView()
    private let cardImage = UIImageView()
    private let moneyCardImage = UIImageView()
    
    private let totalBudgetLabel = UILabel()
    private let krwCashBalanceLabel = UILabel()
    private let krwCardBalanceLabel = UILabel()
    private let foreignCashBalanceLabel = UILabel()
    private let foreignCardBalanceLabel = UILabel()
    //2안 남은돈 총 얼마인가.
    private let krwTotalBalanceLabel = UILabel()
    private let foreignTotalBalanceLabel = UILabel()
    
    let addCashButton = UIButton()
    
    
    
    init(totalBudget: Int, krwCash krwCashBalance: Int, krwCard krwCardBalance: Int, foreignCash foreignCashBalance: Int, foreignCard foreignCardBalance: Int, exchangeType: String) {
        
        self.totalBudget = totalBudget
        self.krwCashBalance = krwCashBalance
        self.krwCardBalance = krwCardBalance
        self.foreignCashBalance = foreignCashBalance
        self.foreignCardBalance = foreignCardBalance
        self.exchangeType = exchangeType
        
        super.init(frame: .zero)

        
        setUI()
        setConstraint()
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - UI
    private func setUI() {
        
        let hardUITintColor = CGColor(srgbRed: 146, green: 146, blue: 146, alpha: 1)
        let mainTextColor: UIColor = .white
        let subTextColor: UIColor = .lightGray
        
        let fixedTextSize: CGFloat = 16
        let totalBudgetTextSize: CGFloat = 24
        
        backgroundColor = .text
        
        
        // hard
        totalTextLabel.text = "총예산"
        totalTextLabel.textColor = subTextColor
        totalTextLabel.font = .boldSystemFont(ofSize: fixedTextSize)
        
        balanceTextLabel.text = "남은 금액"
        balanceTextLabel.textColor = subTextColor
        balanceTextLabel.font = .boldSystemFont(ofSize: fixedTextSize)
        
        moneyImage.image = UIImage(named: "money")
        moneyImage.contentMode = .scaleAspectFill
        
        cardImage.image = UIImage(named: "card")
        cardImage.contentMode = .scaleAspectFill
        
        addCashButton.setImage(UIImage(systemName: "plus.circle"), for: .normal)
        addCashButton.tintColor = .init(cgColor: hardUITintColor)
        
        // 총예산
        totalBudgetLabel.text = "\(totalBudget) krw"
        totalBudgetLabel.textColor = mainTextColor
        totalBudgetLabel.font = .boldSystemFont(ofSize: totalBudgetTextSize)
        
        // 남은예산
        foreignCashBalanceLabel.text = "\(foreignCashBalance) \(exchangeType)"
        foreignCashBalanceLabel.textColor = mainTextColor
        
        krwCashBalanceLabel.text = "\(krwCashBalance) krw"
        krwCashBalanceLabel.textColor = subTextColor
        
        foreignCardBalanceLabel.text = "\(foreignCardBalance) \(exchangeType)"
        foreignCardBalanceLabel.textColor = mainTextColor
        
        krwCardBalanceLabel.text = "\(krwCardBalance) krw"
        krwCardBalanceLabel.textColor = subTextColor
        
        
        
        //2안
        moneyCardImage.image = UIImage(named: "card&cash")
        moneyCardImage.contentMode = .scaleAspectFill
        
        foreignTotalBalanceLabel.text = "\(foreignCardBalance + foreignCashBalance) \(exchangeType)"
        foreignTotalBalanceLabel.textColor = mainTextColor
        
        krwTotalBalanceLabel.text = "\(krwCardBalance + krwCashBalance) krw"
        krwTotalBalanceLabel.textColor = subTextColor
        
       
        
        addSubview(totalTextLabel)
        addSubview(balanceTextLabel)
//        addSubview(moneyCardImage)
//        addSubview(cardImage)
//        addSubview(moneyImage)
//
        addSubview(totalBudgetLabel)
//        addSubview(krwCashBalanceLabel)
//        addSubview(krwCardBalanceLabel)
//        addSubview(foreignCashBalanceLabel)
//        addSubview(foreignCardBalanceLabel)
//        addSubview(addCashButton)
//        // 2안
//        addSubview(krwTotalBalanceLabel)
//        addSubview(foreignTotalBalanceLabel)
        
    }
    
    private func setConstraint() {
        totalTextLabel.translatesAutoresizingMaskIntoConstraints = false
        balanceTextLabel.translatesAutoresizingMaskIntoConstraints = false
        moneyCardImage.translatesAutoresizingMaskIntoConstraints = false
        cardImage.translatesAutoresizingMaskIntoConstraints = false
        moneyImage.translatesAutoresizingMaskIntoConstraints = false
        
        totalBudgetLabel.translatesAutoresizingMaskIntoConstraints = false
        krwCashBalanceLabel.translatesAutoresizingMaskIntoConstraints = false
        krwCardBalanceLabel.translatesAutoresizingMaskIntoConstraints = false
        foreignCashBalanceLabel.translatesAutoresizingMaskIntoConstraints = false
        foreignCardBalanceLabel.translatesAutoresizingMaskIntoConstraints = false
        addCashButton.translatesAutoresizingMaskIntoConstraints = false
        // 2안
        krwTotalBalanceLabel.translatesAutoresizingMaskIntoConstraints = false
        foreignTotalBalanceLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let margin:CGFloat = 24  /*32*/
        let padding:CGFloat = 8
        let imageHeight:CGFloat = 30
        
        
        // 고정
        NSLayoutConstraint.activate([
            totalTextLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: padding),
            totalTextLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: margin)
,
            
            balanceTextLabel.topAnchor.constraint(equalTo: totalTextLabel.bottomAnchor, constant: margin),
            balanceTextLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: margin),
            
//            moneyCardImage.topAnchor.constraint(equalTo: <#T##NSLayoutAnchor<NSLayoutYAxisAnchor>#>, constant: <#T##CGFloat#>)
            
//            cardImage.topAnchor.constraint(equalTo: <#T##NSLayoutAnchor<NSLayoutYAxisAnchor>#>, constant: <#T##CGFloat#>)
            
//            moneyImage.topAnchor.constraint(equalTo: <#T##NSLayoutAnchor<NSLayoutYAxisAnchor>#>, constant: <#T##CGFloat#>)
        ])
        
        // 유동적
        NSLayoutConstraint.activate([
            totalBudgetLabel.centerYAnchor.constraint(equalTo: totalTextLabel.centerYAnchor),
//            totalBudgetLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: padding),
            totalBudgetLabel.leadingAnchor.constraint(equalTo: totalTextLabel.trailingAnchor, constant: margin * 2),
            
//            krwCashBalanceLabel.topAnchor.constraint(equalTo: <#T##NSLayoutAnchor<NSLayoutYAxisAnchor>#>, constant: <#T##CGFloat#>)
            
//            krwCardBalanceLabel.topAnchor.constraint(equalTo: <#T##NSLayoutAnchor<NSLayoutYAxisAnchor>#>, constant: <#T##CGFloat#>)
            
//            foreignCashBalanceLabel.topAnchor.constraint(equalTo: <#T##NSLayoutAnchor<NSLayoutYAxisAnchor>#>, constant: <#T##CGFloat#>)
            
//            foreignCardBalanceLabel.topAnchor.constraint(equalTo: <#T##NSLayoutAnchor<NSLayoutYAxisAnchor>#>, constant: <#T##CGFloat#>)
            
//            addCashButton.topAnchor.constraint(equalTo: <#T##NSLayoutAnchor<NSLayoutYAxisAnchor>#>, constant: <#T##CGFloat#>)
        ])
        
        // 2안
        NSLayoutConstraint.activate([
//            krwTotalBalanceLabel.topAnchor.constraint(equalTo: <#T##NSLayoutAnchor<NSLayoutYAxisAnchor>#>, constant: <#T##CGFloat#>)
            
//            foreignTotalBalanceLabel.topAnchor.constraint(equalTo: <#T##NSLayoutAnchor<NSLayoutYAxisAnchor>#>, constant: <#T##CGFloat#>)
        ])
    }
    
    
    
    // MARK: - action
    
    @objc private func didTabAddCashButton(sender: UIButton) {
        // 환율 + 환전 추가금액 alert창
        
        //reload
    }
}
