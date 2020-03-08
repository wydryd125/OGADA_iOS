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
    
    private let totalTextLabel = UILabel()
    private let balanceTextLabel = UILabel()
    
    private let totalBudgetLabel = UILabel()
    private let krwCashBalanceLabel = UILabel()
    private let krwCardBalanceLabel = UILabel()
    private let foreignCashBalanceLabel = UILabel()
    private let foreignCardBalanceLabel = UILabel()
    //2안 남은돈 총 얼마인가.
    private let totalBalacneLabel = UILabel()
    
    let addCashButton = UIButton()
    
    
    
    init(totalBudget: Int, krwCash krwCashBalance: Int, krwCard krwCardBalance: Int, foreignCash foreignCashBalance: Int, foreignCard foreignCardBalance: Int) {
        
        self.totalBudget = totalBudget
        self.krwCashBalance = krwCashBalance
        self.krwCardBalance = krwCardBalance
        self.foreignCashBalance = foreignCashBalance
        self.foreignCardBalance = foreignCardBalance
        
        super.init(frame: .zero)

        
        setUI()
        setConstraint()
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - UI
    private func setUI() {
        backgroundColor = .text
        
        // hard
        totalTextLabel.text = "총예산"
        totalTextLabel.textColor = .white
        
        balanceTextLabel.text = "남은 금액"
        balanceTextLabel.textColor = .white
        
        
        
        
        //2안
        
        
        addSubview(totalTextLabel)
        addSubview(balanceTextLabel)
        
        addSubview(totalBudgetLabel)
        addSubview(krwCashBalanceLabel)
        addSubview(krwCardBalanceLabel)
        addSubview(foreignCashBalanceLabel)
        addSubview(foreignCardBalanceLabel)
        addSubview(addCashButton)
        // 2안
        addSubview(totalBalacneLabel)
        
    }
    
    private func setConstraint() {
        
        
        
        // 2안
        NSLayoutConstraint.activate([
//            totalBalacneLabel.topAnchor
        ])
    }
}
