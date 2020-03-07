//
//  MovingLineView.swift
//  OGADA
//
//  Created by 양중창 on 2020/03/07.
//  Copyright © 2020 didwndckd. All rights reserved.
//

import UIKit
import GoogleMaps

class MovingLineView: UIView {
    
    private let camera: GMSCameraPosition
    let mapView: GMSMapView
    
    init(coordinate: CLLocationCoordinate2D, zoom: Float) {
        
        self.camera = GMSCameraPosition.camera(withTarget: coordinate, zoom: zoom)
        self.mapView = GMSMapView.map(withFrame: .zero, camera: camera)
        
        super.init(frame: .zero)
        
        setUI()
        setConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: UI
    
    private func setUI() {
        
        backgroundColor = .background
        
        [mapView].forEach({
            addSubview($0)
        })
        
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: -33.86, longitude: 151.20)
        marker.title = "Sydney"
        marker.snippet = "Australia"
        marker.map = mapView
    }
    
    private func setConstraint() {
        
        let guide = safeAreaLayoutGuide
        
        let margin: CGFloat = 8
        
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
        mapView.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: margin).isActive = true
        mapView.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -margin).isActive = true
        mapView.heightAnchor.constraint(equalTo: guide.heightAnchor, multiplier: 0.4).isActive = true
        
    }
    
    
    
    
    
}
