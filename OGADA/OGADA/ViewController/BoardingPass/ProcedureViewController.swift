//
//  ProcedureViewController.swift
//  OGADA
//
//  Created by 정유경 on 2020/03/09.
//  Copyright © 2020 didwndckd. All rights reserved.
//

import UIKit

class ProcedureViewController: BaseViewController {
    
    private let passportImage = UIImageView()
    private let backgroundView = UIView()
    private let terminalImage = UIImageView()
    

    override func viewDidLoad() {
        super.viewDidLoad()
       
        setUI()
        setConstraints()

    }
    //MARK: UI
    private func setUI() {
        
        view.backgroundColor = .theme
    
        backgroundView.backgroundColor = .white
        backgroundView.layer.cornerRadius = 16
        backgroundView.layer.shadowOpacity = 0.3
        backgroundView.layer.shadowOffset = CGSize(width: 5, height: 0)
        backgroundView.layer.shadowRadius = 5
        view.addSubview(backgroundView)
        
        terminalImage.image = UIImage(named: "1터미널")
        terminalImage.contentMode = .scaleAspectFit
        view.addSubview(terminalImage)
        
        passportImage.image = UIImage(named: "여권")
        passportImage.contentMode = .scaleAspectFill
        view.addSubview(passportImage)
        
    }
    private func setConstraints() {
        let guide = view.safeAreaLayoutGuide
        let padding: CGFloat = 8
        
        [backgroundView,terminalImage,passportImage].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }

        backgroundView.centerXAnchor.constraint(equalTo: guide.centerXAnchor).isActive = true
        backgroundView.centerYAnchor.constraint(equalTo: guide.centerYAnchor, constant: padding * 4).isActive = true
        backgroundView.widthAnchor.constraint(equalTo: guide.widthAnchor, multiplier: 0.9).isActive = true
        backgroundView.heightAnchor.constraint(equalTo: guide.heightAnchor, multiplier: 0.6).isActive = true
        
        terminalImage.centerXAnchor.constraint(equalTo: guide.centerXAnchor).isActive = true
        terminalImage.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: padding * 4).isActive = true
        terminalImage.heightAnchor.constraint(equalTo: backgroundView.heightAnchor, multiplier: 0.3).isActive = true
        terminalImage.widthAnchor.constraint(equalTo: backgroundView.widthAnchor).isActive = true
        
        passportImage.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
        passportImage.bottomAnchor.constraint(equalTo: backgroundView.topAnchor, constant: padding * 4 ).isActive = true
        passportImage.widthAnchor.constraint(equalTo: guide.widthAnchor, multiplier: 0.7).isActive =  true
        passportImage.heightAnchor.constraint(equalTo: guide.heightAnchor, multiplier: 0.2).isActive = true
        
        
    }
    //MARK: Action


}
