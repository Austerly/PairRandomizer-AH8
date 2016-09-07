//
//  StudentController.swift
//  PairRandomizer
//
//  Created by Taylor Mott on 9/6/16.
//  Copyright © 2016 Mott Applications. All rights reserved.
//

import Foundation
import CoreData

class StudentController {
    
    //C
    static func createStudent(subject: Subject) -> Student {
        let newStudent = NSEntityDescription.insertNewObjectForEntityForName(Student.className, inManagedObjectContext: Stack.sharedStack.managedObjectContext) as! Student
        
        newStudent.subject = subject
        
        return newStudent
    }
    
    //R
    //We are accessing student through our subject instances and it's core data relationship.
    
    //U
    //Save from Stack class
    
    //D
    static func deleteStudent(studentToDelete: Student) {
        studentToDelete.managedObjectContext?.deleteObject(studentToDelete)
    }
    
}