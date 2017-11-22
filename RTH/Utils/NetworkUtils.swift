//
//  NetworkUtils.swift
//  RTH
//
//  Created by Lan Thien on 11/22/17.
//  Copyright © 2017 Lan Thien. All rights reserved.
//

import Foundation
import Alamofire

class NetworkUtils {
    
    static var instance:NetworkUtils {
        return NetworkUtils()
    }
    
    private init() {
        
    }
    
    public func getChartModel(completeHandler: ((_ data: [ChartModel]) -> Void)?, errorHandler:((GetDataError?)->Void)?) {
        let header = ["X-App-Token":"76524a53ee60602ac3528f38"]
        Alamofire.request("https://rth-recruitment.herokuapp.com/api/prices/chart_data", method: .get, parameters: nil,
                          encoding: URLEncoding.default, headers: header)
            .responseJSON { (dataResponse) in
                if dataResponse.error != nil {
                    errorHandler?(GetDataError.connectFail)
                    return
                }
                guard let response = dataResponse.value,
                    let json = try? JSONSerialization.data(withJSONObject: response),
                    let data = try? JSONDecoder().decode([ChartModel].self, from: json)
                    else {
                        errorHandler?(GetDataError.connectFail)
                        return
                }
                completeHandler?(data)
        }
        Alamofire.request("https://rth-recruitment.herokuapp.com/api/prices/chart_data", method: .get, parameters: nil,
                          encoding: URLEncoding.default, headers: header).responseData { (dataResponse) in
                            if dataResponse.error != nil {
                                errorHandler?(GetDataError.connectFail)
                                return
                            }
                            guard let value = dataResponse.value,
                                let data = try? JSONDecoder().decode([ChartModel].self, from: value)
                                else {
                                    errorHandler?(GetDataError.connectFail)
                                    return
                            }
                            completeHandler?(data)
        }
    }
}
