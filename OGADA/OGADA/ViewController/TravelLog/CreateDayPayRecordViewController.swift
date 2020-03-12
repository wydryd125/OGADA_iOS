//
//  CreateDayPayRecordViewController.swift
//  OGADA
//
//  Created by YoujinMac on 2020/03/10.
//  Copyright © 2020 didwndckd. All rights reserved.
//

import UIKit

class CreateDayPayRecordViewController: BaseViewController {
    
    let category: String = ""
    
    private let exchangeType = SelectedTravel.shared!.foreign.rawValue
    
    private lazy var createView = CreateDayPayView(frame: view.frame, exchangeType: exchangeType)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .background
        // Do any additional setup after loading the view.
        setUI()
        setConstraint()
    }
    
    //MARK: - UI
    private func setUI() {
        createView.delegate = self
        
        view.addSubview(createView)
        view.bringSubviewToFront(backButton)
    }
    
    private func setConstraint() {
        createView.frame = view.frame

    }

    //MARK: - Action
    override func popAction() {
        dismiss(animated: true, completion: nil)
    }

}

//MARK: createDayPayRecord Delegate
extension CreateDayPayRecordViewController: CreateDayPayDelegate {
    func didTabCategoryButton() {
        let categoryVC = DayPayRecordCatgoryPickerViewController()
        categoryVC.modalPresentationStyle = .overFullScreen
        present(categoryVC, animated: true)
    }
    
    func didTabPayTypeButton() {
        let payTypeVC = DayPayRecordPayTypePickerViewController()
        payTypeVC.modalPresentationStyle = .overFullScreen
        present(payTypeVC, animated: true)
    }
    
    func didTabCreateButton() {
        // 완성!
        print("didTabCreateButton")
    }
    
    func addPicture() {
        // 앨범에서 사진 가져오기.
        print("addPicture")
    }
    
//    func categoryText() -> String {
//        print("categoryText()")
//        return category
//    }
}
