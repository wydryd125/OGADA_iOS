//
//  MovingLineModel.swift
//  OGADA
//
//  Created by 양중창 on 2020/03/12.
//  Copyright © 2020 didwndckd. All rights reserved.
//

import Foundation


struct MovingLineModel: Codable {
    var currentDateLevel: Int
    private var placeList: [[Place]]
    private let dateList: [Date]
    
    // 생성시에 유저디폴츠에 데이터가 있는지 확인하고 없으면 기본값을 만들고 저장
    init(modelKey: String, startDate: Date, endDate: Date) {
        if
            let modelData = UserDefaults.standard.data(forKey: modelKey),
            let model = try? JSONDecoder().decode(MovingLineModel.self, from: modelData) {
            self.currentDateLevel = model.currentDateLevel
            self.placeList = model.placeList
            self.dateList = model.dateList
        } else {
            self.currentDateLevel = 0
            let dateList = DateWorker().getDateLevel(start: startDate, end: endDate)
            self.dateList = dateList
            self.placeList = dateList.map({
                
            })
            saveObject(key: modelKey)
        }
    }
    
    // 자기자신을 유저 디폴츠에 저장
    func saveObject(key: String) {
        guard let saveData = try? JSONEncoder().encode(self) else { return }
        UserDefaults.standard.set(saveData, forKey: key)
    }
    
    func getPlaceList() -> [Place] {
        placeList[currentDateLevel]
    }
    
    func getPlace(index: Int) -> Place{
        placeList[currentDateLevel][index]
    }
    
    func getDateToString() -> String {
        let date = dateList[currentDateLevel]
        let dateToString = DateWorker().changeDateToString(date: date, format: "M / d")
        let result = dateToString + "  \(currentDateLevel + 1) 일차"
        return result
    }
    
}

struct Place: Codable {
    let latitude: Double
    let longitude: Double
    let name: String
    let address: String
    let id: String?
    var isVisit = false
}

