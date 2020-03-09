//
//  AddPlacePointViewController.swift
//  OGADA
//
//  Created by 양중창 on 2020/03/09.
//  Copyright © 2020 didwndckd. All rights reserved.
//

import UIKit
import GoogleMaps

class AddPlacePointViewController: UIViewController {
    
    private let addPlacePointView = AddPlacePointView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setConstraint()
    }
    
    //MARK: UI
    
    private func setUI() {
        view.addSubview(addPlacePointView)
        
        addPlacePointView.backButton.addTarget(
            self,
            action: #selector(popAction(sender:)),
            for: .touchUpInside)
        
        addPlacePointView.searchButton.addTarget(
            self,
            action: #selector(didTapSearchButton(sender:)),
            for: .touchUpInside)
        
        addPlacePointView.mapView.delegate = self
    }
    
    private func setConstraint() {
        addPlacePointView.translatesAutoresizingMaskIntoConstraints = false
        addPlacePointView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        addPlacePointView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        addPlacePointView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        addPlacePointView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    //MARK: Action
    
    @objc private func popAction(sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func didTapSearchButton(sender: UIButton) {
        print(#function)
        let testVC = TestViewController()
        navigationController?.pushViewController(testVC, animated: true)
    }

}


//MARK: mapViewDelegate
extension AddPlacePointViewController: GMSMapViewDelegate {
    
    // 맵뷰 터치 메서드
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        addPlacePointView.canceldSearch()
    }
    
    func mapView(_ mapView: GMSMapView, didChange position: GMSCameraPosition) {
        addPlacePointView.canceldSearch()
    }
}
