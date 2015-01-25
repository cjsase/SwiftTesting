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

   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        fetchData("wuerzburg")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

