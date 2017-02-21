//
//  Observable.swift
//  VirtusaWeather
//
//  Created by Kiranpal Reddy Gurijala on 2/20/17.
//  Copyright © 2017 AryaVahni. All rights reserved.
//

import Foundation

class Observable<T> {
  typealias Observer = (T) -> Void
  var observer: Observer?
  
  func observe(_ observer: Observer?) {
    self.observer = observer
    observer?(value)
  }
  
  var value: T {
    didSet {
      observer?(value)
    }
  }
  
  init(_ v: T) {
    value = v
  }
}
