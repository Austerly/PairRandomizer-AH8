//
//  PairTableViewController.swift
//  PairRandomizer
//
//  Created by Taylor Mott on 9/6/16.
//  Copyright © 2016 Mott Applications. All rights reserved.
//

import UIKit

class PairTableViewController: UITableViewController, SingleButtonTableViewCellDelegate, DoubleButtonTableViewCellDelegate {
    
    var subject: Subject?
    var pairs: [Pair]?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        
        self.pairs = subject?.randomizePairs()
        self.tableView.reloadData()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return (self.pairs?.count ?? 0) + 1
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.row == (pairs?.count ?? 0) {
            let singleButtonCell = tableView.dequeueReusableCellWithIdentifier("singleButtonCell", forIndexPath: indexPath) as! SingleButtonTableViewCell
            
            singleButtonCell.delegate = self
            singleButtonCell.singleButton.setTitle("Randomize", forState: .Normal)
            
            
            return singleButtonCell
        } else {
            let doubleButtonCell = tableView.dequeueReusableCellWithIdentifier("doubleButtonCell", forIndexPath: indexPath) as! DoubleButtonTableViewCell
            
            doubleButtonCell.delegate = self
            
            if let pairs = self.pairs {
                let pair = pairs[indexPath.row]
                
                doubleButtonCell.leftButton.setTitle(pair.student1.name ?? "Student 1", forState: .Normal)
                doubleButtonCell.rightButton.setTitle(pair.student2?.name ?? "Mentor", forState: .Normal)
                
            } else {
                doubleButtonCell.leftButton.setTitle("Student 1", forState: .Normal)
                doubleButtonCell.rightButton.setTitle("Student 2", forState: .Normal)
            }
            
            return doubleButtonCell
        }
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */
    
    // MARK: - Button Cell Delegate Methods
    
    func singleButtonTableViewCellButtonTapped(cell: SingleButtonTableViewCell) {
        self.pairs = subject?.randomizePairs()
        self.tableView.reloadData()
    }
    
    func doubleButtonTableViewCell(cell: DoubleButtonTableViewCell, buttonTapped: DoubleButtonTableViewCell.Button) {
        if let indexPath = tableView.indexPathForCell(cell), pairs = pairs {
            let pair = pairs[indexPath.row]
            var student: Student?
            
            switch buttonTapped {
            case .Left:
                student = pair.student1
            case .Right:
                student = pair.student2
            }
            
            
            if student != nil {
                self.performSegueWithIdentifier("toStudentDetail", sender: student)
            }
        }
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toStudentDetail" {
            let studentDetailViewController = segue.destinationViewController as? StudentDetailViewController
            studentDetailViewController?.student = sender as? Student
            studentDetailViewController?.subject = subject
        } else if segue.identifier == "toAddStudent" {
            let studentDetailViewController = segue.destinationViewController as? StudentDetailViewController
            studentDetailViewController?.subject = subject
        }
    }
    

}
