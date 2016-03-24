//
//  AddTaskViewController.swift
//  Taskit
//
//  Created by Roy Montoya on 3/21/16.
//  Copyright © 2016 Roy Montoya. All rights reserved.
//

import UIKit

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
        let task = TaskModel(task: taskTextField.text!, subTask: subTaskTextField.text!, date: dueDatePicker.date, completed: false)
        mainVC.baseArray[0].append(task)
        dismissViewControllerAnimated(true, completion: nil)
    }

}
