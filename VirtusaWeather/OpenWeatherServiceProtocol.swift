//
//  OpenWeatherServiceProtocol.swift
//  VirtusaWeather
//
//  Created by Kiranpal Reddy Gurijala on 2/20/17.
//  Copyright © 2017 AryaVahni. All rights reserved.
//

import Foundation
import CoreLocation

typealias WeatherCompletionHandler = (Weather?, Error?) -> Void

protocol OpenWeatherServiceProtocol {
    func retrieveWeatherInfo(_ location: NSArray, type:String, completionHandler: @escaping WeatherCompletionHandler)
}


