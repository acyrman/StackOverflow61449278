//
//  WeatherDataProtocol.swift
//  SO 61449278
//
//  Created by acyrman on 4/26/20.
//  Copyright © 2020 iCyrman. All rights reserved.
//

import Foundation

protocol WeatherDataProtocol {
   func responseDataHandler(data: NSDictionary)
   func responseError(message: String)
}
