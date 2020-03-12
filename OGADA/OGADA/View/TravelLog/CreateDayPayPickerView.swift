//
//  CreateDayPayPickerView.swift
//  OGADA
//
//  Created by YoujinMac on 2020/03/12.
//  Copyright © 2020 didwndckd. All rights reserved.
//

import UIKit

protocol CreateDayPayPickerDeleget: class {
    func didtabCancelButton() -> ()
    func didtabOkButton() -> ()
}

class CreateDayPayPickerView: UIView {
    
    weak var delegate: CreateDayPayPickerDeleget?
    
    private let baseView = UIView()
    private let picker = UIPickerView()
    
    private let cancelButton = UIButton()
    private let okButton = UIButton()
    
    
    private let pickerArray: [String]
    private var selectItem: String?
    
    init(frame: CGRect, pickerArray: [String]) {
        
        self.pickerArray = pickerArray
        
        super.init(frame: frame)
        
        setUI()
        setContraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        backgroundColor = UIColor.black.withAlphaComponent(0.4)
        
        baseView.backgroundColor = .white
        baseView.layer.cornerRadius = 10
        
        
        picker.delegate = self
        picker.dataSource = self
        
        cancelButton.setTitle("취소", for: .normal)
        cancelButton.setTitleColor(.red, for: .normal)
        cancelButton.addTarget(self, action: #selector(didTabCancelButton(sender:)), for: .touchUpInside)
        
        okButton.setTitle("확인", for: .normal)
        okButton.setTitleColor(.blue, for: .normal)
        okButton.addTarget(self, action: #selector(didTabOKButton(sender:)), for: .touchUpInside)
        
        
        addSubview(baseView)
        [picker, cancelButton, okButton].forEach {
            baseView.addSubview($0)
        }
    }
    private func setContraint() {
        [baseView, picker, cancelButton, okButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        
        let baseViewWidth: CGFloat = 240
        let baseViewHight: CGFloat = 200
        
        let baseMargin: CGFloat = 16
        let basePadding: CGFloat = 8
        
        let buttonWidth: CGFloat = baseViewWidth / 2
        let buttonHight: CGFloat = 40
        
        let pickerWidth: CGFloat = baseViewWidth - (baseMargin * 2)
        let pickerHight: CGFloat = baseViewHight - (buttonHight + baseMargin + basePadding)
        
        // baseView
        NSLayoutConstraint.activate([
            baseView.centerYAnchor.constraint(equalTo: centerYAnchor),
            baseView.centerXAnchor.constraint(equalTo: centerXAnchor),
            baseView.widthAnchor.constraint(equalToConstant: baseViewWidth),
            baseView.heightAnchor.constraint(equalToConstant: baseViewHight)
        ])
        // other
        NSLayoutConstraint.activate([
            picker.topAnchor.constraint(equalTo: baseView.topAnchor, constant: baseMargin),
            picker.centerXAnchor.constraint(equalTo: baseView.centerXAnchor),
            picker.widthAnchor.constraint(equalToConstant: pickerWidth),
            picker.heightAnchor.constraint(equalToConstant: pickerHight),
            
            cancelButton.topAnchor.constraint(equalTo: picker.bottomAnchor, constant: basePadding),
            cancelButton.leadingAnchor.constraint(equalTo: baseView.leadingAnchor),
            cancelButton.widthAnchor.constraint(equalToConstant: buttonWidth),
            cancelButton.heightAnchor.constraint(equalToConstant: buttonHight),
            
            okButton.topAnchor.constraint(equalTo: cancelButton.topAnchor),
            okButton.leadingAnchor.constraint(equalTo: cancelButton.trailingAnchor),
            okButton.widthAnchor.constraint(equalToConstant: buttonWidth),
            okButton.heightAnchor.constraint(equalToConstant: buttonHight)
        ])
    }
    
    
    @objc private func didTabCancelButton(sender: UIButton) {
        delegate?.didtabCancelButton()
    }
    
    @objc private func didTabOKButton(sender: UIButton) {
        print("customPickerView OKButton")
        delegate?.didtabOkButton()
    }
    
}

//MARK: UIPicker DataSource
extension CreateDayPayPickerView: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        // 1줄에 몇개나 나타낼지.
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerArray.count
    }
    
    
}

//MARK: UIPicker Delegate
extension CreateDayPayPickerView: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        // index에 맞는 값 뿌려주기
        
        return pickerArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("\(row)")
        print(pickerArray[row])
        selectItem = pickerArray[row]
        print("selectItem -> \(selectItem)")
    }
}
