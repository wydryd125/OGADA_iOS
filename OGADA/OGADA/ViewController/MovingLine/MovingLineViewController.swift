//
//  MovingLineViewController.swift
//  OGADA
//
//  Created by 양중창 on 2020/03/04.
//  Copyright © 2020 didwndckd. All rights reserved.
//

import UIKit
import CoreLocation
import GoogleMaps

class MovingLineViewController: UIViewController {
    
    private let movingeLineView = MovingLineView()
    private var model: MovingLineModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        assignModel()
        setUI()
        setConstraint()
        movingeLineView.reLoadDatas(placeList: model.getPlaceList())
    }
    
    // MARK: setModel
    
    // 모델 생성및 할당
    private func assignModel() {
        
        guard
            let travelKey = SelectedTravel.key,
            let selectedTravel = SelectedTravel.shared
        else {
            navigationController?.popViewController(animated: true)
            return
        }
        
        let modelKey = travelKey + UserDefaultKeys.movingLineKey.rawValue
        self.model = MovingLineModel(
            modelKey: modelKey,
            startDate: selectedTravel.departureDate,
            endDate: selectedTravel.arrivalDate)
    }
    
    
    // MARK: UI
    private func setUI() {
        view.addSubview(movingeLineView)
        navigationController?.navigationBar.isHidden = false
        
        
        movingeLineView.tableView.dataSource = self
        movingeLineView.tableView.delegate = self
        
        movingeLineView.addPlacePointButton.addTarget(
            self,
            action: #selector(didTapAddPlacePointButton(sender:)),
            for: .touchUpInside)
        
        movingeLineView.backButton.addTarget(
            self,
            action: #selector(popAction(sender:)),
            for: .touchUpInside)
        
        movingeLineView.beforeDayButton.addTarget(
            self,
            action: #selector(didTapBeforeButton(sender:)),
            for: .touchUpInside)
        
        movingeLineView.nextDayButton.addTarget(
            self,
            action: #selector(didTapNextButtton(sender:)),
            for: .touchUpInside)
        
        movingeLineView.configure(dateLevel: model.getDateToString(), position: model.currentDateLevel, maximunPosition: model.getPlaceList().count - 1)
    }
    
    private func setConstraint() {
        
        movingeLineView.translatesAutoresizingMaskIntoConstraints = false
        movingeLineView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        movingeLineView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        movingeLineView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        movingeLineView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
    }
    
    // MARK: Action
    
    // 메인화면으로 돌아가는 함수
    @objc private func popAction(sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    // + 버튼 누르면 새로운 포인트 추가하는 버튼
    @objc private func didTapAddPlacePointButton(sender: UIButton) {
//        print(model.currentDateLevel)
        let addPlacePointVC = AddPlacePointViewController(position: model.currentDateLevel, placeList: model.getPlaceList())
        addPlacePointVC.delegate = self
        navigationController?.pushViewController(addPlacePointVC, animated: true)
    }
    
    // 일차 오른쪽 버튼 클릭 -> 포지션값을 바꾸고 뷰 새로 세팅
    @objc func didTapNextButtton(sender: UIButton) {
//        print(#function)
        let maximumPosition = model.dateList.count - 1
        guard model.currentDateLevel < maximumPosition else { return }
        
        model.currentDateLevel += 1
        let dateLevel = model.getDateToString()
        let position = model.currentDateLevel
        
        movingeLineView.configure(dateLevel: dateLevel, position: position, maximunPosition: maximumPosition)
        movingeLineView.reLoadDatas(placeList: model.getPlaceList())
        
        
    }
    
    // 일차 왼쪽 버튼 클릭 -> 포지션값을 바꾸고 뷰 새로 세팅
    @objc func didTapBeforeButton(sender: UIButton) {
//        print(#function)
        let maximumPosition = model.dateList.count - 1
        guard model.currentDateLevel > 0 else { return }
        
        model.currentDateLevel -= 1
        let dateLevel = model.getDateToString()
        let position = model.currentDateLevel
        
        movingeLineView.configure(dateLevel: dateLevel, position: position, maximunPosition: maximumPosition)
        movingeLineView.reLoadDatas(placeList: model.getPlaceList())
    }
    
    
}


// MARK: TableView extension

extension MovingLineViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        model.getPlaceList().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let place = model.getPlace(index: indexPath.row)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: PlacePointCell.identifire, for: indexPath) as! PlacePointCell
        
        cell.configure(flow: "\(indexPath.row + 1)", title: place.name, address: place.address, isVisit: place.isVisit)
        
        return cell
    }
    
}

extension MovingLineViewController: UITableViewDelegate {
    
    
}

extension MovingLineViewController: AddPlacePointViewControllerDelegate {
    func completeAddPlaces(position: Int, placeList: [Place]) {
//        print(#function)
//        print(placeList)
        model.upDatePlaceList(position: position, placeList: placeList)
        movingeLineView.reLoadDatas(placeList: model.getPlaceList())
    }
    
    
}
