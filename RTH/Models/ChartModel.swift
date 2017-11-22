//
//  ChartModel.swift
//  RTH
//
//  Created by Lan Thien on 11/21/17.
//  Copyright © 2017 Lan Thien. All rights reserved.
//

import Foundation

struct ChartModel: Codable {
    var amount:String
    var date:String
    
    func getDateConverted() -> String? {
        return date.toDate()?.toString()
    }
}
