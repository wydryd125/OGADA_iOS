//
//  ViewController.swift
//  OGADA
//
//  Created by 양중창 on 2020/03/04.
//  Copyright © 2020 didwndckd. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .background
        navigationController?.navigationBar.barTintColor = .theme
        
        let postIt = UIView()
        postIt.backgroundColor = .text
        view.addSubview(postIt)
        
        postIt.frame = CGRect(x: 100, y: 100, width: 150, height: 150)
        
        
        
    }
    
    
    // 테스트 초기 셋팅이니 호출 지워도됨
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        test()
        print("touchBegan")
    }
    
    
    
    private func test() {
        
        
        navigationController?.navigationBar.isHidden = true
//        navigationController?.navigationBar.shadowImage = UIImage()
//        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
//        navigationController?.navigationBar.tintColor = .black
//        title = ""
//        navigationController?.navigationBar.ba
        
        let boardingPassVC = BoardingPassViewController()
        boardingPassVC.tabBarItem = UITabBarItem(title: "보딩패스", image: nil, selectedImage: nil)
        let movingLineVC = MovingLineViewController()
        movingLineVC.tabBarItem = UITabBarItem(title: "동선", image: nil, selectedImage: nil)
        let travelLogVC = TravelLogViewController()
        travelLogVC.tabBarItem = UITabBarItem(title: "가계부", image: nil, selectedImage: nil)
        let otherVC = OtherViewController()
        otherVC.tabBarItem = UITabBarItem(title: "더보기", image: nil, selectedImage: nil)
        
        let tabBarController = UITabBarController()
        
        tabBarController.viewControllers = [
        boardingPassVC,
        movingLineVC,
        travelLogVC,
        otherVC
        ]
        
        navigationController?.pushViewController(tabBarController, animated: true)
        
        
    }
    // 테스트


}

