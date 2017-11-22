//
//  EnumStorage.swift
//  RTH
//
//  Created by Lan Thien on 11/22/17.
//  Copyright © 2017 Lan Thien. All rights reserved.
//

import Foundation

enum GetDataError: Error {
    case connectFail, getDataFail
}

struct StringofDate {
    var weekday = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
    var month = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    init(){}
}
