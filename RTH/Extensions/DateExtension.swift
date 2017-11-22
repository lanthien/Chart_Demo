//
//  DateExtension.swift
//  RTH
//
//  Created by Lan Thien on 11/21/17.
//  Copyright © 2017 Lan Thien. All rights reserved.
//

import Foundation

extension Date {
    
    func toString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMM YYYY"
        return formatter.string(from: self)
    }
    
    func getComponents() -> DateComponents{
        let calendar = Calendar.current
        return calendar.dateComponents([.weekday, .day, .month, .year], from: self)
    }
    
    var weekday:String? {
        guard let dayInt = getComponents().weekday else { return nil }
        return StringofDate().weekday[dayInt - 1]
    }
    
    var monthByString:String {
        guard let month = getComponents().month else { return StringofDate().month[0] }
        return StringofDate().month[month - 1]
    }
    
    var day:Int {
        return getComponents().month ?? 1
    }
    
    var year:Int {
        return getComponents().year ?? 1900
    }
}
