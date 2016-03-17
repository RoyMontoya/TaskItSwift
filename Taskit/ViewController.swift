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
        
        let date1 = Date.from(2014, month: 05, day: 20)
        let date2 = Date.from(2014, month: 03, day: 3)
        let date3 = Date.from(2014, month: 12, day: 13)
        
        // Do any additional setup after loading the view, typically from a nib.
        let task1 = TaskModel(task: "Study French", subTask: "Verbs", date: date1)
        let task2 = TaskModel(task: "Eat Dinner", subTask: "Burgers", date: date2)
        taskArray = [task1, task2, TaskModel(task: "Gym", subTask: "Leg Day", date: date3)]
        
        self.tableView.reloadData()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showTaskDetail" {
            let detailVC: TaskDetialViewController = segue.destinationViewController as! TaskDetialViewController
            let indexPath = self.tableView.indexPathForSelectedRow!
            let thisTask = taskArray[indexPath.row]
            detailVC.detailTaskModel = thisTask
        } 
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
        let cell: TaskCell = tableView.dequeueReusableCellWithIdentifier("myCell") as! TaskCell
        
        cell.taskLabel.text = thisTask.task
        cell.descriptionLabel.text = thisTask.subTask
        cell.dateLabel.text = Date.toString(thisTask.date)
        
        return cell
    }

    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        
        performSegueWithIdentifier("showTaskDetail", sender: self)
    }
    
    
    
    
}

