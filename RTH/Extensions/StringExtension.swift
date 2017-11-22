//
//  StringExtension.swift
//  RTH
//
//  Created by Lan Thien on 11/21/17.
//  Copyright © 2017 Lan Thien. All rights reserved.
//

import Foundation

extension String {
    func toDate() -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/YYYYY"
        return dateFormatter.date(from: self)
    }
}
