//
//  AddBoardingPassView.swift
//  OGADA
//
//  Created by 정유경 on 2020/03/11.
//  Copyright © 2020 didwndckd. All rights reserved.
//

import UIKit

class AddBoardingPassView: UIView {
    
    let addBordingPassButton = UIButton()
    let addLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: UI
    func setUI() {
        backgroundColor = .background
        
        addBordingPassButton.setImage(UIImage(named: "add"), for: .normal)
        addBordingPassButton.contentMode = .scaleAspectFill
        addBordingPassButton.addTarget(self, action: #selector(didTapAddBoardingPassButton), for: .touchUpInside)
        addSubview(addBordingPassButton)
        
        
    }
    func setConstraints() {
        
    }
    
    @objc func didTapAddBoardingPassButton() {
        
    }
    
}
