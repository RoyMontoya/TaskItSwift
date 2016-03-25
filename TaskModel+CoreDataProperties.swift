//
//  TaskModel+CoreDataProperties.swift
//  Taskit
//
//  Created by Roy Montoya on 3/25/16.
//  Copyright © 2016 Roy Montoya. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

@objc(TaskModel)
class TaskModel: NSManagedObject {

    @NSManaged var completed: NSNumber?
    @NSManaged var date: NSDate?
    @NSManaged var subtask: String?
    @NSManaged var task: String?

}
