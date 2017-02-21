//
//  TemperatureConverter.swift
//  VirtusaWeather
//
//  Created by Kiranpal Reddy Gurijala on 2/20/17.
//  Copyright © 2017 AryaVahni. All rights reserved.
//

import Foundation

struct TemperatureConverter {
  static func kelvinToCelsius(_ degrees: Double) -> Double {
    return round(degrees + 37)
  }

  static func kelvinToFahrenheit(_ degrees: Double) -> Double {
    return round(degrees * 9 / 5 - 459.67)
  }
}
