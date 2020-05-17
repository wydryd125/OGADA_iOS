//
//  API.swift
//  OGADA
//
//  Created by 양중창 on 2020/03/07.
//  Copyright © 2020 didwndckd. All rights reserved.
//

import Foundation


struct GoogleMapAPI {
    
    private let searchPlaceURL = "https://maps.googleapis.com/maps/api/place/findplacefromtext/json?"
    
    func searchPlaceRequest(query: String, completionHandler: @escaping (Result<Data, Error>) -> Void ) {
        
        var urlComponent = URLComponents(string: searchPlaceURL)
        
        urlComponent?.queryItems = [
        URLQueryItem(name: "input", value: query),
        URLQueryItem(name: "key", value: APIKey.googlePlace.rawValue),
        URLQueryItem(name: "inputtype", value: "textquery")
        ]
        guard let url = urlComponent?.url else { return print("Bad URL") }
        
//        urlRequest.addValue(APIKey.googleMap.rawValue, forHTTPHeaderField: "key")
        
        let task = URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            guard error == nil else {
                    completionHandler(.failure(error!))
                    return
            }
            
            guard let data = data else {
                completionHandler(.failure(error!))
                return
            }
            DispatchQueue.main.async {
                completionHandler(.success(data))
            }
            
        }
        
        task.resume()
        
    }
    
}
