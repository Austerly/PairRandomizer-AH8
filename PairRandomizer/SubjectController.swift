//
//  StudjectController.swift
//  PairRandomizer
//
//  Created by Taylor Mott on 9/6/16.
//  Copyright © 2016 Mott Applications. All rights reserved.
//

import Foundation
import CoreData

class SubjectController {
    
    //C
    static func createSubject() -> Subject {
        let newSubject = NSEntityDescription.insertNewObjectForEntityForName(Subject.className, inManagedObjectContext: Stack.sharedStack.managedObjectContext) as! Subject
        
        return newSubject
    }
    
    //R
    static func allSubjects() -> [Subject] {
        let fetchRequest = NSFetchRequest(entityName: Subject.className)
        
        let sortDescriptor = NSSortDescriptor(key: "name", ascending: true, selector: #selector(NSString.localizedStandardCompare(_:)))
        
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        do {
            let subjectArray = try Stack.sharedStack.managedObjectContext.executeFetchRequest(fetchRequest) as? [Subject]
            
            return subjectArray ?? [Subject]()
        } catch {
            print(error)
            return [Subject]()
        }
    }
    
    //U
    //Save with Stack class
    
    //D
    static func deleteSubject(subjectToDelete: Subject) {
        subjectToDelete.managedObjectContext?.deleteObject(subjectToDelete)
    }
    
}