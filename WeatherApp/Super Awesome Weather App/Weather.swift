//
//  Weather.swift
//  Super Awesome Weather App
//
//  Created by Jonas Schramm on 19.01.15.
//  Copyright (c) 2015 Jonas Schramm. All rights reserved.
//

import Foundation
import MapKit

enum WeatherMain: String {
    case Rain = "Rainy"
    case Clouds = "Cloudy"
    case Sun = "Sunny"
    case SunnyWithClouds = "SunnyWithClouds"
    var img: UIImage {
        return UIImage(named: self.rawValue)!
    }
}

class Weather {
    let DT: NSDate
    let temp: Double
    let humidity: Int
    let temp_min: Double
    let temp_max : Double
    let pressure: Int
    let seaLevel: Int
    let groundLevel: Int
    let weatherMain: WeatherMain
    
    
    init(DT: Int,
        temp: Double,
        humidity: Int,
        temp_min: Double,
        temp_max: Double,
        pressure: Int,
        seaLevel: Int,
        groundLevel: Int,
        weatherMain: String) {
            
            self.DT = NSDate(timeIntervalSince1970: NSTimeInterval(DT))
            self.temp = temp - 273.15
            self.humidity = humidity
            self.temp_min = temp_min - 273.15
            self.temp_max = temp_max - 273.15
            self.pressure = pressure
            self.seaLevel = seaLevel
            self.groundLevel = groundLevel
            switch weatherMain {
            case "Rain":
                self.weatherMain = .Rain
            case "Clouds":
                self.weatherMain = .Clouds
            case "Sun":
                self.weatherMain = .Sun
            default:
                self.weatherMain = WeatherMain.SunnyWithClouds
            }
    }
    
}
