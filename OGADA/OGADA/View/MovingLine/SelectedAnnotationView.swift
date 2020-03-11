//
//  SelectedAnnotationView.swift
//  OGADA
//
//  Created by 양중창 on 2020/03/11.
//  Copyright © 2020 didwndckd. All rights reserved.
//

import UIKit

class SelectedAnnotationView: UIView {
    
    private let nameLabel = UILabel()
    private let addressLabel = UILabel()
    private let pickerGuideLabel = UILabel()
    private let picker = UIPickerView()
    private let addButton = UIButton(type: .system)
    private let cancelButton = UIButton(type: .system)

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
        
        pickerGuideLabel.text = "추가할 위치"
        
        let buttonCorner: CGFloat = 16
        
        addButton.setTitle("추가", for: .normal)
        addButton.tintColor = .white
        addButton.backgroundColor = .positive
        addButton.layer.cornerRadius = buttonCorner
        
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
        
        pickerGuideLabel.topAnchor.constraint(equalTo: addressLabel.bottomAnchor, constant: yMargin).isActive = true
        pickerGuideLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: xMargin).isActive = true
        
        picker.topAnchor.constraint(equalTo: pickerGuideLabel.bottomAnchor, constant: yMargin).isActive = true
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
        
        
        transform = .init(scaleX: 0, y: 0)
    }
    
    func configure(name: String, address: String, PlaceList: [Int]) {
        
    }
    
    @objc didTapCancelButton() {
        
    }
    
}
