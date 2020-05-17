//
//  DateWorker.swift
//  OGADA
//
//  Created by 양중창 on 2020/03/12.
//  Copyright © 2020 didwndckd. All rights reserved.
//

import Foundation

struct DateWorker {
    private let oneDay: Double = (60 * 60 * 24)
    
    func getDateLevel(start: Date, end: Date) -> [Date] {
        
        var temp: [Date] = []
        
        let length = end.timeIntervalSince(start) / oneDay
        
        for i in 0...Int(length + 1) {
            let addingInterval = Double(i) * oneDay
            let currentDate = start.addingTimeInterval(addingInterval)
            temp.append(currentDate)
        }
        
        return temp
        
    }
    
    // 시간 00:00:00 으로 바꿔주는 메서드
    func setMidnight(date: Date) -> Date {
        let interval = date.timeIntervalSince1970
        let moduler = interval.truncatingRemainder(dividingBy: oneDay)
        let result = date.addingTimeInterval(-moduler)
        return result
    }
    
    // 데이트 -> 문자열
    func changeDateToString(date: Date, format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        formatter.timeZone = .current
        let result = formatter.string(from: date)
        return result
    }
    
    // 문자열 -> 데이트
    func changeStringToDate(stringDate: String, format: String) -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        formatter.timeZone = NSTimeZone(name: "UTC") as TimeZone?
        let date = formatter.date(from: stringDate)
        return date
    }
    
}
