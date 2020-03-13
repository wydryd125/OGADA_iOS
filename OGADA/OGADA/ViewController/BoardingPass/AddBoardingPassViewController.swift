//
//  AddBoardingPassViewController.swift
//  OGADA
//
//  Created by 정유경 on 2020/03/11.
//  Copyright © 2020 didwndckd. All rights reserved.
//

import UIKit

class AddBoardingPassViewController: BaseViewController {
    
    private var detaildata : [String: String] = [:]
    private var elementTemp: String = ""
    private var blank: Bool = false
    
    
    let addBordingPassButton = UIButton()
    let addLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        requestAPI()
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
 func requestAPI() {
        let baseURL = "http://openapi.airport.kr/openapi/service/?to_time=2400&airport=HKG&flight_id=KE846&airline=KE&lang=K&from_time=0000&ServiceKey=RmV%2BTwtWnYb%2FZIVjKr6GU91KpxWlftortCp7ir2bdMh6pNQje%2F5SlqR2%2BQGirkeyWOhd6ORRoZqcs2gnmFZUug%3D%3D"
        let parser = XMLParser(contentsOf: URL(string: baseURL)!)
        
        parser?.delegate = self
        parser?.parse()
    }
}
// MARK: Extenstion - XML
extension AddBoardingPassViewController: XMLParserDelegate {
    //MARK: API
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        elementTemp = elementName
        blank = true
    }
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        if blank == true && elementTemp != "item" && elementTemp != "items" && elementTemp != "body" && elementTemp != "header" && elementTemp != "response" {
            detaildata[elementTemp] = string
        }
    }
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if elementName == "item" {
        
            dump(detaildata)
//            print(datalist)
        }
        blank = false
    }
}
