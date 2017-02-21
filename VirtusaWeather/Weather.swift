//
//  Weather.swift
//  VirtusaWeather
//
//  Created by Kiranpal Reddy Gurijala on 2/20/17.
//  Copyright © 2017 AryaVahni. All rights reserved.
//

import Foundation

struct Weather {
  let location: String
  let iconText: String
  let temperature: String
  let description: String
  let forecasts: [Forecast]
}
