//
//  StudentDetailViewController.swift
//  TestProject
//
//  Created by Jonas Schramm on 24.01.15.
//  Copyright (c) 2015 Cjsase. All rights reserved.
//

import UIKit

class StudentDetailViewController: UIViewController {
    
    @IBOutlet weak var labelName: UILabel!
    var student:Student!
    
    override func viewDidLoad() {
        labelName.text = "Name: \(student.forename) \(student.surname)"
    }
    
    
    
}