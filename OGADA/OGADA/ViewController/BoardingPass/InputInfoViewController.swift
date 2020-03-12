//
//  InputInfoViewController.swift
//  OGADA
//
//  Created by 정유경 on 2020/03/11.
//  Copyright © 2020 didwndckd. All rights reserved.
//

import UIKit

class InputInfoViewController: BaseViewController {
   
//    let startTime: String?
////    let startTimeInputLabel = UILabel()
//    let endTimeLabel: String?
//    let endTimeInputLabel = UILabel()
    let arrivalAirPortTextField = UITextField()
    let flightTextField = UITextField()
    let airlineTextField = UITextField()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .background
//        setUI()
//        setConstraints()

      
    }
    //MARK: UI
    func setUI() {
        
        arrivalAirPortTextField.placeholder = "도착지 적어줘"
        arrivalAirPortTextField.textColor = .text
        arrivalAirPortTextField.backgroundColor = .theme
        view.addSubview(arrivalAirPortTextField)
        
        flightTextField.placeholder = "항공편명 적어줘"
        flightTextField.textColor = .text
        flightTextField.backgroundColor = .theme
        view.addSubview(flightTextField)
        
        airlineTextField.placeholder = "항공사 적어줘"
        airlineTextField.textColor = .text
        airlineTextField.backgroundColor = .theme
        view.addSubview(airlineTextField)
        
        
    }
    func setConstraints() {
        let guide = view.safeAreaLayoutGuide
        let padding: CGFloat = 8
              
        [arrivalAirPortTextField,flightTextField,airlineTextField].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = true
        }
        
//        arrivalAirPortTextField.topAnchor.constraint(equalTo: guide.topAnchor, constant: padding * 8).isActive = true
//        arrivalAirPortTextField.c
        
    }
    

}
