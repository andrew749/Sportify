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
    
    override func viewDidAppear(animated: Bool) {
        games = opponent!.valueForKey("games") as! NSMutableSet
    }
    var games:NSMutableSet = NSMutableSet()
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let row = indexPath.row
        var cell:AnyObject?
        if row == 0{
            cell = tableView.dequeueReusableCellWithIdentifier("headingCell")
            let label = cell?.viewWithTag(1)! as! UILabel
            label.text = opponent?.valueForKey("name") as? String
            let imageView = cell?.viewWithTag(2) as! UIImageView
            if let logoData = opponent?.valueForKey("logo") as? NSData{
                if let logo = UIImage(data: logoData){
                    imageView.image = logo
                }
            }
        }else if row == 1{
            cell = tableView.dequeueReusableCellWithIdentifier("chartCell")
            let view = cell?.viewWithTag(1)
            view?.backgroundColor = UIColor.redColor()
        }else if row == games.count + 2{
            cell = tableView.dequeueReusableCellWithIdentifier("newCell")
        }else {
            cell = tableView.dequeueReusableCellWithIdentifier("defaultCell")
            if let games = opponent?.valueForKey("games") as? NSSet{
                let againstLabel = cell?.viewWithTag(1) as? UILabel
//                againstLabel?.text = (games.allObjects[indexPath.row-2] as? NSManagedObject)?.valueForKey("scoreAgainst")
                againstLabel?.text = "please"
                let forLabel = cell?.viewWithTag(2) as? UILabel
//                forLabel?.text =  (games.allObjects[indexPath.row-2] as? NSManagedObject)?.valueForKey("scoreFor")
                forLabel?.text = "Why"
            }
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
        let delegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = delegate.managedObjectContext!
        let entity = NSEntityDescription.entityForName("Game", inManagedObjectContext: managedContext)
        let game =  NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedContext)
        game.setValue(opponentScore, forKey: "scoreAgainst")
        game.setValue(playerScore, forKey: "scoreFor")
        let newSet = opponent?.valueForKey("games") as! NSMutableSet
        newSet.addObject(game)
        opponent?.setValue(newSet, forKey: "games")
        managedContext.save(nil)
        games = newSet
        tableView.reloadData()
        
    }
    
}