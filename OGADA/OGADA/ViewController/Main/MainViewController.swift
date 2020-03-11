//
//  ViewController.swift
//  temp
//
//  Created by 정유경 on 2020/03/07.
//  Copyright © 2020 정유경. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    private var travels: [TravelInfo] = []
   
    private enum UI {
           static let itemsInLine: CGFloat = 2
           static let linesOnScreen: CGFloat = 2
           static let itemSpacing: CGFloat = 10.0
           static let lineSpacing: CGFloat = 10.0
           static let edgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
       }
    
    private var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        return UICollectionView(frame: .zero, collectionViewLayout: layout)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setConstrains()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let UDkeys = UserDefaults.standard.object(forKey: UserDefaultKeys.travelKey.rawValue) as? [String] else { return }
        
        self.travels.removeAll()
        
        for key in UDkeys {
            guard let travelData = UserDefaults.standard.data(forKey: key) else { break }
            guard let travel = try? JSONDecoder().decode(TravelInfo.self, from: travelData) else { break }
            self.travels.append(travel)
        }
        
        collectionView.reloadData()
        
        
    }
    // MARK: UI
    private func setUI() {
        
        navigationController?.navigationBar.isHidden = true

        collectionView.register(MainCollectionViewCell.self, forCellWithReuseIdentifier: MainCollectionViewCell.identifier)
        collectionView.register(MainButtonCollectionViewCell.self, forCellWithReuseIdentifier: MainButtonCollectionViewCell.identifier)
        collectionView.backgroundColor = .background
        collectionView.dataSource = self
        collectionView.delegate = self
        view.addSubview(collectionView)
    }
    private func setConstrains() {
        let guide = view.safeAreaLayoutGuide
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    // MARK: Action
    
    private func pushTravelController() {
        let tabBarController = UITabBarController()
        
        let boardingPassVC = BoardingPassViewController()
        boardingPassVC.tabBarItem.title = "보딩패스"
        
        let movingLineVC = MovingLineViewController()
        movingLineVC.tabBarItem.title = "동선"
        
        let travelLogVC = TravelLogViewController()
        travelLogVC.tabBarItem.title = "가계부"
        
        let otherVC = OtherViewController()
        otherVC.tabBarItem.title = "더보기"
        
        
        tabBarController.viewControllers = [
        boardingPassVC,
        movingLineVC,
        travelLogVC,
        otherVC
        ]
        
        
        tabBarController.selectedIndex = 1
        
        tabBarController.tabBar.backgroundImage = UIImage()
        tabBarController.tabBar.shadowImage = UIImage()
        navigationController?.pushViewController(tabBarController, animated: true)
        
        
    }

}

//MARK: extension

extension MainViewController: UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return travels.count + 1
    }

    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch indexPath.row {
        case 0:
            let buttonCell = collectionView.dequeueReusableCell(
                withReuseIdentifier: MainButtonCollectionViewCell.identifier,
                for: indexPath
            ) as! MainButtonCollectionViewCell
            buttonCell.delegate = self
            return buttonCell
            
        default:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: MainCollectionViewCell.identifier,
                for: indexPath
                ) as! MainCollectionViewCell
            
//            cell.configure(travel: "" , departureDate: "departure", arrivalDate: "", sutitle: "")

            return cell
        }
    }
}

extension MainViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            print("add")
        default:
//            let movingLingVC = MovingLineViewController()
//            navigationController?.pushViewController(movingLingVC, animated: false)
            pushTravelController()
            print("default")
        }
    }
}

extension MainViewController: UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UI.edgeInsets
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        UI.lineSpacing
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        UI.itemSpacing
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemSpacing = UI.itemSpacing * (UI.itemsInLine - 1)
        let lineSpacing = UI.lineSpacing * (UI.lineSpacing - 1)
        let horizontalInset = UI.edgeInsets.left + UI.edgeInsets.right
        
        let verticalInset = UI.edgeInsets.top + UI.edgeInsets.bottom
            + view.safeAreaInsets.top
            + view.safeAreaInsets.bottom
        
        guard let layout = collectionViewLayout as? UICollectionViewFlowLayout else { fatalError() }
        
        let isVertical = layout.scrollDirection == .vertical

        let horizontalSpacing = (isVertical ? itemSpacing : lineSpacing) + horizontalInset
        let verticalSpacing = (isVertical ? lineSpacing : itemSpacing) + verticalInset
        
        let contentWidth = collectionView.frame.width - horizontalSpacing
        let contentHeight = collectionView.frame.height - verticalSpacing
        let width = contentWidth / (isVertical ? UI.itemsInLine : UI.linesOnScreen)
        let height = contentHeight / (isVertical ? UI.linesOnScreen : UI.itemsInLine)
        
        layout.itemSize = CGSize(
            width: width.rounded(.down),
            height: height.rounded(.down)
            
        )
        return layout.itemSize
    }
    
}
extension MainViewController: MainButtonCollectionViewCellDelegate {
 
    func didTapAddButton() {

        let addTravelVC = AddTravelViewController()
        navigationController?.pushViewController(addTravelVC, animated: true)
       
    }

}

