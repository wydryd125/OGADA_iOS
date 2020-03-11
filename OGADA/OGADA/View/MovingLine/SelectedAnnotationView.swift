//
//  SelectedAnnotationView.swift
//  OGADA
//
//  Created by 양중창 on 2020/03/11.
//  Copyright © 2020 didwndckd. All rights reserved.
//

import UIKit

protocol SelectedAnnotationViewDelegate: class {
    func addAction(index: Int)
}

class SelectedAnnotationView: UIView {
    
    private let nameLabel = UILabel()
    private let addressLabel = UILabel()
    private let pickerGuideLabel = UILabel()
    let picker = UIPickerView()
    let addButton = UIButton(type: .system)
    let cancelButton = UIButton(type: .system)
    private var placeList: [Place] = [] {
        didSet {
            picker.reloadAllComponents()
            picker.selectedRow(inComponent: 0)
        }
    }
    
//    weak var delegate: SelectedAnnotationViewDelegate?

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
        
        [nameLabel, addressLabel, pickerGuideLabel, picker, addButton, cancelButton].forEach({
            addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        })
        
        layer.cornerRadius = 8
        
        nameLabel.textColor = .text
        nameLabel.font = .systemFont(ofSize: 20, weight: .bold)
        
        addressLabel.textColor = .subText
        addressLabel.numberOfLines = 0
        
        pickerGuideLabel.text = "추가할 위치"
        
        let buttonCorner: CGFloat = 8
        
        addButton.setTitle("추가", for: .normal)
        addButton.tintColor = .white
        addButton.backgroundColor = .positive
        addButton.layer.cornerRadius = buttonCorner
//        addButton.addTarget(self, action: #selector(didTapAddButton), for: .touchUpInside)
        
        cancelButton.setTitle("취소", for: .normal)
        cancelButton.tintColor = .white
        cancelButton.backgroundColor = .negative
        cancelButton.layer.cornerRadius = buttonCorner
        
        
    }
    
    private func setConstraint() {
        
        let margin: CGFloat = 8
        let xMargin = margin
        let yMargin = margin * 2
        
        nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: yMargin).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: xMargin).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -xMargin).isActive = true
        
        addressLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: yMargin).isActive = true
        addressLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: xMargin).isActive = true
        addressLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -xMargin).isActive = true
//        addressLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
        
        pickerGuideLabel.topAnchor.constraint(equalTo: addressLabel.bottomAnchor, constant: yMargin).isActive = true
        pickerGuideLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: xMargin).isActive = true
        
        picker.topAnchor.constraint(equalTo: pickerGuideLabel.bottomAnchor, constant: margin).isActive = true
        picker.leadingAnchor.constraint(equalTo: leadingAnchor, constant: xMargin).isActive = true
        picker.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -xMargin).isActive = true
        
        addButton.topAnchor.constraint(equalTo: picker.bottomAnchor, constant: yMargin).isActive = true
        addButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: xMargin).isActive = true
        addButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -yMargin).isActive = true
        
        cancelButton.topAnchor.constraint(equalTo: picker.bottomAnchor, constant: yMargin).isActive = true
        cancelButton.leadingAnchor.constraint(equalTo: addButton.trailingAnchor, constant: xMargin).isActive = true
        cancelButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -xMargin).isActive = true
        cancelButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -yMargin).isActive = true
        cancelButton.widthAnchor.constraint(equalTo: addButton.widthAnchor).isActive = true
        
        self.isHidden = true
        self.transform = .init(scaleX: 0.001, y: 0.001)
    }
    
    
    
    
    //MARK: Action
    
    func configure(selectedPlace: Place) {
        nameLabel.text = selectedPlace.name
        addressLabel.text = selectedPlace.address
//        self.placeList = placeList
        picker.reloadAllComponents()
        picker.selectRow(0, inComponent: 0, animated: false)
        displayView()
    }
    
    
    func hiddenView() {
        UIView.animate(withDuration: 0.2, animations: {
            self.transform = .init(scaleX: 0.001, y: 0.001)
        }, completion: { _ in
            self.isHidden = true
        })
    }
    
    func displayView() {
        isHidden = false
        UIView.animate(withDuration: 0.2, animations: {
            self.transform = .identity
        })
    }
    
}
