//
//  TravelLogViewController.swift
//  OGADA
//
//  Created by 양중창 on 2020/03/04.
//  Copyright © 2020 didwndckd. All rights reserved.
//

import UIKit

/*
private func setUI
    - delegate, dataSource
    - addsubView
private func setConstraint
    - margin, padding 최상단에.
    - 상수(숫자)를 바로 사용하지 않고 var, let 에 담아서 사용하기!

함수당 간략한 설명 주석 한줄정도.

UI -> setupUI, setupConstraint 두개 합쳐서 마크
action에 관한 함수 모아놓고  마크
extension 당 마크 하나씩!!
*/

class TravelLogViewController: BaseViewController {

    private var totalBudget: Int = 1000000
    private var krwCashBalance: Int = 600000
    private var krwCardBalance: Int = 400000
    private var foreignCashBalance: Int = 503
    private var foreignCardBalance: Int = 335
    private let exchangeType: String = "USD"
    
    private lazy var budgetView = BudgetView(totalBudget: totalBudget, krwCash: krwCashBalance, krwCard: krwCardBalance, foreignCash: foreignCashBalance, foreignCard: foreignCardBalance, exchangeType: exchangeType)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .background

        setUI()
        setConstraint()
        
    }
    
    private func setUI() {
        
        view.addSubview(budgetView)
    }
    private func setConstraint() {
        budgetView.translatesAutoresizingMaskIntoConstraints = false
        
        let budgetViewHeight: CGFloat = (view.safeAreaLayoutGuide.layoutFrame.height) / 3
        
        NSLayoutConstraint.activate([
            budgetView.topAnchor.constraint(equalTo: view.topAnchor),
            budgetView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            budgetView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            budgetView.heightAnchor.constraint(equalToConstant: budgetViewHeight)
            
            
        ])
    }
   

}
