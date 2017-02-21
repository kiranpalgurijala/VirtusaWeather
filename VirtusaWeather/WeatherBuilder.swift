//
//  WeatherBuilder.swift
//  VirtusaWeather
//
//  Created by Kiranpal Reddy Gurijala on 2/20/17.
//  Copyright © 2017 AryaVahni. All rights reserved.
//

import Foundation

struct WeatherBuilder {
  var location: String?
  var iconText: String?
  var temperature: String?
  var description: String?
  var forecasts: [Forecast]?

  func build() -> Weather {
    return Weather(location: location!,
                      iconText: iconText!,
                   temperature: temperature!,
                   description: description!,
                   forecasts: forecasts!)
  }
    
}
