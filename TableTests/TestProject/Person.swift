//
//  Person.swift
//  TestProject
//
//  Created by Jonas Schramm on 24.01.15.
//  Copyright (c) 2015 Cjsase. All rights reserved.
//

import Foundation

class Person:NSObject {
    let forename:String
    let surname:String
    var age:Int
    var email:String?
    
    convenience init(personForename: String, personSurname: String, personAge: Int) {
        self.init(personForename: personForename, personSurname: personSurname, personAge: personAge, personEmail:nil)
    }
    
    init(personForename: String, personSurname: String, personAge: Int, personEmail: String?) {
        forename = personForename
        surname = personSurname
        age = personAge
        email = personEmail
    }
    
    func getPersonAsString() -> String {
        //Version 1
        /*
        if email == nil {
        return "\(forename) \(surname) (\(age))"
        } else {
        return "\(forename) \(surname) (\(age)) [\(email)]"
        }
        // */
        
        //Version 2 (ist schöner)
        var result:String = "\(forename) \(surname) (\(age))"
        if let mail = email {
            result += " \(mail)"
        }
        return result
    }
    
    func increaseAgeAfterBirthday() {
        age++
    }
}
