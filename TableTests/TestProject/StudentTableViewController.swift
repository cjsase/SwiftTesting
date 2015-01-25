//
//  StudentTableViewController.swift
//  TestProject
//
//  Created by Jonas Schramm on 23.01.15.
//  Copyright (c) 2015 Cjsase. All rights reserved.
//

import UIKit

class StudentTableViewController: UITableViewController {
    
    var students = SampleData().studentData
    
    @IBAction func saveStudent(segue:UIStoryboardSegue){
        let studentAddViewController = segue.sourceViewController as AddStudentViewController
        students.append(studentAddViewController.newStudent!)
        let indexPath:NSIndexPath = NSIndexPath(forItem: students.count-1, inSection: 0)
        tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (section == 0) {
        return students.count
        }
        else {
            return 5
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if indexPath.section == 0{
            
        let cell = tableView.dequeueReusableCellWithIdentifier("studentCellID") as StudentTableViewCell
        configureCell(cell, atIndexPath: indexPath)
        return cell
        } else {
            let cell = tableView.dequeueReusableCellWithIdentifier("profCellID") as ProfTableViewCell
            cell.lblProfName.text = "Nr." + String(indexPath.row)
            return cell
        }
    }
    
    func configureCell(cell: StudentTableViewCell, atIndexPath indexPath:NSIndexPath){
        
        let student = students[indexPath.row]
        cell.lblForeName.text = student.forename ?? "StudentForeName"
        cell.lblSurName.text = student.surname ?? "StudentSurName"
        cell.lblNumber.text = String(student.matNr) ?? "StudentMatNr"
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        var sectionHeader:String?
        switch (section) {
        case 0: sectionHeader = "Student"
        case 0...100: sectionHeader = "Professor"
        default: sectionHeader = "Default"
        }
        return "Student"
    }
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat{
        return 50
    }
    
    override func tableView(tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        if section == 0 {
            return "StudentENDE"
        } else {
            return "ProfENDE"
        }
    }
    override func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 75.0;
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showStudentDetailSegue" {
            let indexPath:NSIndexPath = tableView.indexPathForSelectedRow()!
            let student = students[indexPath.row]
            let destViewController = segue.destinationViewController as StudentDetailViewController
            destViewController.student = student
        }
    }
}
