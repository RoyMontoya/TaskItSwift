//
//  ViewController.swift
//  Taskit
//
//  Created by Roy Montoya on 3/9/16.
//  Copyright © 2016 Roy Montoya. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, NSFetchedResultsControllerDelegate {
    @IBOutlet weak var tableView: UITableView!
    
    let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    var fetchResultController: NSFetchedResultsController = NSFetchedResultsController()
   

    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchResultController = getFetchResultsController()
        
        fetchResultController.delegate = self
       

        do {
         try fetchResultController.performFetch()
        }
        catch let error as NSError {
            print(error)
        }
        catch {
        }
  
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showTaskDetail" {
            let detailVC: TaskDetialViewController = segue.destinationViewController as! TaskDetialViewController
            let indexPath = self.tableView.indexPathForSelectedRow      
            let thisTask = fetchResultController.objectAtIndexPath(indexPath!) as! TaskModel
            detailVC.detailTaskModel = thisTask
         
        }else if segue.identifier == "showTaskAdd" {
            let addTaskVC: AddTaskViewController = segue.destinationViewController as! AddTaskViewController

            
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fetchResultController.sections![section].numberOfObjects
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
         let thisTask = fetchResultController.objectAtIndexPath(indexPath) as! TaskModel
        let cell: TaskCell = tableView.dequeueReusableCellWithIdentifier("myCell") as! TaskCell
        
        cell.taskLabel.text = thisTask.task
        cell.descriptionLabel.text = thisTask.subtask
        cell.dateLabel.text = Date.toString(thisTask.date!)
        
        return cell
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return fetchResultController.sections!.count
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
        let thisTask = fetchResultController.objectAtIndexPath(indexPath) as! TaskModel
        
        if indexPath.section == 0 {
            thisTask.completed = true
        }else{
           thisTask.completed = false
        }
        (UIApplication.sharedApplication().delegate as! AppDelegate).saveContext()
    }
    
    
    //NSfetchedResultControllerDelegate
    
    func controllerDidChangeContent(controller: NSFetchedResultsController) {
        tableView.reloadData()
    }
    
    
    func taskFetchRequest() -> NSFetchRequest {
        let fetchRequest = NSFetchRequest(entityName: "TaskModel")
        let sortDescripter = NSSortDescriptor(key: "date", ascending: true)
        let completedDescriptor = NSSortDescriptor(key: "completed", ascending: true)
        fetchRequest.sortDescriptors = [completedDescriptor, sortDescripter]
        
        return fetchRequest
    }
    
    
    func getFetchResultsController() -> NSFetchedResultsController {
        fetchResultController = NSFetchedResultsController(fetchRequest: taskFetchRequest(), managedObjectContext: managedObjectContext, sectionNameKeyPath: "completed", cacheName: nil)
        
        return fetchResultController
    }
    
   
}

