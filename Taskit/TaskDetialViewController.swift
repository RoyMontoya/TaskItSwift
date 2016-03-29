//
//  TaskDetialViewController.swift
//  Taskit
//
//  Created by Roy Montoya on 3/12/16.
//  Copyright © 2016 Roy Montoya. All rights reserved.
//

import UIKit

class TaskDetialViewController: UIViewController {
    
    @IBOutlet weak var taskTextField: UITextField!
    @IBOutlet weak var subTaskTextField: UITextField!
    @IBOutlet weak var dueDatePicker: UIDatePicker!
    
    var detailTaskModel: TaskModel!
   
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(detailTaskModel.task)
        self.taskTextField.text = detailTaskModel.task
        self.subTaskTextField.text = detailTaskModel.subtask
        self.dueDatePicker.date = detailTaskModel.date!
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func cancelButtonTapped(sender: UIBarButtonItem) {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    
    @IBAction func doneBarButtonPressed(sender: UIBarButtonItem) {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        detailTaskModel.task = taskTextField.text
        detailTaskModel.subtask = subTaskTextField.text
        detailTaskModel.date = dueDatePicker.date
        detailTaskModel.completed = detailTaskModel.completed
        
        appDelegate.saveContext()
        
        
        self.navigationController?.popViewControllerAnimated(true)
    }
    
}
