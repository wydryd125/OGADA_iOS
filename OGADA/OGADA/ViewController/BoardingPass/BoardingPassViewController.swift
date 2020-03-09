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
    private let teminalLabel = UILabel()
    private let arrivalAirportLabel = UILabel()
    private let departureDateLabel = UILabel()
    private let departureDateOutPutLabel = UILabel()
    private let checkInCountLabel = UILabel()
    private let checkIncountOutPutLabel = UILabel()
    private let procedureLabel = UILabel()
    private let procedureButton = UIButton()
    private let clickLabel = UILabel()
    private let gateLabel = UILabel()
    private let gateOutPutLabel = UILabel()
    private let leadTimeLabel = UILabel()
    private let leadTimeOutPutLabel = UILabel()
    private let barCordImage = UIImageView()
 
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setConstrains()
    }
    
    override func viewDidAppear(_ animated: Bool) {
      super.viewDidAppear(animated)
      clickAni()
      
    }
    //MARK: UI
    func setUI() {
        let nationTextSize: CGFloat = 48
        let subTextSize: CGFloat = 12
        let textSize: CGFloat = 16
        
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
        departureTimeLabel.textColor = .subText
        departureTimeLabel.font = UIFont.systemFont(ofSize: subTextSize)
        departureTimeLabel.textAlignment = .center
        view.addSubview(departureTimeLabel)
        
        arrivalTimeLabel.text = "14:20"
        arrivalTimeLabel.textColor = .subText
        arrivalTimeLabel.font = UIFont.systemFont(ofSize: subTextSize)
        arrivalTimeLabel.textAlignment = .center
        view.addSubview(arrivalTimeLabel)
        
        departureLabel.text = "ICN"
        departureLabel.textColor = .text
        departureLabel.font = UIFont.boldSystemFont(ofSize: nationTextSize)
        departureLabel.textAlignment = .center
        view.addSubview(departureLabel)
        
        
        arrivalLabel.text = "NYC"
        arrivalLabel.textColor = .text
        arrivalLabel.font = UIFont.boldSystemFont(ofSize: nationTextSize)
        arrivalLabel.textAlignment = .center
        view.addSubview(arrivalLabel)
        
        teminalLabel.text = "인천공항 제1터미널"
        teminalLabel.textColor = .subText
        teminalLabel.font = UIFont.systemFont(ofSize: subTextSize)
        teminalLabel.textAlignment = .center
        view.addSubview(teminalLabel)
        
        arrivalAirportLabel.text = "John F Kennedy"
        arrivalAirportLabel.textColor = .subText
        arrivalAirportLabel.font = UIFont.systemFont(ofSize: subTextSize)
        arrivalAirportLabel.textAlignment = .center
        view.addSubview(arrivalAirportLabel)
        
        departureDateLabel.text = "출발일 및 시간"
        departureDateLabel.textColor = .subText
        departureDateLabel.font = UIFont.systemFont(ofSize: subTextSize)
        departureDateLabel.textAlignment = .left
        view.addSubview(departureDateLabel)
        
        departureDateOutPutLabel.text = "2020.03.01" + " / " + "09:18"
        departureDateOutPutLabel.textColor = .text
        departureDateOutPutLabel.font = UIFont.boldSystemFont(ofSize: textSize)
        departureDateOutPutLabel.textAlignment = .left
        view.addSubview(departureDateOutPutLabel)
        
        checkInCountLabel.text = "체크인카운터"
        checkInCountLabel.textColor = .subText
        checkInCountLabel.font = UIFont.systemFont(ofSize: subTextSize)
        checkInCountLabel.textAlignment = .left
        view.addSubview(checkInCountLabel)
        
        checkIncountOutPutLabel.text = "88"
        checkIncountOutPutLabel.textColor = .text
        checkIncountOutPutLabel.font = UIFont.boldSystemFont(ofSize: textSize)
        checkIncountOutPutLabel.textAlignment = .left
        view.addSubview(checkIncountOutPutLabel)
        
        procedureLabel.text = "출국장 혼잡도 보기"
        procedureLabel.textColor = .subText
        procedureLabel.font = UIFont.systemFont(ofSize: subTextSize)
        procedureLabel.textAlignment = .left
        view.addSubview(procedureLabel)
        
        procedureButton.setTitle("보기", for: .normal)
        procedureButton.setTitleColor(.text, for: .normal)
        procedureButton.backgroundColor = .clear
        procedureButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: textSize)
        procedureButton.titleLabel?.textAlignment = .left
        procedureButton.addTarget(self, action: #selector(procedureButtonDidTap) , for: .touchUpInside)
        view.addSubview(procedureButton)
        
        gateLabel.text = "탑승구"
        gateLabel.textColor = .subText
        gateLabel.font = UIFont.systemFont(ofSize: subTextSize)
        gateLabel.textAlignment = .left
        view.addSubview(gateLabel)
        
        gateOutPutLabel.text = "5"
        gateOutPutLabel.textColor = .text
        gateOutPutLabel.font = UIFont.boldSystemFont(ofSize: textSize)
        gateOutPutLabel.textAlignment = .left
        view.addSubview(gateOutPutLabel)
        
        leadTimeLabel.text = "소요시간"
        leadTimeLabel.textColor = .subText
        leadTimeLabel.font = UIFont.systemFont(ofSize: subTextSize)
        leadTimeLabel.textAlignment = .left
        view.addSubview(leadTimeLabel)
        
        
        leadTimeOutPutLabel.text = "8시간 13분"
        leadTimeOutPutLabel.textColor = .text
        leadTimeOutPutLabel.font = UIFont.boldSystemFont(ofSize: textSize)
        leadTimeOutPutLabel.textAlignment = .left
        view.addSubview(leadTimeOutPutLabel)
        
        barCordImage.image = UIImage(named: "바코드")
        barCordImage.contentMode = .scaleAspectFit
        view.addSubview(barCordImage)
         
        clickLabel.text = "   ↑\nclick!!"
        clickLabel.numberOfLines = 0
        clickLabel.textColor = .text
        clickLabel.font = UIFont.systemFont(ofSize: subTextSize)
        clickLabel.textAlignment = .left
        view.addSubview(clickLabel)
        
    }
    func setConstrains() {
        let guide = view.safeAreaLayoutGuide
        let padding: CGFloat = 8
        
        [boardingPassView,boardingPassImage,airPlanImage,departureTimeLabel,arrivalTimeLabel,departureLabel,arrivalLabel,teminalLabel,arrivalAirportLabel,departureDateLabel,departureDateOutPutLabel,checkInCountLabel,checkIncountOutPutLabel,procedureLabel,procedureButton,gateLabel,gateOutPutLabel,leadTimeLabel,leadTimeOutPutLabel,barCordImage,clickLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        boardingPassView.centerYAnchor.constraint(equalTo: guide.centerYAnchor).isActive = true
        boardingPassView.centerXAnchor.constraint(equalTo: guide.centerXAnchor).isActive = true
        boardingPassView.widthAnchor.constraint(equalTo: guide.widthAnchor, multiplier: 0.9).isActive = true
        boardingPassView.heightAnchor.constraint(equalTo: guide.heightAnchor, multiplier: 0.8).isActive = true
        
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
        
        teminalLabel.topAnchor.constraint(equalTo: departureLabel.bottomAnchor).isActive = true
        teminalLabel.centerXAnchor.constraint(equalTo: departureLabel.centerXAnchor).isActive = true
        
        arrivalAirportLabel.topAnchor.constraint(equalTo: arrivalLabel.bottomAnchor).isActive = true
        arrivalAirportLabel.centerXAnchor.constraint(equalTo: arrivalLabel.centerXAnchor).isActive = true
        
        departureDateLabel.topAnchor.constraint(equalTo: teminalLabel.bottomAnchor, constant: padding * 3).isActive = true
        departureDateLabel.leadingAnchor.constraint(equalTo: barCordImage.leadingAnchor).isActive = true
        
        departureDateOutPutLabel.topAnchor.constraint(equalTo: departureDateLabel.bottomAnchor, constant: padding).isActive = true
        departureDateOutPutLabel.leadingAnchor.constraint(equalTo: departureDateLabel.leadingAnchor).isActive = true
        
        checkInCountLabel.topAnchor.constraint(equalTo: teminalLabel.bottomAnchor, constant: padding * 3).isActive = true
        checkInCountLabel.leadingAnchor.constraint(equalTo: boardingPassView.centerXAnchor, constant: padding * 4).isActive = true
        
        checkIncountOutPutLabel.topAnchor.constraint(equalTo: checkInCountLabel.bottomAnchor, constant: padding).isActive = true
        checkIncountOutPutLabel.leadingAnchor.constraint(equalTo: checkInCountLabel.leadingAnchor).isActive = true
        
        procedureLabel.topAnchor.constraint(equalTo: departureDateOutPutLabel.bottomAnchor, constant: padding * 3).isActive = true
        procedureLabel.leadingAnchor.constraint(equalTo: departureDateLabel.leadingAnchor).isActive = true
        
        procedureButton.topAnchor.constraint(equalTo: procedureLabel.bottomAnchor).isActive = true
        procedureButton.leadingAnchor.constraint(equalTo: procedureLabel.leadingAnchor).isActive = true
        
        gateLabel.topAnchor.constraint(equalTo: procedureLabel.topAnchor).isActive = true
        gateLabel.leadingAnchor.constraint(equalTo: boardingPassView.centerXAnchor, constant: -padding * 2).isActive = true
        
        gateOutPutLabel.topAnchor.constraint(equalTo: gateLabel.bottomAnchor, constant: padding).isActive = true
        gateOutPutLabel.leadingAnchor.constraint(equalTo: gateLabel.leadingAnchor).isActive = true
        
        leadTimeLabel.topAnchor.constraint(equalTo: procedureLabel.topAnchor).isActive = true
        leadTimeLabel.leadingAnchor.constraint(equalTo: leadTimeOutPutLabel.leadingAnchor).isActive = true
        
        leadTimeOutPutLabel.topAnchor.constraint(equalTo: leadTimeLabel.bottomAnchor, constant: padding).isActive = true
        leadTimeOutPutLabel.trailingAnchor.constraint(equalTo: barCordImage.trailingAnchor).isActive = true
        
        
        barCordImage.bottomAnchor.constraint(equalTo: boardingPassView.bottomAnchor, constant: -padding * 2 ).isActive = true
        barCordImage.centerXAnchor.constraint(equalTo: boardingPassView.centerXAnchor).isActive = true
        barCordImage.widthAnchor.constraint(equalTo: boardingPassView.widthAnchor, multiplier: 0.8).isActive = true
        barCordImage.heightAnchor.constraint(equalTo: boardingPassView.heightAnchor, multiplier: 0.1).isActive = true

        clickLabel.topAnchor.constraint(equalTo: procedureButton.bottomAnchor).isActive = true
        clickLabel.leadingAnchor.constraint(equalTo: procedureButton.leadingAnchor).isActive = true
        
    }
    //MARK: Action
    @objc func procedureButtonDidTap() {
        print("보기버튼눌러")
        let procedureVC = ProcedureViewController()
        navigationController?.pushViewController(procedureVC, animated: true)

        
    }
    func clickAni() {
        let divide: Double = 6
        let duration: Double = Double(1) / divide
        UIView.animateKeyframes(
            withDuration: 3,
            delay: 0,
            options: [.calculationModeLinear, .repeat],
            animations: {
                for index in 0..<Int(divide) {
                    UIView.addKeyframe(withRelativeStartTime: duration * Double(index),
                                       relativeDuration: duration) {
                                        if index.isMultiple(of: 2) { self.clickLabel.center.y += 16 }
                                        else { self.clickLabel.center.y -= 16 }
                    }
                }
        }
        )}
    
}
