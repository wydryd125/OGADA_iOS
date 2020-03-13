//
//  OtherViewController.swift
//  OGADA
//
//  Created by 양중창 on 2020/03/04.
//  Copyright © 2020 didwndckd. All rights reserved.
//

import UIKit

class OtherViewController: UIViewController {
    
    private let deleteLabel = UILabel()
    private let deleteButton = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setConstraints()
        
        
    }
    //MARK: UI
    func setUI() {
        view.backgroundColor = .background
        deleteLabel.text = "이 여행을 삭제하시겠습니까?"
        deleteLabel.textAlignment = .center
        deleteLabel.textColor = .text
        deleteLabel.font = UIFont.boldSystemFont(ofSize: 32)
        view.addSubview(deleteLabel)
        
        deleteButton.setImage(UIImage(named: "delete"), for: .normal)
        deleteButton.contentMode = .scaleAspectFill
        deleteButton.addTarget(self, action: #selector(deleteButtonDidTap), for: .touchUpInside)
        deleteButton.backgroundColor = .clear
        view.addSubview(deleteButton)
        
    }
    func setConstraints() {
        let guide = view.safeAreaLayoutGuide
        let padding: CGFloat = 8
        
        [deleteLabel,deleteButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        deleteLabel.bottomAnchor.constraint(equalTo: deleteButton.topAnchor, constant: -padding * 8).isActive = true
        deleteLabel.centerXAnchor.constraint(equalTo: guide.centerXAnchor).isActive = true
        deleteLabel.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        
        deleteButton.centerXAnchor.constraint(equalTo: guide.centerXAnchor).isActive = true
        deleteButton.centerYAnchor.constraint(equalTo: guide.centerYAnchor).isActive = true
        deleteButton.widthAnchor.constraint(equalTo: guide.widthAnchor, multiplier: 0.5).isActive = true
        deleteButton.heightAnchor.constraint(lessThanOrEqualTo: guide.heightAnchor, multiplier: 0.3).isActive = true
        
    }
    
    @objc func deleteButtonDidTap() {
        guard let key = SelectedTravel.key else { return }
        UserDefaults.standard.removeObject(forKey: key)
        navigationController?.popViewController(animated: true)
        
    }
}

