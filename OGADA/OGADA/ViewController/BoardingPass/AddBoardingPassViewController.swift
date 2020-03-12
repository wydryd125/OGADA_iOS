//
//  AddBoardingPassViewController.swift
//  OGADA
//
//  Created by 정유경 on 2020/03/11.
//  Copyright © 2020 didwndckd. All rights reserved.
//

import UIKit

class AddBoardingPassViewController: BaseViewController {
    
    
    
    let addBordingPassButton = UIButton()
    let addLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setConstraints()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    
    }
    
    //MARK: UI
    func setUI() {
        view.backgroundColor = .background
        
        addLabel.text = "비행 정보를 입력해주세요"
        addLabel.textColor = .text
        addLabel.font = UIFont.boldSystemFont(ofSize: 32)
        addLabel.textAlignment = .center
        view.addSubview(addLabel)
        
        addBordingPassButton.setImage(UIImage(named: "add"), for: .normal)
        addBordingPassButton.contentMode = .scaleAspectFill
        addBordingPassButton.addTarget(self, action: #selector(addButtonDidTap), for: .touchUpInside)
        view.addSubview(addBordingPassButton)
        
        
    }
    func setConstraints() {
        let guide = view.safeAreaLayoutGuide
        let padding:CGFloat = 8
        
        [addLabel,addBordingPassButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        addLabel.topAnchor.constraint(equalTo: guide.topAnchor, constant: padding * 8) .isActive = true
        addLabel.centerXAnchor.constraint(equalTo: guide.centerXAnchor).isActive = true
        
        addBordingPassButton.centerYAnchor.constraint(equalTo: guide.centerYAnchor).isActive = true
        addBordingPassButton.centerXAnchor.constraint(equalTo: guide.centerXAnchor).isActive = true
        addBordingPassButton.heightAnchor.constraint(equalTo: guide.heightAnchor, multiplier: 0.7).isActive = true
    }
    
    //MARK: Action
    @objc func addButtonDidTap() {
//        let inputVC = InputInfoViewController()
//        navigationController?.pushViewController(inputVC, animated: true)
        
    }
    
}

