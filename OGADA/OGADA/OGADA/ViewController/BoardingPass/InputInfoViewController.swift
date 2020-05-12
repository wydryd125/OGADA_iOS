//
//  InputInfoViewController.swift
//  OGADA
//
//  Created by 정유경 on 2020/03/11.
//  Copyright © 2020 didwndckd. All rights reserved.
//

import UIKit

class InputInfoViewController: BaseViewController {
    
    let leftImageView = UIImageView()
    let leftImageView2 = UIImageView()
    let rightImageView = UIImageView()
    let arrivalAirPortTextField = UITextField()
    let flightTextField = UITextField()
    let airlineTextField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .background
        setUI()
        setConstraints()

    }
    //MARK: UI
    func setUI() {
        let textSize: CGFloat = 24
      
        [leftImageView, leftImageView2].forEach {
            $0.image = UIImage(named: "left")
            $0.contentMode = .scaleAspectFill
            view.addSubview($0)
        }
        
        rightImageView.image = UIImage(named: "right")
        rightImageView.contentMode = .scaleAspectFill
        view.addSubview(rightImageView)
        
        arrivalAirPortTextField.placeholder = "도착지 적어줘"
        arrivalAirPortTextField.textColor = .text
        arrivalAirPortTextField.textAlignment = .center
        arrivalAirPortTextField.font = UIFont.boldSystemFont(ofSize: textSize)
        arrivalAirPortTextField.backgroundColor = .clear
        view.addSubview(arrivalAirPortTextField)
        
        flightTextField.placeholder = "항공편명 적어줘"
        flightTextField.textColor = .text
        flightTextField.textAlignment = .center
        flightTextField.font = UIFont.boldSystemFont(ofSize: textSize)
        flightTextField.backgroundColor = .clear
        view.addSubview(flightTextField)
        
        airlineTextField.placeholder = "항공사 적어줘"
        airlineTextField.textColor = .text
        airlineTextField.textAlignment = .center
        airlineTextField.font = UIFont.boldSystemFont(ofSize: textSize)
        airlineTextField.backgroundColor = .clear
        view.addSubview(airlineTextField)
        
        
    }
    func setConstraints() {
        let guide = view.safeAreaLayoutGuide
        let padding: CGFloat = 8
        let height: CGFloat = 32
              
        [leftImageView,rightImageView,arrivalAirPortTextField,flightTextField,airlineTextField,leftImageView2].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
            
        arrivalAirPortTextField.topAnchor.constraint(equalTo: guide.topAnchor, constant: padding * 8).isActive = true
        arrivalAirPortTextField.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: padding * 8).isActive = true
        arrivalAirPortTextField.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -padding * 8).isActive = true
        arrivalAirPortTextField.heightAnchor.constraint(equalToConstant: height).isActive = true
        
        leftImageView.topAnchor.constraint(equalTo: arrivalAirPortTextField.bottomAnchor, constant:  -padding * 2).isActive = true
        leftImageView.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: padding * 4).isActive = true
        leftImageView.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -padding * 4).isActive = true
        leftImageView.heightAnchor.constraint(equalToConstant: height).isActive = true
        
        flightTextField.topAnchor.constraint(equalTo: arrivalAirPortTextField.bottomAnchor, constant: padding * 8).isActive = true
        flightTextField.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: padding * 8).isActive = true
        flightTextField.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -padding * 8).isActive = true
        flightTextField.heightAnchor.constraint(equalToConstant: height).isActive = true
        
        rightImageView.topAnchor.constraint(equalTo: flightTextField.bottomAnchor, constant:  -padding * 2).isActive = true
        rightImageView.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: padding * 4).isActive = true
        rightImageView.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -padding * 4).isActive = true
        rightImageView.heightAnchor.constraint(equalToConstant: height).isActive = true
        
        airlineTextField.topAnchor.constraint(equalTo: rightImageView.bottomAnchor, constant: padding * 8).isActive = true
        airlineTextField.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: padding * 8).isActive = true
        airlineTextField.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -padding * 8).isActive = true
        airlineTextField.heightAnchor.constraint(equalToConstant: height).isActive = true
        
        leftImageView2.topAnchor.constraint(equalTo: airlineTextField.bottomAnchor, constant:  -padding * 2).isActive = true
        leftImageView2.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: padding * 4).isActive = true
        leftImageView2.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -padding * 4).isActive = true
        leftImageView2.heightAnchor.constraint(equalToConstant: height).isActive = true
        
    }
    
}
    


