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
    
    var data = [Opponent]()
    
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
        let fetchedResults = managedContext.executeFetchRequest(fetchRequest, error: nil)
        data = [Opponent]()
        if let results = fetchedResults{
            for result in results {
                if let tempResult = result as? Opponent{
                    data.append(tempResult)
                }
            }
        }
        tableView.reloadData()
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    func tableView(tableView: UITableView,
        cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
            var cell = tableView.dequeueReusableCellWithIdentifier("sportcell") as! UITableViewCell;
            let row = indexPath.row
            cell.textLabel?.text = data[row].name
            let imageView = cell.viewWithTag(3) as? UIImageView
            if let iv = imageView{
//                if let image = data[row].logo{
                    iv.image = UIImage(data: data[row].logo)
//                }
            }
            return cell
    }
    
    func tableView(tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int{
            return data.count
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
        }else if segue.identifier == "Team Detail View"{
            if let destination = segue.destinationViewController as? TeamViewController{
                destination.opponent = data[tableView.indexPathForSelectedRow()!.row]
            }
        }
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete{
            tableView.beginUpdates()
            deleteObjectAtIndex(indexPath.row)
            data.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Left)
            tableView.endUpdates()
        }
    }
    
    func sendData(teamName:String, teamLogo:UIImage?){
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext!
        let entity = NSEntityDescription.entityForName("Opponent", inManagedObjectContext: managedContext);
        let opponent = Opponent(entity: entity!, insertIntoManagedObjectContext: managedContext)
        opponent.name = teamName
        if let logo = teamLogo{
            opponent.logo = UIImageJPEGRepresentation(logo, 1)
        }
        managedContext.save(nil)
        data.append(opponent)
        tableView.reloadData()
    }

    func deleteObjectAtIndex(index:Int){
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext!

        managedContext.deleteObject(data[index])
        managedContext.save(nil)
    }
    
}

