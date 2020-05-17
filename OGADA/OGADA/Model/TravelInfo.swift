//
//  TravelKey.swift
//  OGADA
//
//  Created by 정유경 on 2020/03/11.
//  Copyright © 2020 didwndckd. All rights reserved.
//

import Foundation

struct TravelInfo: Codable {
   
    let nation: String
    let departureDate: Date
    let arrivalDate: Date
    let subTitle: String
    let foreign: Foreign
    let totalBudget: Int
}
//
//func travelInformation(nation:String, departureDate:Date, arrivalDate:Date, subTitle:String, foreign:String, totalBudget:Int) {
//    let object = TravelInfo(nation: nation, departureDate: departureDate, arrivalDate: arrivalDate, subTitle: subTitle, foreign: foreign, totalBudget: totalBudget)
//
//    guard let result = try? JSONEncoder().encode(object) else { return }
//    UserDefaults.standard.set(result, forKey: "key")
//
//    guard let ud = UserDefaults.standard.data(forKey: "key") else { return }
//    guard let decodeResult = try? JSONDecoder().decode(TravelInfo.self, from: ud) else { return }
//
//    let date = Date()
//    let formatter = DateFormatter()
//    formatter.dateFormat = "yyyyMMddHHmmss"
//    let dateKey = formatter.string(from: date)
//    let foreign = Foreign.china.rawValue
//
//    let finalKey = dateKey + foreign
//    print(finalKey)
//
//    guard var keys = UserDefaults.standard.object(forKey: "Key") as? [String] else { return }
//    keys.append(finalKey)
//    UserDefaults.standard.set(keys, forKey: "Key")
//
//}
