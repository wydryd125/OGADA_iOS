//
//  Foreign.swift
//  OGADA
//
//  Created by 정유경 on 2020/03/11.
//  Copyright © 2020 didwndckd. All rights reserved.
//

import Foundation


enum Foreign: String, Codable {
    case australia = "AUD"
    case brazil = "BRL"
    case canada = "CAD"
    case swizerland = "CHF"
    case china = "CNY"
    case europe = "EUR"
    case england = "GBP"
    case hongkong = "HKD"
    case india = "INR"
    case japan = "JPY"
    case korea = "KRW"
    case maxico = "MXN"
    case russia = "RUB"
    case thailand = "THB"
    case taiwan = "TWD"
    case USA = "USD"
    case vietnam = "VND"
    
    func translation() -> String{
        switch self {
        case .australia:
            return "호주"
        case .brazil:
            return "브라질"
        case .canada:
            return "캐나다"
        case .swizerland:
            return "스위스"
        case .china:
            return "중국"
        case .europe:
            return "유럽"
        case .england:
            return "영국"
        case .hongkong:
            return "홍콩"
        case .india:
            return "인도"
        case .japan:
            return "일본"
        case .korea:
            return "한국"
        case .maxico:
            return "멕시코"
        case .russia:
            return "러시아"
        case .thailand:
            return "태국"
        case .taiwan:
            return "대만"
        case .USA:
            return "미국"
        case .vietnam:
            return "베트남"
        }
        
        
    }
    
    static func getForegin(foregin: String) -> Foreign? {
        
        switch foregin {
        case "호주":
            return .australia
        case "브라질":
            return .brazil
        case "캐나다":
            return .canada
        case "스위스":
            return .swizerland
        case "중국":
            return .china
        case "유럽":
            return .europe
        case "영국":
            return .england
        case "홍콩":
            return .hongkong
        case "인도":
            return .india
        case "일본":
            return .japan
        case "한국":
            return .korea
        case "멕시코":
            return .maxico
        case "러시아":
            return .russia
        case "태국":
            return .thailand
        case "대만":
            return .taiwan
        case "미국":
            return .USA
        case "베트남":
            return .vietnam
        default:
            return nil
    }
    
}

}






