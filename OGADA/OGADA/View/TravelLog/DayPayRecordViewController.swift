//
//  DayPayRecordViewController.swift
//  OGADA
//
//  Created by YoujinMac on 2020/03/10.
//  Copyright © 2020 didwndckd. All rights reserved.
//

import UIKit

class DayPayRecordViewController: UIViewController {
    
    private let tableView = UITableView(frame: .zero)
    private lazy var headerView = DayPayRecordHeaderView(day: day, date: date)
    
    let day:Int = 1
    let date:String = "2020.01.03"
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
        setConstraint()
    }
    
    
//MARK: - UI
    private func setUI() {
        tableView.dataSource = self
//        tableView.delegate = self
        
        headerView.delegate = self
        
        tableView.register(DayPayRecordTableViewCell.self, forCellReuseIdentifier: DayPayRecordTableViewCell.identifier)
//        tableView.rowHeight = UITableView.automaticDimension
        view.addSubview(tableView)
        view.addSubview(headerView)
    }
    
    private func setConstraint() {
        headerView.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        let margin: CGFloat = 24
        let padding: CGFloat = 16
        let headerHeight: CGFloat = ((view.frame.width) / 2 - (margin * 3))
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: headerHeight),
            
            tableView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
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
////    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
////        let DayPayheaderView = DayPayRecordHeaderView(day: day, date: date) as UIView
////
////        return DayPayheaderView
////    }
//
////    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
////        <#code#>
////    }
//}


//MARKL - DayPayRecord Delegate
extension DayPayRecordViewController: DayPayRecordHeaderDelegate {
    func backFunc() {
        dismiss(animated: true, completion: nil)
    }
    
    
}
