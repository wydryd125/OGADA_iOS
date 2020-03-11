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
    
    private lazy var movingeLineView = MovingLineView(coordinate: CLLocationCoordinate2D(latitude: -33.86, longitude: 151.20), zoom: 12)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setConstraint()
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
        let addPlacePointVC = AddPlacePointViewController()
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
