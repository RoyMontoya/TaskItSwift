//
//  AddTaskViewController.swift
//  Taskit
//
//  Created by Roy Montoya on 3/21/16.
//  Copyright © 2016 Roy Montoya. All rights reserved.
//

import UIKit
import CoreData

class AddTaskViewController: UIViewController {
    @IBOutlet weak var taskTextField: UITextField!
    @IBOutlet weak var subTaskTextField: UITextField!
    @IBOutlet weak var dueDatePicker: UIDatePicker!
    
    var mainVC: ViewController!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    @IBAction func cancelButtonTapped(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func addTaskButtonTapped(sender: UIButton) {
        let appDelegate = (UIApplication.sharedApplication().delegate as! AppDelegate)
        let manageObjectContext = appDelegate.managedObjectContext
        
        let entityDescription = NSEntityDescription.entityForName("TaskModel", inManagedObjectContext: manageObjectContext)
        let task = TaskModel(entity: entityDescription!, insertIntoManagedObjectContext: manageObjectContext)
        task.task = taskTextField.text
        task.subtask = subTaskTextField.text
        task.date = dueDatePicker.date
        task.completed = false
        
        appDelegate.saveContext()
        
        var request = NSFetchRequest(entityName: "TaskModel")
        var error:NSError? = nil
        
        var results:NSArray = manageObjectContext.executeFetchRequest(request)
        
        for res in results {
            
        }
        
        dismissViewControllerAnimated(true, completion: nil)
    }

}
