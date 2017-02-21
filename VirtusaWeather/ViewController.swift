//
//  ViewController.swift
//  VirtusaWeather
//
//  Created by Kiranpal Reddy Gurijala on 2/20/17.
//  Copyright © 2017 AryaVahni. All rights reserved.
//

import UIKit
import QuartzCore

class ViewController: UIViewController {

    //let cityNames = ["Chicago", "New York", "Houston", "San Francisco", "Austin", "Denver", "Detroit", "Los Angeles", "Seattle", "Nashville"]
    //let cityCodes = ["4887398", "5128638", "4699066", "5391959", "4099974", "4853799", "4990729", "5368361", "5809844", "5003243"];
    var queryCity = ["sunnyvale,us"]
    
    @IBOutlet weak var weatherInfoView: UIView!
    @IBOutlet weak var queryCityName: UITextField!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var weatherDescription: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var weatherIcon: UIImageView!
    
    var userDefaults = Foundation.UserDefaults.standard
    
    var cityWeatherInfoList:[Weather]=[]
    // MARK: - Services
    //private var locationService: LocationService
    fileprivate var weatherService: OpenWeatherServiceProtocol = OpenWeatherService()
    
    //MARK: - View controller life cycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        weatherInfoView.layer.borderWidth = 3.0
        weatherInfoView.layer.borderColor = UIColor.lightGray.cgColor
        
        //temperatureLabel.text = cityWeatherInfoList.


        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        
        if userDefaults.object(forKey: "defaultTemperatureLabel") != nil{
        self.temperatureLabel.text = userDefaults.string(forKey: "defaultTemperatureLabel")
        self.weatherDescription.text = userDefaults.string(forKey: "defaultWeatherDescription")
        self.locationLabel.text = userDefaults.string(forKey: "defaultLocationLabel")
        let url = URL(string: "http://openweathermap.org/img/w/" + userDefaults.string(forKey: "defaultWeatherIcon")! + ".png")
        let data = try? Data(contentsOf: url!)
        self.weatherIcon.image = UIImage(data: data!)

        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func getCityWeatherInfo(_ sender: Any) {
       print(queryCityName.text!)
        let escapedString = queryCityName.text!.addingPercentEncoding(withAllowedCharacters:NSCharacterSet.urlQueryAllowed)
        queryCity=[escapedString!]
        if Reachability.isConnectedToNetwork() == true {
            print("Internet connection OK")
            weatherService.retrieveWeatherInfo(queryCity as NSArray, type: "search") { (weather, error) -> Void in
                //DispatchQueue.main.async(execute: {
                    if let unwrappedError = error {
                        print(unwrappedError)
                        self.update(unwrappedError)
                        return
                    }
                    
                    guard let unwrappedWeather = weather else {
                        return
                    }
                    self.update(unwrappedWeather)
                //})
                
            }
            
        } else {
            print("Internet connection FAILED")
        }

    }
    // MARK: - private 
    // Updating the UI after recieving information from the server
    fileprivate func update(_ weather: Weather) {
        cityWeatherInfoList.append(weather)
        print("cityWeatherInfoList", cityWeatherInfoList, weather.temperature)
        
        userDefaults.set( weather.temperature, forKey: "defaultTemperatureLabel")
        userDefaults.set( weather.description, forKey: "defaultWeatherDescription")
        userDefaults.set( weather.location, forKey: "defaultLocationLabel")
        userDefaults.set( weather.iconText, forKey: "defaultWeatherIcon")
        
                DispatchQueue.main.async {
            self.temperatureLabel.text = weather.temperature
            self.weatherDescription.text = weather.description
            self.locationLabel.text = weather.location
            let url = URL(string: "http://openweathermap.org/img/w/" + weather.iconText + ".png")
            let data = try? Data(contentsOf: url!)
            self.weatherIcon.image = UIImage(data: data!)
            self.temperatureLabel.setNeedsDisplay()
            self.weatherDescription.setNeedsDisplay()
            self.locationLabel.setNeedsDisplay()
            self.weatherIcon.setNeedsDisplay()
            self.weatherInfoView.setNeedsDisplay()
        }
       
       
    }
    
    fileprivate func update(_ error: Error) {
        print("WeatherInfo",error)
    }

}

