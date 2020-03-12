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
    private var model = MovingLineModel()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setConstraint()
        assignModel()
    }
    
    // MARK: setModel
    
    // 유저디폴츠에서 모델이 있으면 꺼내서 프로퍼티 할당을 해주고 아니면 만들어서 유저 디폴츠에 저장하고 프로파티 할당하는 함수 호출
    private func assignModel() {
        
        guard let travelKey = SelectedTravel.key else { return }
        let movingLineKey = travelKey + UserDefaultKeys.movingLineKey.rawValue
        
        if let modelData = UserDefaults.standard.data(forKey: movingLineKey) {
            // 유저디폴츠에 데이터가 있는 경우
            guard let model = try? JSONDecoder().decode(MovingLineModel.self, from: modelData) else { return }
            
            self.model = model
            
        } else { // 유저디폴츠에 데이터가 없는 경우
            
            self.model = createAndSaveModel(movingLineKey: movingLineKey)
            
        }
        
    }
    
    // 모델객체를 만들어서 유저 디폴츠에 저장하고 모델 객체 반환
    private func createAndSaveModel(movingLineKey: String) -> MovingLineModel{
        let model = MovingLineModel()
        setDateLevel()
        return model
    }
    
    private func setDateLevel() {
        guard
            let selectedTravel = SelectedTravel.shared,
            let key = SelectedTravel.key
            else { return }
        
        let startDate = selectedTravel.departureDate
        let endDate = selectedTravel.arrivalDate
        
        let dateWorker = DateWorker()
        
        let dateLevel = dateWorker.getDateLevel(start: startDate, end: endDate).map({
            dateWorker.changeDateToString(date: $0, format: "yyyy MM dd")
        })
        dump(dateLevel)
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
        let addPlacePointVC = AddPlacePointViewController(position: 1, placeList: [])
        addPlacePointVC.delegate = self
        navigationController?.pushViewController(addPlacePointVC, animated: true)
    }
    
    
}


// MARK: TableView extension

extension MovingLineViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: PlacePointCell.identifire, for: indexPath) as! PlacePointCell
        
        cell.configure(flow: String(indexPath.row + 1), title: "타이틀", address: "망원로 11")
        
        return cell
    }
    
}

extension MovingLineViewController: UITableViewDelegate {
    
    
}

extension MovingLineViewController: AddPlacePointViewControllerDelegate {
    func completeAddPlaces(position: Int, placeList: [Place]) {
        
        
        
    }
    
    
}
