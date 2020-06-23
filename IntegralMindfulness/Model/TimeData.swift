//
//  TimeData.swift
//  IntegralMindfulness
//
//  Created by Bartek on 6/23/20.
//  Copyright © 2020 Bartek. All rights reserved.
//

import Foundation
import UIKit

struct TimeData {
    var bellImage: UIImage
    var totalTime: String
    var bellName: String
    var supportingBellName: String
    
    init(bellImage: UIImage, totalTime: String, bellName: String, supportingBellName: String) {
        self.bellImage = bellImage
        self.totalTime = totalTime
        self.bellName = bellName
        self.supportingBellName = supportingBellName
    }
    
}
