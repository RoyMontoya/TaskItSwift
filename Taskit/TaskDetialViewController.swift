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
    var MainVC: ViewController!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(detailTaskModel.task)
        self.taskTextField.text = detailTaskModel.task
        self.subTaskTextField.text = detailTaskModel.subTask
        self.dueDatePicker.date = detailTaskModel.date
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func cancelButtonTapped(sender: UIBarButtonItem) {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    
    @IBAction func doneBarButtonPressed(sender: UIBarButtonItem) {
        
        let task = TaskModel(task: taskTextField.text!, subTask: subTaskTextField.text!, date: dueDatePicker.date, completed: false)
        MainVC.baseArray[0][MainVC.tableView.indexPathForSelectedRow!.row] = task
        self.navigationController?.popViewControllerAnimated(true)
    }
    
}
