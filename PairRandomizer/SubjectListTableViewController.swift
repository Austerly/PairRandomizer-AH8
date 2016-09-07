//
//  ViewController.swift
//  PairRandomizer
//
//  Created by Taylor Mott on 9/6/16.
//  Copyright © 2016 Mott Applications. All rights reserved.
//

import UIKit

class SubjectListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - TableView Data Source
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SubjectController.allSubjects().count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("subjectCell", forIndexPath: indexPath)
        
        let subject = SubjectController.allSubjects()[indexPath.row]
        
        cell.textLabel?.text = subject.name
        
        return cell
    }
    
    
    @IBAction func addSubjectButtonTapped() {
        
        let alert = UIAlertController(title: "Add New Subject", message: nil, preferredStyle: .Alert)
        
        alert.addTextFieldWithConfigurationHandler { (textField) in
            textField.placeholder = "Subject Name"
        }
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: nil))
        
        alert.addAction(UIAlertAction(title: "Add", style: .Default, handler: { (_) in
            guard let textFields = alert.textFields,
                subjectTextField = textFields.first else { return }
            
            let newSubject = SubjectController.createSubject()
            newSubject.name = subjectTextField.text ?? "No Subject Name"
            
            self.tableView.reloadData()
        }))
        
    }
    
    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toPairDetail" {
            if let cell = sender as? UITableViewCell, indexPath = tableView.indexPathForCell(cell) {
                let subjectToPass = SubjectController.allSubjects()[indexPath.row]
                
                let pairTableViewController = segue.destinationViewController as? PairTableViewController
                
                pairTableViewController?.subject = subjectToPass
            }
        }
    }


}

