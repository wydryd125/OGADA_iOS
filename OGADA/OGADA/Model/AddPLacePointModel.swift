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
    let position: Int
    var placeList: [Place]
    var currentPlace: Place?
    var selectedNumberOfPicker: Int?
    
    init(position: Int, placeList: [Place]) {
        self.position = position
        self.placeList = placeList
    }
    
    mutating func insertPlace(position: Int, place: Place) {
        placeList.insert(place, at: position)
    }
}



