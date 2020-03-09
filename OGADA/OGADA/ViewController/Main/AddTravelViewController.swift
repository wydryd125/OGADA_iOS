//
//  AddTravelViewController.swift
//  temp
//
//  Created by 정유경 on 2020/03/07.
//  Copyright © 2020 정유경. All rights reserved.
//

import UIKit

class AddTravelViewController: BaseViewController {
    
    private let planeImage = UIImageView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setConstrains()
    
    }
    //MARK: UI
    func setUI() {
         view.backgroundColor = .background
        
        planeImage.image = UIImage(named: "비행기배경")
        planeImage.contentMode = .scaleAspectFit
        view.addSubview(planeImage)
    }
    func setConstrains() {
        let guide = view.safeAreaLayoutGuide
        let padding: CGFloat = 8
        
        [planeImage].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        planeImage.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: -padding * 4).isActive = true
        planeImage.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
        planeImage.widthAnchor.constraint(equalTo: guide.widthAnchor, multiplier: 0.7).isActive = true
        planeImage.heightAnchor.constraint(equalTo: guide.heightAnchor, multiplier: 0.3).isActive = true
        
    }
    
}
