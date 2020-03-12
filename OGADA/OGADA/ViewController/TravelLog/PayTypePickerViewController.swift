//
//  DayPayRecordPayTypePickerViewController.swift
//  OGADA
//
//  Created by YoujinMac on 2020/03/12.
//  Copyright © 2020 didwndckd. All rights reserved.
//

import UIKit

class DayPayRecordPayTypePickerViewController: UIViewController {
    
    private let payTypeArr = [String]()
    private lazy var customView = CreateDayPayPickerView(frame: view.frame, pickerArray: PayType.cash.allCase())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setUI()
        //        setConstraint()
    }
    
    
    private func setUI() {
        customView.delegate = self
        
        customView.frame = view.frame
        view.addSubview(customView)
    }
    //    private func setConstraint() {
    //
    //    }
    
}

//MARK: extension

extension DayPayRecordPayTypePickerViewController: CreateDayPayPickerDeleget {
    func didtabCancelButton() {
        dismiss(animated: true, completion: nil)
    }
    
    func didtabOkButton() {
        print("ok BUtton")
    }
    
    
}
