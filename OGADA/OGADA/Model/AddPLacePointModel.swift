//
//  AddPLacePointModel.swift
//  OGADA
//
//  Created by 양중창 on 2020/03/10.
//  Copyright © 2020 didwndckd. All rights reserved.
//

import Foundation
import CoreLocation


struct AddPlacePointModel {
    private let position: Int
    private var placeList: [Place]
    
    mutating func insertPlace(index: Int, place: Place) {
        placeList.insert(place, at: index)
    }
}


struct Place: Codable {
    let latitude: Double
    let longitude: Double
    let name: String
    let address: String
    let id: String?
}

