//
//  MovingLineView.swift
//  OGADA
//
//  Created by 양중창 on 2020/03/07.
//  Copyright © 2020 didwndckd. All rights reserved.
//

import UIKit
import MapKit


class MovingLineView: UIView {
    
    typealias Zoom = (zoomLatitude: Double, zoomLongitude: Double)
    
    let mapView = MKMapView()
    let tableView = UITableView()
    
    let backButton = UIButton(type: .system)
    
    private let dateView = UIView()
    private let dateLabel = UILabel()
    let beforeDayButton = UIButton(type: .system)
    let nextDayButton = UIButton(type: .system)
    
    let addPlacePointButton = UIButton(type: .system)
    
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
        
        let cornerRadius: CGFloat = 16
        
        [mapView, backButton, dateView, tableView, addPlacePointButton].forEach({
            addSubview($0)
        })
        
        [beforeDayButton, dateLabel, nextDayButton].forEach({
            dateView.addSubview($0)
        })
        
       
        
        tableView.register(PlacePointCell.self, forCellReuseIdentifier: PlacePointCell.identifire)
        tableView.backgroundColor = .clear
        
        backButton.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        backButton.tintColor = .black
        
//        mapView.register(MKAnnotationView.self, forAnnotationViewWithReuseIdentifier: "Pin")
        mapView.layer.cornerRadius = cornerRadius
        
        dateLabel.textColor = .text
        dateLabel.textAlignment = .center
//        dateLabel.text = "3/1  (1일차)"
        
        beforeDayButton.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        beforeDayButton.tintColor = .black
        
        nextDayButton.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        nextDayButton.tintColor = .black
        
        addPlacePointButton.setImage(UIImage(systemName: "plus"), for: .normal)
        addPlacePointButton.tintColor = .white
        addPlacePointButton.backgroundColor = .theme
    }
    
    private func setConstraint() {
        
        let guide = safeAreaLayoutGuide
        
        let margin: CGFloat = 8
        let xMargin = margin * 2
        let multiplier: CGFloat = 0.15
        
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.topAnchor.constraint(equalTo: guide.topAnchor, constant: margin).isActive = true
        backButton.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: margin).isActive = true
        
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: margin).isActive = true
        mapView.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: margin).isActive = true
        mapView.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -margin).isActive = true
        mapView.heightAnchor.constraint(equalTo: guide.heightAnchor, multiplier: 0.4).isActive = true
        
        dateView.translatesAutoresizingMaskIntoConstraints = false
        dateView.topAnchor.constraint(equalTo: mapView.bottomAnchor, constant: margin).isActive = true
        dateView.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: xMargin).isActive = true
        dateView.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -xMargin).isActive = true
        
        beforeDayButton.translatesAutoresizingMaskIntoConstraints = false
        beforeDayButton.topAnchor.constraint(equalTo: dateView.topAnchor).isActive = true
        beforeDayButton.leadingAnchor.constraint(equalTo: dateView.leadingAnchor).isActive = true
        beforeDayButton.bottomAnchor.constraint(equalTo: dateView.bottomAnchor).isActive = true
        beforeDayButton.widthAnchor.constraint(equalTo: beforeDayButton.heightAnchor).isActive = true
        
        nextDayButton.translatesAutoresizingMaskIntoConstraints = false
        nextDayButton.topAnchor.constraint(equalTo: dateView.topAnchor).isActive = true
        nextDayButton.trailingAnchor.constraint(equalTo: dateView.trailingAnchor).isActive = true
        nextDayButton.bottomAnchor.constraint(equalTo: dateView.bottomAnchor).isActive = true
        nextDayButton.widthAnchor.constraint(equalTo: nextDayButton.heightAnchor).isActive = true
        
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.topAnchor.constraint(equalTo: dateView.topAnchor).isActive = true
        dateLabel.leadingAnchor.constraint(equalTo: beforeDayButton.trailingAnchor).isActive = true
        dateLabel.trailingAnchor.constraint(equalTo: nextDayButton.leadingAnchor).isActive = true
        dateLabel.bottomAnchor.constraint(equalTo: dateView.bottomAnchor).isActive = true
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: dateView.bottomAnchor, constant: margin).isActive = true
        tableView.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: margin).isActive = true
        tableView.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -margin).isActive = true
        tableView.bottomAnchor.constraint(equalTo: guide.bottomAnchor).isActive = true
        
        addPlacePointButton.translatesAutoresizingMaskIntoConstraints = false
        addPlacePointButton.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: -margin).isActive = true
        addPlacePointButton.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -margin).isActive = true
        addPlacePointButton.widthAnchor.constraint(equalTo: guide.widthAnchor, multiplier: multiplier).isActive = true
        addPlacePointButton.heightAnchor.constraint(equalTo: addPlacePointButton.widthAnchor).isActive = true
        
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        addPlacePointButton.layer.cornerRadius = addPlacePointButton.bounds.width / 2
        
        tableView.rowHeight = tableView.bounds.height / 4
    }
    
    
    //MARK: Action
    
    func configure(dateLevel: String, position: Int, maximunPosition: Int) {
        
        switch position {
        case 0:
            hiddenView(view: beforeDayButton)
            displayView(view: nextDayButton)
        case maximunPosition:
            hiddenView(view: nextDayButton)
            displayView(view: beforeDayButton)
        default:
            displayView(view: nextDayButton)
            displayView(view: beforeDayButton)
        }
        
        dateLabel.text = dateLevel
        
    }
    
    // 데이터 변경사항 테이블뷰, 맵뷰에 적용 (어노테이션들의 중간 지점으로 이동)
    func reLoadDatas(placeList: [Place]) {
        
        tableView.reloadData()
        mapView.removeAnnotations(mapView.annotations)
        
        guard !placeList.isEmpty else { return }
        
        for (index, place) in placeList.enumerated() {
            
            let coordinate = CLLocationCoordinate2D(latitude: place.latitude, longitude: place.longitude)
            addAnnotation(name: place.name, address: place.address, coordinate: coordinate, index: index)
            
        }
        let center = getCenter(placeList: placeList)
        let zoom = getZoom(placeList: placeList)
        
        setResion(latitude: center.latitude, longitude: center.longitude, latZoom: zoom.zoomLatitude, logZoom: zoom.zoomLongitude)
        
    }
    
    func updateDatas(placeList: [Place], position: Place) {
        tableView.reloadData()
        mapView.removeAnnotations(mapView.annotations)
        
        guard !placeList.isEmpty else { return }
        
        for (index, place) in placeList.enumerated() {
            
            let coordinate = CLLocationCoordinate2D(latitude: place.latitude, longitude: place.longitude)
            addAnnotation(name: place.name, address: place.address, coordinate: coordinate, index: index)
            
        }
        
        setResion(latitude: position.latitude, longitude: position.longitude, latZoom: 0.001, logZoom: 0.001)
    }
    
    // 중심좌표 및 줌 반환 메서드
    private func getCenter(placeList: [Place]) -> CLLocationCoordinate2D {
        let latitude = placeList.reduce(0.0, { $0 + $1.latitude } ) / Double(placeList.count)
        let longitude = placeList.reduce(0.0, { $0 + $1.longitude } ) / Double(placeList.count)
        let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        return coordinate
    }
    
    private func getZoom(placeList: [Place]) -> Zoom {
        var latZoom = 0.001
        var logZoom = 0.001
        
        
        let sortedLatitude = placeList.sorted(by: { (before, next) in
            before.latitude < next.latitude
        })
        
        let sortedLongitude = placeList.sorted(by: { (before, next) in
            before.longitude < next.longitude
        })
        
        
        if let maximumLatitude = sortedLatitude.last?.latitude, let minimumLatitude = sortedLatitude.first?.latitude {
            latZoom = (maximumLatitude - minimumLatitude) * 1.4
        }
        if let maximumLongitude = sortedLongitude.last?.longitude, let minimumLongitude = sortedLongitude.first?.longitude {
            logZoom = (maximumLongitude - minimumLongitude) * 1.4
        }
        
        return (latZoom, logZoom)
    }
    
    // 맵뷰 시점 이동
    func setResion(latitude: Double, longitude: Double, latZoom: Double, logZoom: Double) {
        let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let span = MKCoordinateSpan(latitudeDelta: latZoom, longitudeDelta: logZoom)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        mapView.setRegion(region, animated: true)
    }
    
    // 맵뷰 어노테이션 찍기
    private func addAnnotation(name: String?, address: String?, coordinate: CLLocationCoordinate2D, index: Int) {
        let annotation = MovingLineAnnotation(index: index)
        annotation.title = name
        annotation.subtitle = address
        annotation.coordinate = coordinate
        mapView.addAnnotation(annotation)
    }
    
    
    private func hiddenView(view: UIView) {
        if !view.isHidden {
            UIView.animate(withDuration: 0.2, animations: {
                view.transform = .init(scaleX: 0.0001, y: 1)
            }, completion: { _ in
                view.isHidden = true
            })
        }
        
    }
    
    private func displayView(view: UIView) {
        if view.isHidden {
            view.isHidden = false
            UIView.animate(withDuration: 0.2, animations: {
                view.transform = .identity
            })
        }
    }
    
    
    
}
