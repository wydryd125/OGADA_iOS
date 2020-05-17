//
//  DayPayRecordCatgoryPickerViewController.swift
//  OGADA
//
//  Created by YoujinMac on 2020/03/12.
//  Copyright © 2020 didwndckd. All rights reserved.
//

import UIKit

class DayPayRecordCatgoryPickerViewController: UIViewController {
    
    private let categoryArr = [String]()
    private lazy var customView = CreateDayPayPickerView(frame: view.frame, pickerArray: PaymentCategory.meal.allCase())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setUI()
    }
    

    private func setUI() {
        customView.delegate = self
        
        customView.frame = view.frame
        view.addSubview(customView)
    }


}

//MARK: extension

extension DayPayRecordCatgoryPickerViewController: CreateDayPayPickerDeleget {
    func didtabCancelButton() {
        dismiss(animated: true, completion: nil)
    }
    
    func didtabOkButton() {
        print("ok BUtton")
        /*
                guard let pvc = self.presentingViewController else { return }

                self.dismiss(animated: true) {
                  pvc.present(SecondViewController(), animated: true, completion: nil)
                }
        */
        guard let presentedVC = self.presentedViewController else { return }
        
        self.dismiss(animated: true) {
//            presentedVC.category
        }
    }
    
    
}
