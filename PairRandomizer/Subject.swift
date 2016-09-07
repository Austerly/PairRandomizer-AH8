//
//  Subject.swift
//  PairRandomizer
//
//  Created by Taylor Mott on 9/6/16.
//  Copyright © 2016 Mott Applications. All rights reserved.
//

import Foundation
import CoreData


class Subject: NSManagedObject {

// Insert code here to add functionality to your managed object subclass

    static let className = "Subject"
    
    func randomizePairs() -> [Pair] {
        var pairArray = [Pair]()
        
        var allStudentsArray = self.students?.array ?? [Student]()
        
        while (allStudentsArray.count > 0) {
            
            var student2: Student?
            
            let randomIndex = Int(arc4random_uniform(UInt32(allStudentsArray.count)))
            let student1 = allStudentsArray[randomIndex] as! Student
            allStudentsArray.removeAtIndex(randomIndex)
            
            if (allStudentsArray.count != 0) {
                let randomIndex = Int(arc4random_uniform(UInt32(allStudentsArray.count)))
                student2 = allStudentsArray[randomIndex] as? Student
                allStudentsArray.removeAtIndex(randomIndex)
            }
            
            let pair = Pair(student1: student1, student2: student2)
            pairArray.append(pair)
        }
        
        return pairArray
    }

}
