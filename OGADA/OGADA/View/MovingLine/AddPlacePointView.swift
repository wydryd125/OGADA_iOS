//
//  AddPlacePointView.swift
//  OGADA
//
//  Created by 양중창 on 2020/03/09.
//  Copyright © 2020 didwndckd. All rights reserved.
//

import UIKit
import MapKit
import GooglePlaces

class AddPlacePointView: UIView {
    
    let backButton = UIButton(type: .system)
    
    let  mapView = MKMapView()
    
    private let selectedAnnotationView = SelectedAnnotationView()
    
    private var searchValueTabelViewHeightConstraint: NSLayoutConstraint?
    
    override init(frame: CGRect) {
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
        
        
        
        [mapView, backButton, selectedAnnotationView].forEach({
            addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        })
        
        
        backButton.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        backButton.tintColor = .text
        
        
    }
    
    private func setConstraint() {
        
        let guide = safeAreaLayoutGuide
        
        let margin: CGFloat = 8
        
//        let selectedAnnotationViewXMargin: CGFloat = 40
//        let selectedAnnotationViewYMargin: CGFloat = 40
        
        mapView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        mapView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        mapView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        mapView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        backButton.topAnchor.constraint(equalTo: guide.topAnchor, constant: margin).isActive = true
        backButton.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: margin).isActive = true
        
//        selectedAnnotationView.topAnchor.constraint(equalTo: guide.topAnchor, constant: selectedAnnotationViewYMargin).isActive = true
//        selectedAnnotationView.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: selectedAnnotationViewXMargin).isActive = true
//        selectedAnnotationView.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -selectedAnnotationViewXMargin).isActive = true
//        selectedAnnotationView.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: -selectedAnnotationViewYMargin).isActive = true
        
        selectedAnnotationView.centerXAnchor.constraint(equalTo: guide.centerXAnchor).isActive = true
        selectedAnnotationView.centerYAnchor.constraint(equalTo: guide.centerYAnchor).isActive = true
        
        
    }
    
    //MARK: Action
    
    func canceldSearch() {
        endEditing(true)
        UIView.animate(withDuration: 0.2, animations: {
            self.searchValueTabelViewHeightConstraint?.constant = 0
            self.layoutIfNeeded()
        })
    }
    
    
    // 기존 어노테이션들 삭제
    func removeAnnotations() {
        mapView.removeAnnotations(mapView.annotations)
    }

}
