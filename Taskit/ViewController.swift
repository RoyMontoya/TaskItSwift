//
//  ViewController.swift
//  Taskit
//
//  Created by Roy Montoya on 3/9/16.
//  Copyright © 2016 Roy Montoya. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    var taskArray: [TaskModel] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let task1 = TaskModel(task: "Study French", subTask: "Verbs", date: "01/14/2014")
        let task2 = TaskModel(task: "Eat Dinner", subTask: "Burgers", date: "01/14/2014")
        taskArray = [task1, task2, TaskModel(task: "Gym", subTask: "Leg Day", date: "01/14/2014")]
        
        self.tableView.reloadData()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.taskArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let thisTask: TaskModel = taskArray[indexPath.row]
        var cell: TaskCell = tableView.dequeueReusableCellWithIdentifier("myCell") as! TaskCell
        
        cell.taskLabel.text = thisTask.task
        cell.descriptionLabel.text = thisTask.subTask
        cell.dateLabel.text = thisTask.date
        
        return cell
    }

    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        
        performSegueWithIdentifier("showTaskDetail", sender: self)
    }
    
    
    
    
}

