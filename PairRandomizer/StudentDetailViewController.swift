//
//  StudentDetailViewController.swift
//  PairRandomizer
//
//  Created by Taylor Mott on 9/6/16.
//  Copyright © 2016 Mott Applications. All rights reserved.
//

import UIKit

class StudentDetailViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var deleteButton: UIButton!
    var student: Student?
    var subject: Subject?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if let student = student {
            self.nameTextField.text = student.name
            self.idTextField.text = student.identifier
            self.deleteButton.hidden = false
        } else {
            self.deleteButton.hidden = true
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveButtonTapped() {
        if let student = self.student {
            student.name = nameTextField.text
            student.identifier = idTextField.text
            Stack.saveToPersistentStore()
        } else if let subject = self.subject {
            let newStudent = StudentController.createStudent(subject)
            newStudent.name = nameTextField.text
            newStudent.identifier = idTextField.text
            Stack.saveToPersistentStore()
        }
    }
    
    @IBAction func deleteButtonTapped() {
        let alert = UIAlertController(title: "Delete Student?", message: "Are you sure?", preferredStyle: .ActionSheet)
        alert.addAction(UIAlertAction(title: "Yes", style: .Destructive, handler: { (_) in
            if let student = self.student {
                StudentController.deleteStudent(student)
                Stack.saveToPersistentStore()
            }
        }))
        
        alert.addAction(UIAlertAction(title: "No", style: .Default, handler: nil))
        
        presentViewController(alert, animated: true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
