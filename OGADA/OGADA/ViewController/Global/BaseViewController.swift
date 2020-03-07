//
//  BaseViewController.swift
//  OGADA
//
//  Created by 양중창 on 2020/03/05.
//  Copyright © 2020 didwndckd. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    let backButton = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setConstraint()
    }
    
    private func setUI() {
        
        navigationController?.navigationBar.isHidden = true
        
        backButton.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        backButton.addTarget(self, action: #selector(popAction), for: .touchUpInside)
        backButton.tintColor = .black
        
        view.addSubview(backButton)
    }
    
    private func setConstraint() {
        let guide = view.safeAreaLayoutGuide
        let margin: CGFloat = 8
        
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: margin * 2).isActive = true
        backButton.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
    }
    
    @objc func popAction() {
        navigationController?.popViewController(animated: true)
    }
    
}
