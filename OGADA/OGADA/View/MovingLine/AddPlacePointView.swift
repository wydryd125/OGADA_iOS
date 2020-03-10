//
//  AddPlacePointView.swift
//  OGADA
//
//  Created by 양중창 on 2020/03/09.
//  Copyright © 2020 didwndckd. All rights reserved.
//

import UIKit
import GoogleMaps

class AddPlacePointView: UIView {
    
    private let searchView = UIView()
    let searchTextField = UITextField()
    let searchButton = UIButton(type: .system)
    let searchValueTabelView = UITableView()
    
    let backButton = UIButton(type: .system)
    
    private let camera: GMSCameraPosition
    let  mapView: GMSMapView
    
    
    private var searchValueTabelViewHeightConstraint: NSLayoutConstraint?
    
    override init(frame: CGRect) {
        self.camera = GMSCameraPosition.camera(withTarget: CLLocationCoordinate2D(latitude: -33.86, longitude: 151.20), zoom: 12)
        self.mapView = GMSMapView.map(withFrame: .zero, camera: camera)
        super.init(frame: frame)
        setUI()
        setConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: UI
    
    private func setUI() {
        backgroundColor = .background
        
        [mapView, searchView, backButton].forEach({
            addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        })
        [searchTextField, searchButton, searchValueTabelView].forEach({
            searchView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        })
        
        searchView.backgroundColor = .white
        searchView.layer.cornerRadius = 5
        searchView.layer.shadowOpacity = 0.7
        searchView.layer.shadowRadius = 5
        searchView.layer.shadowOffset = .init(width: 5, height: 0)
        
        backButton.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        backButton.tintColor = .text
        
        searchTextField.placeholder = "search"
        searchTextField.backgroundColor = .clear
        
        searchButton.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        searchButton.tintColor = .text
        
        
    }
    
    private func setConstraint() {
        
        let guide = safeAreaLayoutGuide
        
        let margin: CGFloat = 8
        
        let searchViewYMargin: CGFloat = 8
        
        mapView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        mapView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        mapView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        mapView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        backButton.topAnchor.constraint(equalTo: guide.topAnchor, constant: margin).isActive = true
        backButton.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: margin).isActive = true
        
        searchView.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: margin).isActive = true
        searchView.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: margin).isActive = true
        searchView.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -margin).isActive = true
        
        searchTextField.topAnchor.constraint(equalTo: searchView.topAnchor, constant: margin).isActive = true
        searchTextField.leadingAnchor.constraint(equalTo: searchView.leadingAnchor, constant: margin).isActive = true
//        searchTextField.bottomAnchor.constraint(equalTo: searchView.bottomAnchor, constant: -margin).isActive = true
        
        searchButton.topAnchor.constraint(equalTo: searchView.topAnchor, constant: searchViewYMargin).isActive = true
//        searchButton.bottomAnchor.constraint(equalTo: searchView.bottomAnchor, constant: -searchButtonYMargin).isActive = true
        searchButton.leadingAnchor.constraint(equalTo: searchTextField.trailingAnchor, constant: margin).isActive = true
        searchButton.trailingAnchor.constraint(equalTo: searchView.trailingAnchor, constant: -margin).isActive = true
        searchButton.widthAnchor.constraint(equalTo: searchButton.heightAnchor).isActive = true
        
        searchValueTabelView.topAnchor.constraint(equalTo: searchButton.bottomAnchor, constant: searchViewYMargin).isActive = true
        searchValueTabelView.leadingAnchor.constraint(equalTo: searchView.leadingAnchor).isActive = true
        searchValueTabelView.trailingAnchor.constraint(equalTo: searchView.trailingAnchor).isActive = true
        searchValueTabelViewHeightConstraint = searchValueTabelView.heightAnchor.constraint(equalToConstant: 0)
        searchValueTabelViewHeightConstraint?.isActive = true
        searchValueTabelView.bottomAnchor.constraint(equalTo: searchView.bottomAnchor).isActive = true
        
    }
    
    //MARK: Action
    
    func canceldSearch() {
        endEditing(true)
        UIView.animate(withDuration: 0.2, animations: {
            self.searchValueTabelViewHeightConstraint?.constant = 0
            self.layoutIfNeeded()
        })
    }

}
