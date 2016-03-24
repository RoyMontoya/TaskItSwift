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
   
    
    var baseArray: [[TaskModel]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let date1 = Date.from(2014, month: 05, day: 20)
        let date2 = Date.from(2014, month: 03, day: 3)
        let date3 = Date.from(2014, month: 12, day: 13)
        
        // Do any additional setup after loading the view, typically from a nib.
        let task1 = TaskModel(task: "Study French", subTask: "Verbs", date: date1, completed: false)
        let task2 = TaskModel(task: "Eat Dinner", subTask: "Burgers", date: date2, completed: false)
        let taskArray = [task1, task2, TaskModel(task: "Gym", subTask: "Leg Day", date: date3, completed: false)]
        
        var completedArray = [TaskModel(task: "Code", subTask: "task Project", date: date2, completed: true)]
        
        baseArray = [taskArray, completedArray]
        
        self.tableView.reloadData()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showTaskDetail" {
            let detailVC: TaskDetialViewController = segue.destinationViewController as! TaskDetialViewController
            let indexPath = self.tableView.indexPathForSelectedRow      
            let thisTask = baseArray[indexPath!.section][indexPath!.row]
            detailVC.detailTaskModel = thisTask
            detailVC.MainVC = self
        }else if segue.identifier == "showTaskAdd" {
            let addTaskVC: AddTaskViewController = segue.destinationViewController as! AddTaskViewController
            addTaskVC.mainVC = self
            
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)

        
        baseArray[0] = baseArray[0].sort{
            (taskOne: TaskModel, taskTwo: TaskModel) -> Bool in
            return taskOne.date.timeIntervalSince1970 < taskTwo.date.timeIntervalSince1970
        }
        
        tableView.reloadData()
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return baseArray[section].count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let thisTask: TaskModel = baseArray[indexPath.section][indexPath.row]
        let cell: TaskCell = tableView.dequeueReusableCellWithIdentifier("myCell") as! TaskCell
        
        cell.taskLabel.text = thisTask.task
        cell.descriptionLabel.text = thisTask.subTask
        cell.dateLabel.text = Date.toString(thisTask.date)
        
        return cell
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return baseArray.count
    }

    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
            tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    
    @IBAction func addButtonTapped(sender: UIBarButtonItem) {
        self.performSegueWithIdentifier("showTaskAdd", sender: self)
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 25
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if(section == 0) {
         return "To do"
        }else{
            return "Completed"
        }
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        let thisTask = baseArray[indexPath.section][indexPath.row]
        
        if indexPath.section == 0 {
            let newTask = TaskModel(task: thisTask.task, subTask: thisTask.subTask, date: thisTask.date, completed: true)
            baseArray[1].append(newTask)
        }else{
            let newTask = TaskModel(task: thisTask.task, subTask: thisTask.subTask, date: thisTask.date, completed: false)
            baseArray[0].append(newTask)
        }
        baseArray[indexPath.section].removeAtIndex(indexPath.row)
        tableView.reloadData()
    }
    
   
}

