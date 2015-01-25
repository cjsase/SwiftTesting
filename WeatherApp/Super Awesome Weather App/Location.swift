//
//  Location.swift
//  Super Awesome Weather App
//
//  Created by Jonas Schramm on 19.01.15.
//  Copyright (c) 2015 Jonas Schramm. All rights reserved.
//

import Foundation
import MapKit

class Location{
    let ID: Int
    let name: String
    let coordinates: CLLocationCoordinate2D
    let message : String
    let country: String
    let sunrise: NSDate
    let sunset: NSDate
    let weather: Weather
    
    init(ID: Int,
        name: String,
        lat: CLLocationDegrees,
        lon: CLLocationDegrees,
        message: String,
        country: String,
        sunrise: Int,
        sunset: Int,
        weather: Weather){
            
            self.ID = ID
            self.name = name
            //self.coordinates = CLLocationCoordinate2DMake(lat, lon)
            self.coordinates = CLLocationCoordinate2D(latitude: lat, longitude: lon)
            self.message = message
            self.message = message
            self.country = country
            self.sunrise = NSDate(timeIntervalSince1970: NSTimeInterval(sunrise))
            self.sunset = NSDate(timeIntervalSince1970: NSTimeInterval(sunset))
            self.weather = weather
    }
}
