//
//  exchangeAPI.swift
//  OGADA
//
//  Created by YoujinMac on 2020/03/07.
//  Copyright © 2020 didwndckd. All rights reserved.
//

import Foundation

/*
 https://earthquake.kr:23490/
 
 https://earthquake.kr:23490/query/통화쌍
 */

final class ExchangeAPI {
    
    private let exchangeSite = "https://earthquake.kr:23490/"
    //    private lazy var apiURL = URL(string: self.exchangeSite)!
    
    private let foreign: String
    private let korea = "KRW"
    private var price: Double = 0
    
    
    
    init(exchangeType foreign: String) {
        self.foreign = foreign
        
//        request { (result) in
//            self.price = result
//        }
    }
    
  
    func exchangeForeign() -> Double {
        return price
    }
    

    init() {
        self.foreign = ""
    }
    
    
    func tempRequest(tempForeign: String, completion: @escaping (Double) -> Void) {
        
        
        let requestKey = tempForeign + korea
        
//        print("requestKey = \(requestKey)")
//        print("url = \(URL(string: self.exchangeSite)!)")
//        print(self.exchangeSite + "query/\(requestKey)")
//        print(URL(string: self.exchangeSite + "query/\(requestKey)")!)
        
        let apiURL = URL(string: self.exchangeSite + "query/\(requestKey)")!
        
        
        let dataTask = URLSession.shared.dataTask(with: apiURL) { (data, response, error) in
            guard error == nil else { return print(error!) }
            
            guard let response = response as? HTTPURLResponse, (200..<400).contains(response.statusCode) else { return print("Invalid response") }
            
            guard let data = data else { return }
            
            guard let jsonObject = try? JSONSerialization.jsonObject(with: data) as? [String: Any] else { return print("\(data) jsonObject 실패")}
            guard let forigenValue = jsonObject["\(requestKey)"] as? [Double] else { return print("forigneValue fail")}
            
            print("forigenValue -> \(forigenValue[0])")
            
            
            self.price = forigenValue[0]
            completion(forigenValue[0])
            
            //            self.exchangeForeign()
            
        }
        dataTask.resume()
        
    }
}


