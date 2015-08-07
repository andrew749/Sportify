//
//  TeamViewController.swift
//  Sportify
//
//  Created by Andrew Codispoti on 2015-08-06.
//  Copyright (c) 2015 Andrew Codispoti. All rights reserved.
//

import Foundation
import CoreData
class TeamViewController:UIViewController, UITableViewDataSource, UITableViewDelegate, GameDelegate{
    var opponent :NSManagedObject?
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    var games:[NSManagedObject] = []
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let row = indexPath.row
        var cell:AnyObject?
        if row == 0{
            cell = tableView.dequeueReusableCellWithIdentifier("headingCell")
            let label = cell?.viewWithTag(1)! as! UILabel
            label.text = opponent?.valueForKey("name") as? String
            
        }else if row == 1{
            cell = tableView.dequeueReusableCellWithIdentifier("chartCell")
            let view = cell?.viewWithTag(1)
            view?.backgroundColor = UIColor.redColor()
        }else if row == games.count + 2{
            cell = tableView.dequeueReusableCellWithIdentifier("newCell")
        }else {
            cell = tableView.dequeueReusableCellWithIdentifier("defaultCell")
        }
        return cell as! UITableViewCell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return games.count + 3
    }
    
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        switch indexPath.row{
        case 0:
            return 100
        case 1:
            return 200
        default:
            return 50
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "Game View"{
            if let destination = segue.destinationViewController as? SportViewController{
                destination.opponent = opponent
                destination.gameDelegate = self
            }
        }
    }
 
    func didFinishGame(playerScore:Int, opponentScore:Int){
        //TODO save score and update table view
        print("didreceive data")
    }
    
}