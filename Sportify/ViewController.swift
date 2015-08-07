//
//  ViewController.swift
//  Sportify
//
//  Created by Andrew Codispoti on 2015-06-01.
//  Copyright (c) 2015 Andrew Codispoti. All rights reserved.
//

import UIKit
import CoreData
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, DataSendingDelegate {
//    var opponents:[Opponent] = []
    
    var test = [NSManagedObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //setup table view to use this controller
        tableView.delegate=self
        tableView.dataSource=self

    }
    
    override func viewWillAppear(animated: Bool) {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext!
        let fetchRequest =  NSFetchRequest(entityName: "Opponent")
        let fetchedResults = managedContext.executeFetchRequest(fetchRequest, error: nil) as? [NSManagedObject]
        if let results = fetchedResults {
            test = results
        }
        tableView.reloadData()
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    func tableView(tableView: UITableView,
        cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
            var cell = tableView.dequeueReusableCellWithIdentifier("sportcell") as! UITableViewCell;
            let row = indexPath.row
            cell.textLabel?.text = test[row].valueForKey("name") as? String
            
            return cell
    }
    
    func tableView(tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int{
            return test.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier=="Create Opponent"{
            if let destination=segue.destinationViewController as? SportsOptionPicker{
                    //TODO: Pass on the team data
                    destination.dataDelegate = self
            }
        }
    }
    
    
    
    func sendData(teamName:String, teamLogo:UIImage?){
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext!
        let entity = NSEntityDescription.entityForName("Opponent", inManagedObjectContext: managedContext)
        let opponent =  NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedContext)
        opponent.setValue(teamName, forKey: "name")
        managedContext.save(nil)
        test.append(opponent)
        tableView.reloadData()
    }

    
}

