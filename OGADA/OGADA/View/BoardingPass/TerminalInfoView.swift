//
//  TerminalInfoView.swift
//  OGADA
//
//  Created by 정유경 on 2020/03/12.
//  Copyright © 2020 didwndckd. All rights reserved.
//

import UIKit

class TerminalInfoView: UIView {
    
    private let infoView = UIView()
    private let terminalImage = UIImageView()
    let tableView = UITableView()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    //MARK: UI
    func settingImage(terminal: Int) {
        if terminal == 1 {
            terminalImage.image = UIImage(named: "1터미널")
        } else {
            terminalImage.image = UIImage(named: "2터미널")
        }
    }
    
    private func setUI() {
        backgroundColor = .theme
        
        infoView.backgroundColor = .white
        infoView.layer.cornerRadius = 8
        //        backgroundView.layer.shadowOpacity = 0.3
        //        backgroundView.layer.shadowOffset = CGSize(width: 5, height: 0)
        //        backgroundView.layer.shadowRadius = 5
        addSubview(infoView)
        
        terminalImage.contentMode = .scaleAspectFill
        addSubview(terminalImage)
        
        addSubview(tableView)
    }
    private func setConstraints() {
        let padding: CGFloat = 8
        
        [infoView, terminalImage, tableView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        infoView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        infoView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        infoView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.9).isActive = true
        infoView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.9).isActive = true
        
        terminalImage.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        terminalImage.topAnchor.constraint(equalTo: infoView.topAnchor, constant: padding * 4).isActive = true
        terminalImage.heightAnchor.constraint(equalTo: infoView.heightAnchor, multiplier: 0.3).isActive = true
        terminalImage.widthAnchor.constraint(equalTo: infoView.widthAnchor).isActive = true
        
        tableView.topAnchor.constraint(equalTo: terminalImage.bottomAnchor, constant: padding * 4).isActive = true
        tableView.leadingAnchor.constraint(equalTo: terminalImage.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: terminalImage.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: infoView.bottomAnchor, constant: -padding * 2).isActive = true
        
    }
    
}
