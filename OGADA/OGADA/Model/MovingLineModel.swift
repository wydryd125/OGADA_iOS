//
//  MovingLineModel.swift
//  OGADA
//
//  Created by 양중창 on 2020/03/12.
//  Copyright © 2020 didwndckd. All rights reserved.
//

import Foundation


struct MovingLineModel: Codable {
    var currentDateLevel: Int = 0
    private var placeList: [[Place]] = []
    private let dateList: [String] = []
    
}
