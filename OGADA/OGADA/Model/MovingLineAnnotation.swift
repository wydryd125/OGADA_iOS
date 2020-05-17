//
//  MovingLineAnnotation.swift
//  OGADA
//
//  Created by 양중창 on 2020/03/13.
//  Copyright © 2020 didwndckd. All rights reserved.
//

import Foundation
import MapKit

class MovingLineAnnotation: MKPointAnnotation {
    
    var index: Int
    
    init(index: Int) {
        self.index = index
        super.init()
    }
    
}
