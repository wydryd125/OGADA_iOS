//
//  CreateDayPayView.swift
//  OGADA
//
//  Created by YoujinMac on 2020/03/11.
//  Copyright © 2020 didwndckd. All rights reserved.
//

import UIKit

protocol CreateDayPayDelegate: class {
//    func addPicture() -> UIImage?
    func addPicture() -> ()
    
    func didTabCreateButton() -> ()
    
    func didTabCategoryButton() -> ()
    
    func didTabPayTypeButton() -> ()
}

class CreateDayPayView: UIView {
    
    weak var delegate: CreateDayPayDelegate?
    
    // 고정
    private let exchangeType = UILabel()
    private let createButton = UIButton()
    
    private let addPictureButton = UIButton()
    private let categoryPicker = UIPickerView()
    private let payTypePicker = UIPickerView()
    
    private let categoryLabel = UILabel()
    private let payTypeLabel = UILabel()
    
    private let categoryButton = UIButton()
    private let payTypeButton = UIButton()
    
    private let titleTextField = UITextField()
    private let commentTextField = UITextField()
    private let paymentTextField = UITextField()
    
//    private let categoryTableView = UITableView()
//    private let payTypeTableView = UITableView()
    
    
    init(frame: CGRect, exchangeType: String) {
        super.init(frame: frame)
        
        backgroundColor = .background
        
        
        self.exchangeType.text = exchangeType
        
        setUI()
        setConstraint()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - UI
    private func setUI() {
        
        let fiexedTextFont: UIFont = .systemFont(ofSize: 16)
        let labelTextFont: UIFont = .systemFont(ofSize: 14)
        let setButtonFont: UIFont = .boldSystemFont(ofSize: 12)
        
        let fiexedTextColor: UIColor = .darkGray
        let labelTextColor: UIColor = .darkGray
        
        let labelColor: UIColor = .init(red: 0.8, green: 0.8, blue: 0.8, alpha: 1)
        
        let categoryLabelGesture = UITapGestureRecognizer(target: self, action: #selector(didTabCategory(sender:)))
        let payTypeLabelGesture = UITapGestureRecognizer(target: self, action: #selector(didTabPayType(sender:)))
        
        addPictureButton.setImage(UIImage(named: "CameraGray"), for: .normal)
        addPictureButton.addTarget(self, action: #selector(didTabAddPictureButton(sender:)), for: .touchUpInside)
        addPictureButton.imageView?.contentMode = .scaleAspectFit
        addPictureButton.backgroundColor = .init(red: 0, green: 0, blue: 0, alpha: 0.2)
        addPictureButton.layer.cornerRadius = 10
        
        exchangeType.font = fiexedTextFont
        exchangeType.textColor = fiexedTextColor
        
        categoryLabel.tintColor = labelColor
        categoryLabel.backgroundColor = labelColor
        categoryLabel.font = labelTextFont
//        categoryLabel.textAlignment = .center
        categoryLabel.text = "  카테고리 설정"
        categoryLabel.textColor = labelTextColor
        categoryLabel.isUserInteractionEnabled = true
        categoryLabel.addGestureRecognizer(categoryLabelGesture)
        
        categoryButton.setTitle("카테고리", for: .normal)
        categoryButton.titleLabel?.font = setButtonFont
        categoryButton.backgroundColor = .text
        categoryButton.layer.cornerRadius = 5
        categoryButton.addTarget(self, action: #selector(didTabCategory(sender:)), for: .touchUpInside)
        
        titleTextField.placeholder = "구입 내용"
        titleTextField.borderStyle = .roundedRect
        
        commentTextField.placeholder = "한줄평(12자 이내)"
        commentTextField.borderStyle = .roundedRect
        
        paymentTextField.placeholder = "금액"
        paymentTextField.borderStyle = .roundedRect
        
        payTypeLabel.tintColor = labelColor
        payTypeLabel.backgroundColor = labelColor
        payTypeLabel.font = labelTextFont
//        payTypeLabel.textAlignment = .center
        payTypeLabel.text = "  지불 방식 (ex: card)"
        payTypeLabel.textColor = labelTextColor
        payTypeLabel.isUserInteractionEnabled = true
        payTypeLabel.addGestureRecognizer(payTypeLabelGesture)
        
        payTypeButton.setTitle("지불방식", for: .normal)
        payTypeButton.titleLabel?.font = setButtonFont
        payTypeButton.backgroundColor = .text //LabelColor
        payTypeButton.layer.cornerRadius = 5
        payTypeButton.addTarget(self, action: #selector(didTabPayType(sender:)), for: .touchUpInside)
        
        createButton.backgroundColor = .theme
        createButton.setTitle("완료", for: .normal)
        createButton.addTarget(self, action: #selector(didTabCreateButtont(sender:)), for: .touchUpInside)
        createButton.titleLabel?.font = .boldSystemFont(ofSize: 17)
        createButton.setTitleColor(.white, for: .normal)
        createButton.layer.cornerRadius = 7
        
        [exchangeType, createButton, addPictureButton, categoryLabel, payTypeLabel, categoryButton, payTypeButton, titleTextField, commentTextField, paymentTextField,/*categoryTableView, payTypeTableView*/ /*categoryPicker,*/ /*payTypePicker,*/].forEach {
            addSubview($0)
        }
    }
    
    private func setConstraint() {
        [exchangeType, createButton, addPictureButton, categoryLabel, payTypeLabel, categoryButton, payTypeButton, titleTextField, commentTextField, paymentTextField, /*categoryTableView, payTypeTableView*/ /*categoryPicker, payTypePicker*/].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        let widthMargin: CGFloat = 65
        let hightMargin: CGFloat = 40
        let widthPadding: CGFloat = 12
        let hightPadding: CGFloat = 24
        
        let pictureSize: CGFloat = 200
        
        let fieldWidth: CGFloat = frame.width - (widthMargin * 2)

        
        let fieldHegiht: CGFloat = 30
        let buttonWidth: CGFloat = 60
        let createButtonWidth: CGFloat = fieldHegiht * 3
        
        NSLayoutConstraint.activate([
            
            addPictureButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: hightMargin),
            addPictureButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            addPictureButton.heightAnchor.constraint(equalToConstant: pictureSize),
            addPictureButton.widthAnchor.constraint(equalToConstant: pictureSize),

            categoryButton.topAnchor.constraint(equalTo: addPictureButton.bottomAnchor, constant: hightMargin),
            categoryButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: widthMargin),
            categoryButton.widthAnchor.constraint(equalToConstant: buttonWidth),
            categoryButton.heightAnchor.constraint(equalToConstant: fieldHegiht),
            
            categoryLabel.topAnchor.constraint(equalTo: categoryButton.topAnchor),
            categoryLabel.leadingAnchor.constraint(equalTo: categoryButton.trailingAnchor, constant: widthPadding),
            categoryLabel.widthAnchor.constraint(equalToConstant: fieldWidth - (widthPadding + buttonWidth)),
            categoryLabel.heightAnchor.constraint(equalToConstant: fieldHegiht),
            
            payTypeButton.topAnchor.constraint(equalTo: categoryButton.bottomAnchor, constant: hightPadding),
            payTypeButton.leadingAnchor.constraint(equalTo: categoryButton.leadingAnchor),
            payTypeButton.heightAnchor.constraint(equalToConstant: fieldHegiht),
            payTypeButton.widthAnchor.constraint(equalToConstant: buttonWidth),

            payTypeLabel.topAnchor.constraint(equalTo: payTypeButton.topAnchor),
            payTypeLabel.leadingAnchor.constraint(equalTo: categoryLabel.leadingAnchor),
            payTypeLabel.widthAnchor.constraint(equalToConstant: fieldWidth - (widthPadding + buttonWidth)),
            payTypeLabel.heightAnchor.constraint(equalToConstant: fieldHegiht),
            
//            categoryTableView.topAnchor.constraint(equalTo: categoryLabel.bottomAnchor),
//            categoryTableView.centerXAnchor.constraint(equalTo: centerXAnchor),
//            categoryTableView.widthAnchor.constraint(equalToConstant: fieldWidth),
//            categoryTableView.heightAnchor.constraint(equalToConstant: 0),
            
            titleTextField.topAnchor.constraint(equalTo: payTypeLabel.bottomAnchor, constant: hightPadding),
            titleTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleTextField.widthAnchor.constraint(equalToConstant: fieldWidth),
            titleTextField.heightAnchor.constraint(equalToConstant: fieldHegiht),

            commentTextField.topAnchor.constraint(equalTo: titleTextField.bottomAnchor, constant: hightPadding),
            commentTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            commentTextField.widthAnchor.constraint(equalToConstant: fieldWidth),
            commentTextField.heightAnchor.constraint(equalToConstant: fieldHegiht),

            paymentTextField.topAnchor.constraint(equalTo: commentTextField.bottomAnchor, constant: hightPadding),
            paymentTextField.leadingAnchor.constraint(equalTo: commentTextField.leadingAnchor),
            paymentTextField.widthAnchor.constraint(equalToConstant: fieldWidth),
            paymentTextField.heightAnchor.constraint(equalToConstant: fieldHegiht),

            exchangeType.centerYAnchor.constraint(equalTo: paymentTextField.centerYAnchor),
            exchangeType.leadingAnchor.constraint(equalTo: paymentTextField.trailingAnchor, constant: 5),
            
//            payTypeTableView.topAnchor.constraint(equalTo: payTypeLabel.bottomAnchor),
//            payTypeTableView.centerXAnchor.constraint(equalTo: centerXAnchor),
//            payTypeTableView.widthAnchor.constraint(equalToConstant: fieldWidth),
//            payTypeTableView.heightAnchor.constraint(equalToConstant: 0),
//            payTypePicker

            createButton.topAnchor.constraint(equalTo: paymentTextField.bottomAnchor, constant: hightPadding),
            createButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            createButton.heightAnchor.constraint(equalToConstant: fieldHegiht),
            createButton.widthAnchor.constraint(equalToConstant: createButtonWidth)

        ])
    }
    
    
    //MARK: - Action
    @objc private func didTabAddPictureButton(sender: UIButton) {
        print("view didTabAddPicture")
        delegate?.addPicture()
    }
    
    @objc private func didTabCreateButtont(sender: UIButton) {
        delegate?.didTabCreateButton()
    }
    
    @objc private func didTabCategory(sender: Any) {
        print("-------------------")
        print("didTabCategory")
        delegate?.didTabCategoryButton()
        
    }
    
    @objc private func didTabPayType(sender: Any) {
        print("didTabPayType")
        delegate?.didTabPayTypeButton()
    }
}



