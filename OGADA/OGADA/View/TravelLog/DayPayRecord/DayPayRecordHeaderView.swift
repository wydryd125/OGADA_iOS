//
//  DayPayRecordHeaderView.swift
//  OGADA
//
//  Created by YoujinMac on 2020/03/11.
//  Copyright © 2020 didwndckd. All rights reserved.
//

import UIKit

protocol DayPayRecordHeaderDelegate: class {
    func backFunc() -> ()
}

class DayPayRecordHeaderView: UIView {
    
    weak var delegate: DayPayRecordHeaderDelegate?
    
    private let backButton = UIButton()
    private let dayLabel = UILabel()
    private let dateLabel = UILabel()
    
    // MARK: initializer
    init(day: Int, date: String) {
        super.init(frame: .zero)
        
        dayLabel.text = "\(day) 일차"
        dateLabel.text = date
        
        setUI()
        setConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - UI
    
    private func setUI() {
        let dayFontSize: CGFloat = 24
        let dateFontSize: CGFloat = 16
        
        backButton.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        backButton.addTarget(self, action: #selector(didTabBackButton(sender:)), for: .touchUpInside)
//        backButton.imageView?.contentMode = .scaleAspectFill
        backButton.tintColor = .darkGray
        
        
        dayLabel.textColor = .text
        dayLabel.font = .boldSystemFont(ofSize: dayFontSize)
        
        dateLabel.textColor = .gray
        dateLabel.font = .systemFont(ofSize: dateFontSize)
        
        [backButton, dayLabel,dateLabel].forEach {
            addSubview($0)
        }
    }
    
    private func setConstraint() {
        [backButton, dayLabel,dateLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        let margin: CGFloat = 24
        let padding: CGFloat = 8
        
        let backButtonSize: CGFloat = 32
        
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: padding),
            backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: margin),
            backButton.heightAnchor.constraint(equalToConstant: backButtonSize),
            backButton.widthAnchor.constraint(equalToConstant: backButtonSize),
//            backButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: padding),
            
            dayLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: padding),
            dayLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            dateLabel.topAnchor.constraint(equalTo: dayLabel.bottomAnchor, constant: padding / 2),
            dateLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    //MARK: - Action
    @objc private func didTabBackButton(sender: UIButton) {
        print("didTabBackButton")
        
        delegate?.backFunc()
    }
}
