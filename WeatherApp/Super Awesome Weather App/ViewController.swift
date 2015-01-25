//
//  ViewController.swift
//  Super Awesome Weather App
//
//  Created by Jonas Schramm on 19.01.15.
//  Copyright (c) 2015 Jonas Schramm. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelLocation: UILabel!
    @IBOutlet weak var labelTemp: UILabel!
    @IBOutlet weak var labelHumidity: UILabel!
    @IBOutlet weak var labelMaxTemp: UILabel!
    @IBOutlet weak var labelMinTemp: UILabel!
    @IBOutlet weak var labelPressure: UILabel!

    @IBOutlet weak var imageWeather: UIImageView!
   
    @IBOutlet weak var mainView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let location:String = "wuerzburg"
        let URLString:String = "http://api.openweathermap.org/data/2.5/weather?q="
        let wuWeatherURL:NSURL = NSURL(string: "\(URLString)\(location)")!
        let request:NSURLRequest = NSURLRequest(URL: wuWeatherURL)
        let config = NSURLSessionConfiguration.defaultSessionConfiguration()
        let session = NSURLSession(configuration: config)
        
        session.dataTaskWithRequest(request, completionHandler:
            {
                (data, response, error) -> Void in
                if error != nil
                {
                    return
                }
                var parseError:NSError?
                
                let parsedObject:AnyObject? = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments, error: &parseError)
                
                if parseError != nil
                {
                    return
                }
                if let weather = parsedObject as? NSDictionary
                {
                    if let dt = weather["dt"] as? Int
                    {
                        if let main = weather["main"] as? NSDictionary
                        {
                            if let humidity = main["humidity"] as? Int
                            {
                                if let temp_max = main["temp_max"] as? Double
                                {
                                    if let temp_min = main["temp_min"] as? Double
                                    {
                                        if let temp = main["temp"] as? Double
                                        {
                                            if let pressure = main["pressure"] as? Double
                                            {
                                                if let weatherMainArray = weather["weather"] as? NSArray
                                                {
                                                    if let weatherMainDic = weatherMainArray[0] as? NSDictionary
                                                    {
                                                        if let weatherIcon = weatherMainDic["main"] as? String
                                                        {
                                                            if let locationName = weather["name"] as? String
                                                            {
                                                                var weatherNew:Weather = Weather(DT: dt, temp: temp, humidity: humidity, temp_min: temp_min, temp_max: temp_max, pressure: Int(pressure), seaLevel: 0, groundLevel: 0, weatherMain: weatherIcon)
                                                                println("Bis hierhin \(weatherNew.temp)")
                                                                var locnew = Location(ID: 121739, name: locationName, lat: 49.79, lon: 9.94, message: "Fehler", country: "Germany", sunrise: 1421478603, sunset: 1421509845, weather: weatherNew)
                                                                println(locnew.weather.temp)
                                                                println("Data parsed")
                                        
                                                                dispatch_async(dispatch_get_main_queue(), {
                                                                self.labelLocation.text = locnew.name
                                                                self.labelTemp.text = "\(Int(locnew.weather.temp))°C"
                                                                self.labelHumidity.text = "\(locnew.weather.humidity)%"
                                                                self.labelMaxTemp.text = "\(Int(locnew.weather.temp_max))°C"
                                                                self.labelMinTemp.text = "\(Int(locnew.weather.temp))°C"
                                                                self.labelPressure.text = "\(locnew.weather.pressure)"
                                                                self.imageWeather.image = UIImage(named: "\(locnew.weather.weatherMain.rawValue)")
                                                                println(locnew.weather.weatherMain.rawValue)
                                                                println("Hello")
                                                                })
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            ).resume()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

