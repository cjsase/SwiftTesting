//
//  AddStudentViewController.swift
//  TestProject
//
//  Created by Jonas Schramm on 24.01.15.
//  Copyright (c) 2015 Cjsase. All rights reserved.
//

import Foundation
import UIKit

class AddStudentViewController:UITableViewController {
    
    
    @IBOutlet weak var textForename: UITextField!
    @IBOutlet weak var textSurename: UITextField!    
    @IBOutlet weak var textAge: UITextField!
    @IBOutlet weak var textNumber: UITextField!
    var newStudent:Student?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let forename:String = textForename.text
        let surename:String = textSurename.text
        var age:Int = textAge.text.toInt() ?? 0
        var number:Int = textNumber.text.toInt() ?? 0
        newStudent = Student(studentMatNr: number, studentForename: forename, studentSurename: surename, studentAge: age)
        
    }
    
}