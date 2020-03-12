//
//  TravelLogViewController.swift
//  OGADA
//
//  Created by 양중창 on 2020/03/04.
//  Copyright © 2020 didwndckd. All rights reserved.
//

import UIKit

class TravelLogViewController: BaseViewController {
    
    // budgetView 관련
    private lazy var totalBudget: Int = (SelectedTravel.shared?.totalBudget)!
    private var krwCashBalance: Int = 600000
    private var krwCardBalance: Int = 400000
    private var foreignCashBalance: Int = 503
    private var foreignCardBalance: Int = 335
    private let exchangeType: String = "USD"
    private let termCount = 5
    
    // post it 관련
    // 여러개 들어오 예정
    private let day: Int = 1
    private let date: String = "2020.01.01"
    private let foreignCash: Int = 100
    private let krwCash: Int = 120000
    private let foreignCard: Int = 210
    private let krwCard: Int = 252000
    private let foreignTotal: Int = 210
    private let krwtotal: Int = 372000
        
    private let flowLayout = UICollectionViewFlowLayout()
    private lazy var collectionView = UICollectionView(frame: .zero
        , collectionViewLayout: flowLayout)
    
    private lazy var budgetView = BudgetView(totalBudget: totalBudget, krwCash: krwCashBalance, krwCard: krwCardBalance, foreignCash: foreignCashBalance, foreignCard: foreignCardBalance, exchangeType: exchangeType)
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        view.backgroundColor = .background
        
        print("------------/n seletedTravel")
        print(SelectedTravel.shared)
        
        setUI()
        setConstraint()
        
    }
    
    // MARK: - UI
    private func setUI() {
        setFlowLaytou()
        backButton.tintColor = .lightGray
        
        collectionView.register(PostItCollectionViewCell.self, forCellWithReuseIdentifier: PostItCollectionViewCell.identifier)
        collectionView.backgroundColor = .background
        collectionView.delegate = self
        collectionView.dataSource = self
        
        
        
        view.addSubview(budgetView)
        view.addSubview(collectionView)
        view.bringSubviewToFront(backButton)

        
    }
    
    private func setConstraint() {
        budgetView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        let budgetViewHeight: CGFloat = (view.safeAreaLayoutGuide.layoutFrame.height) / 3
        
        // 예산 View
        NSLayoutConstraint.activate([
            budgetView.topAnchor.constraint(equalTo: view.topAnchor),
            budgetView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            budgetView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            budgetView.heightAnchor.constraint(equalToConstant: budgetViewHeight)
            
        ])
        
        // post-it CollectionView
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: budgetView.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func setFlowLaytou() {
        
        let itemInLine: CGFloat = 2
        
        let spacing: CGFloat = 15
        let insets = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        let collectionViewWidth = view.bounds.width
        
        let contentSize = collectionViewWidth - insets.left - insets.right - (spacing * (itemInLine - 1))
        
        let itemsSize = (contentSize / itemInLine).rounded(.down)
        
        flowLayout.minimumLineSpacing = spacing
        flowLayout.minimumInteritemSpacing = spacing
        flowLayout.sectionInset = insets
        flowLayout.itemSize = CGSize(width: itemsSize, height: itemsSize)

    }
   

}


//MARK: - Datasource: CollectionView
extension TravelLogViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return termCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PostItCollectionViewCell.identifier, for: indexPath) as! PostItCollectionViewCell
        
        cell.backgroundColor = .background
        
        cell.configure(day: day, date: date, foreignType: exchangeType, foreignCash: foreignCash, krwCash: krwCash, foreignCard: foreignCard, krwCard: krwCard, foreignTotal: foreignTotal, krwTotal: krwtotal, backgroundImage: UIImage(named: "post it")!)
        
        return cell
    }
    
    
}


//MARK: - Delegate: CollectionView

//extension TravelLogViewController: UICollectionViewDelegate {
extension TravelLogViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let dayPayRecordVC = DayPayRecordViewController()
        
//        let dayPayRecordVC = UINavigationController(rootViewController: DayPayRecordViewController())
        
        dayPayRecordVC.modalPresentationStyle = .fullScreen
        present(dayPayRecordVC, animated: true)
    }
}
