//
//  Temperature.swift
//  VirtusaWeather
//
//  Created by Kiranpal Reddy Gurijala on 2/20/17.
//  Copyright © 2017 AryaVahni. All rights reserved.
//

import Foundation

struct Temperature {
  let degrees: String

  init(country: String, openWeatherMapDegrees: Double) {
    if country == "US" {
      degrees = String(TemperatureConverter.kelvinToFahrenheit(openWeatherMapDegrees)) + "\u{f045}"
    } else {
      degrees = String(TemperatureConverter.kelvinToCelsius(openWeatherMapDegrees)) + "\u{f03c}"
    }
  }
}
