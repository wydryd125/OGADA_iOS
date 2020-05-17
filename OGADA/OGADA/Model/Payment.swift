//
//  PaymentCategory.swift
//  OGADA
//
//  Created by YoujinMac on 2020/03/12.
//  Copyright © 2020 didwndckd. All rights reserved.
//

import Foundation

enum PaymentCategory: String {
    case hotel = "숙소"
    case meal = "밥"
    case cafe = "카페"
    case alchol = "술"
    case gift = "선물"
    case admission = "입장료"
    case traffic = "교통비"
    case other = "기타"
    
    func allCase() -> [String] {
        return ["숙소", "밥", "카페", "술", "선물", "입장료", "교통비", "기타" ]
    }
}

enum PayType: String {
    case card = "card"
    case cash = "cash"
    
    func allCase() -> [String] {
        return ["card", "cash"]
    }
}
