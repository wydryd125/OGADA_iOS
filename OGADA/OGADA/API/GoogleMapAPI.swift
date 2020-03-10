//
//  API.swift
//  OGADA
//
//  Created by 양중창 on 2020/03/07.
//  Copyright © 2020 didwndckd. All rights reserved.
//

import Foundation


struct GoogleMapAPI {
    
    private let searchPlaceURL = "https://maps.googleapis.com/maps/api/place/textsearch/json?"
    
    func searchPlaceRequest(query: String) {
        
        var urlComponent = URLComponents(string: searchPlaceURL)
        
        urlComponent?.queryItems = [
        URLQueryItem(name: "query", value: query)
        ]
            
        
    }
    
}
