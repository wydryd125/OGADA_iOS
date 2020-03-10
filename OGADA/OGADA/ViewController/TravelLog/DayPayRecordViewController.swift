//
//  DayPayRecordViewController.swift
//  OGADA
//
//  Created by YoujinMac on 2020/03/10.
//  Copyright © 2020 didwndckd. All rights reserved.
//

import UIKit

class DayPayRecordViewController: UIViewController {
    
    private lazy var tableView = UITableView(frame: view.frame)
    
    let exchangeType = "USD"
    
    // cell dummy Data
    let cellCount = 5
    private let titleImageString = "DayPayRecord"
    private let categoryImageString = "cafe"
    private let payTypeImageString = "card&cash"
    private let cellTitle = "팁싸마이 "
    private let cellComment = "오렌지 주스 존맛탱구리~~"
    private let cellAmount = 21
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .background
        
        setUI()
//        setConstraint()
    }
    
    
//MARK: - UI
    private func setUI() {
        tableView.dataSource = self
//        tableView.delegate = self
        tableView.register(DayPayRecordTableViewCell.self, forCellReuseIdentifier: DayPayRecordTableViewCell.identifier)
//        tableView.rowHeight = UITableView.automaticDimension
        view.addSubview(tableView)
    }


}

// UIImage(named: DayPayRecord)

//MARK: - TableViewDataSource
extension DayPayRecordViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: DayPayRecordTableViewCell.identifier, for: indexPath) as! DayPayRecordTableViewCell
        
        cell.configure(titleImage: UIImage(named: titleImageString)!, categoryImage: UIImage(named: categoryImageString)!, title: cellTitle, comment: cellComment, payTypeImage: UIImage(named: payTypeImageString)!, amount: cellAmount, exchangeType: exchangeType)
        
        return cell
    }
    
    
}

//extension DayPayRecordViewController: UITableViewDelegate {
////    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
////        <#code#>
////    }
//}
