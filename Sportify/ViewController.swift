//
//  ViewController.swift
//  Sportify
//
//  Created by Andrew Codispoti on 2015-06-01.
//  Copyright (c) 2015 Andrew Codispoti. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, DataSendingDelegate {
    var opponents:[Opponent] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //setup table view to use this controller
        tableView.delegate=self
        tableView.dataSource=self

    }
    
    @IBOutlet weak var tableView: UITableView!
    
    func tableView(tableView: UITableView,
        cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
            var cell = tableView.dequeueReusableCellWithIdentifier("sportcell") as! UITableViewCell;
            let row = indexPath.row
            cell.textLabel?.text = opponents[row].name
            
            return cell
    }
    
    func tableView(tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int{
            return opponents.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier=="mainviewtransition"{
            if let destination=segue.destinationViewController as? SportsOptionPicker{
                if let index=tableView.indexPathForSelectedRow()?.row{
                    //TODO: Pass on the team data
                }
            }
        }
    }
    
    
    
    func sendData(teamName:String, teamLogo:UIImage?){
        
    }

    
}

