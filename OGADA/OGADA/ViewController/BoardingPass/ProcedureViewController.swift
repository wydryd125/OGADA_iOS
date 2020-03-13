//
//  ProcedureViewController.swift
//  OGADA
//
//  Created by 정유경 on 2020/03/09.
//  Copyright © 2020 didwndckd. All rights reserved.
//

import UIKit

class ProcedureViewController: BaseViewController {
    
    private var detailData : [String: String] = [:]
    private var elementTemp: String = ""
    private var blank: Bool = false
    
    private let terminal1Keys = ["gate1", "gate2", "gate3", "gate4", "gate5", "gate6"]
    private let terminal2Keys = ["gate1", "gate2"]
    
    
    private let passportImage = UIImageView()
    private let terminalView = TerminalInfoView()
    var terno = 1
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        requestAPI()
        setUI()
        setConstraints()
        
    }
    
    //MARK: UI
    private func setUI() {
        terminalView.settingImage(terminal: terno)
        terminalView.layer.cornerRadius = 16
        terminalView.layer.shadowOpacity = 0.3
        terminalView.layer.shadowOffset = CGSize(width: 5, height: 0)
        terminalView.layer.shadowRadius = 5
        terminalView.tableView.dataSource = self
        terminalView.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        view.backgroundColor = .background
        view.addSubview(terminalView)
        
        passportImage.image = UIImage(named: "여권")
        passportImage.contentMode = .scaleAspectFill
        view.addSubview(passportImage)
        
    }
    private func setConstraints() {
        let guide = view.safeAreaLayoutGuide
        let padding: CGFloat = 8
        
        [terminalView,passportImage].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        terminalView.centerXAnchor.constraint(equalTo: guide.centerXAnchor).isActive = true
        terminalView.centerYAnchor.constraint(equalTo: guide.centerYAnchor, constant: padding * 4).isActive = true
        terminalView.widthAnchor.constraint(equalTo: guide.widthAnchor, multiplier: 0.9).isActive = true
        terminalView.heightAnchor.constraint(equalTo: guide.heightAnchor, multiplier: 0.6).isActive = true
        
        
        passportImage.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
        passportImage.bottomAnchor.constraint(equalTo: terminalView.topAnchor, constant: padding * 4 ).isActive = true
        passportImage.widthAnchor.constraint(equalTo: guide.widthAnchor, multiplier: 0.7).isActive =  true
        passportImage.heightAnchor.constraint(equalTo: guide.heightAnchor, multiplier: 0.2).isActive = true
        
    }
    //MARK: API호출
    func requestAPI() {
        let baseURL = "http://openapi.airport.kr/openapi/service/StatusOfDepartures/getDeparturesCongestion?ServiceKey=RmV%2BTwtWnYb%2FZIVjKr6GU91KpxWlftortCp7ir2bdMh6pNQje%2F5SlqR2%2BQGirkeyWOhd6ORRoZqcs2gnmFZUug%3D%3D&terno=\(terno)"
        let parser = XMLParser(contentsOf: URL(string: baseURL)!)
        
        parser?.delegate = self
        parser?.parse()
    }
}
// MARK: Extenstion - XML
extension ProcedureViewController: XMLParserDelegate {
    //MARK: API
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        elementTemp = elementName
        blank = true
    }
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        if blank == true && elementTemp != "item" && elementTemp != "items" && elementTemp != "body" && elementTemp != "header" && elementTemp != "response" {
            detailData[elementTemp] = string
        }
    }
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if elementName == "item" {
//            datalist += [detaildata]
//            dump(detaildata)
//            print(datalist)
        }
        blank = false
    }
}
extension ProcedureViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if terno == 1 {
            return terminal1Keys.count
        } else {
            return terminal2Keys.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        if terno == 1 {
            let key = terminal1Keys[indexPath.row]
            
            if let data = detailData[key] {
                if let result = Int(data) {
                    cell.textLabel?.text = "\(key) - 현재 대기중인 인원은 \(result) 명 입니다."
                } else {
                    cell.textLabel?.text = "\(key) - 현재 \(data) 입니다."
                }
            }
            
        } else {
            let key = terminal2Keys[indexPath.row]
            
            if let data = detailData[key] {
                if let result = Int(data) {
                    cell.textLabel?.text = "\(key) - 현재 대기중인 인원은 \(result) 명 입니다."
                } else {
                    cell.textLabel?.text = "\(key) - 현재 \(data) 입니다."
                }
            }
        }
        cell.textLabel?.textAlignment = .left
        cell.textLabel?.textColor = .text
        cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        return cell
    }
    
    
}
