//
//  BoardingPassViewController.swift
//  OGADA
//
//  Created by 양중창 on 2020/03/04.
//  Copyright © 2020 didwndckd. All rights reserved.
//

import UIKit

class BoardingPassViewController: BaseViewController {
    
    private let boardingPassView = UIView()
    private let boardingPassImage = UIImageView()
    private let airPlanImage = UIImageView()
    private let departureTimeLabel = UILabel()
    private let arrivalTimeLabel = UILabel()
    private let departureLabel = UILabel()
    private let arrivalLabel = UILabel()
    private let teminal = UILabel()
    private let arrivalAirportLabel = UILabel()
    private let departureDateLabel = UILabel()
    private let gateLabel = UILabel()
    private let barCordImage = UIImageView()
 
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setConstrains()
    }
    //MARK: UI
    func setUI() {
        view.backgroundColor = .background
        
        boardingPassView.backgroundColor = .white
        boardingPassView.layer.shadowOpacity = 0.7
        boardingPassView.layer.shadowOffset = CGSize(width: 5, height: 0)
        boardingPassView.layer.shadowRadius = 5
        boardingPassView.layer.masksToBounds = false
      
        view.addSubview(boardingPassView)
        
        boardingPassImage.image = UIImage(named: "보딩이미지")
        boardingPassImage.contentMode = .scaleAspectFill
        view.addSubview(boardingPassImage)
        
        airPlanImage.image = UIImage(named: "비행기")
        airPlanImage.contentMode = .scaleAspectFill
        view.addSubview(airPlanImage)
        
        departureTimeLabel.text = "09:18"
        departureTimeLabel.textColor = .text
        departureTimeLabel.font = UIFont.systemFont(ofSize: 12)
        departureTimeLabel.textAlignment = .center
        view.addSubview(departureTimeLabel)
        
        arrivalTimeLabel.text = "14:20"
        arrivalTimeLabel.textColor = .text
        arrivalTimeLabel.font = UIFont.systemFont(ofSize: 12)
        arrivalTimeLabel.textAlignment = .center
        view.addSubview(arrivalTimeLabel)
        
        departureLabel.text = "ICN"
        departureLabel.textColor = .text
        departureLabel.font = UIFont.boldSystemFont(ofSize: 48)
        departureLabel.textAlignment = .center
        view.addSubview(departureLabel)
        
        
        arrivalLabel.text = "NYC"
        arrivalLabel.textColor = .text
        arrivalLabel.font = UIFont.boldSystemFont(ofSize: 48)
        arrivalLabel.textAlignment = .center
        view.addSubview(arrivalLabel)
        
        teminal.text = "인천공항 제1터미널"
        teminal.textColor = .text
        teminal.font = UIFont.systemFont(ofSize: 12)
        teminal.textAlignment = .center
        view.addSubview(teminal)
        
        arrivalAirportLabel.text = "John F Kennedy"
        arrivalAirportLabel.textColor = .text
        arrivalAirportLabel.font = UIFont.systemFont(ofSize: 12)
        arrivalAirportLabel.textAlignment = .center
        view.addSubview(arrivalAirportLabel)
        
        barCordImage.image = UIImage(named: "바코드")
        barCordImage.contentMode = .scaleAspectFit
        view.addSubview(barCordImage)
        
    }
    func setConstrains() {
        let guide = view.safeAreaLayoutGuide
        let padding: CGFloat = 8
        
        [boardingPassView,boardingPassImage,airPlanImage,departureTimeLabel,arrivalTimeLabel,departureLabel,arrivalLabel,barCordImage,teminal,arrivalAirportLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        boardingPassView.centerYAnchor.constraint(equalTo: guide.centerYAnchor).isActive = true
        boardingPassView.centerXAnchor.constraint(equalTo: guide.centerXAnchor).isActive = true
        boardingPassView.widthAnchor.constraint(equalTo: guide.widthAnchor, multiplier: 0.9).isActive = true
        boardingPassView.heightAnchor.constraint(equalTo: guide.heightAnchor, multiplier: 0.7).isActive = true
        
        boardingPassImage.topAnchor.constraint(equalTo: boardingPassView.topAnchor).isActive = true
        boardingPassImage.leadingAnchor.constraint(equalTo: boardingPassView.leadingAnchor).isActive = true
        boardingPassImage.trailingAnchor.constraint(equalTo: boardingPassView.trailingAnchor).isActive = true
        boardingPassImage.heightAnchor.constraint(equalTo: boardingPassView.heightAnchor, multiplier: 0.3).isActive = true
        
        airPlanImage.topAnchor.constraint(equalTo: boardingPassImage.bottomAnchor, constant: padding * 3).isActive = true
        airPlanImage.leadingAnchor.constraint(equalTo: boardingPassImage.leadingAnchor, constant: padding * 2).isActive = true
        airPlanImage.trailingAnchor.constraint(equalTo: boardingPassImage.trailingAnchor, constant: -padding * 3).isActive = true
        airPlanImage.heightAnchor.constraint(equalTo: boardingPassImage.heightAnchor, multiplier: 0.2).isActive = true
        
        departureTimeLabel.topAnchor.constraint(equalTo: airPlanImage.bottomAnchor).isActive = true
        departureTimeLabel.leadingAnchor.constraint(equalTo: airPlanImage.leadingAnchor, constant:  padding).isActive = true
        
        arrivalTimeLabel.topAnchor.constraint(equalTo: airPlanImage.bottomAnchor).isActive = true
        arrivalTimeLabel.trailingAnchor.constraint(equalTo: airPlanImage.trailingAnchor).isActive = true
        
        departureLabel.topAnchor.constraint(equalTo: departureTimeLabel.bottomAnchor, constant: padding * 2).isActive = true
        departureLabel.leadingAnchor.constraint(equalTo: departureTimeLabel.leadingAnchor).isActive = true
        
        arrivalLabel.topAnchor.constraint(equalTo: arrivalTimeLabel.bottomAnchor, constant: padding * 2).isActive = true
        arrivalLabel.trailingAnchor.constraint(equalTo: arrivalTimeLabel.trailingAnchor).isActive = true
        
        teminal.topAnchor.constraint(equalTo: departureLabel.bottomAnchor).isActive = true
        teminal.centerXAnchor.constraint(equalTo: departureLabel.centerXAnchor).isActive = true
        
        arrivalAirportLabel.topAnchor.constraint(equalTo: arrivalLabel.bottomAnchor).isActive = true
        arrivalAirportLabel.centerXAnchor.constraint(equalTo: arrivalLabel.centerXAnchor).isActive = true
        
        barCordImage.bottomAnchor.constraint(equalTo: boardingPassView.bottomAnchor, constant: -padding * 2 ).isActive = true
        barCordImage.centerXAnchor.constraint(equalTo: boardingPassView.centerXAnchor).isActive = true
        barCordImage.widthAnchor.constraint(equalTo: boardingPassView.widthAnchor, multiplier: 0.8).isActive = true
        barCordImage.heightAnchor.constraint(equalTo: boardingPassView.heightAnchor, multiplier: 0.1).isActive = true
        
        
        
        
    }
   
}
