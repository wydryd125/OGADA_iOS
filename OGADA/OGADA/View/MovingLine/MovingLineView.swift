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
        
        mapView.layer.cornerRadius = cornerRadius
        
        dateLabel.textColor = .text
        dateLabel.textAlignment = .center
        dateLabel.text = "3/1  (1일차)"
        
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
    
    
    
    
    
}
