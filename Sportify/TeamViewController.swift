//
//  TeamViewController.swift
//  Sportify
//
//  Created by Andrew Codispoti on 2015-08-06.
//  Copyright (c) 2015 Andrew Codispoti. All rights reserved.
//

import Foundation
import CoreData
class TeamViewController:UIViewController, UITableViewDataSource, UITableViewDelegate, GameDelegate, JBChartViewDataSource, JBChartViewDelegate{
    var opponent :Opponent?
    var chartView:JBChartView?
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        tableView.dataSource = self
        tableView.delegate = self
        games = opponent!.games
        chartView = JBBarChartView()
        chartView!.dataSource = self
        chartView!.delegate = self
        
    }
    
    override func viewDidAppear(animated: Bool) {
        games = opponent!.games
        chartView?.reloadData()
    }
    
    var games:NSSet = NSSet()
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let row = indexPath.row
        var cell:AnyObject?
        if row == 0{
            cell = tableView.dequeueReusableCellWithIdentifier("headingCell")
            let label = cell?.viewWithTag(1)! as! UILabel
            let imageView = cell?.viewWithTag(2) as! UIImageView

            label.text = opponent?.name
            if let logoData = opponent?.logo{
                if let logo = UIImage(data: logoData){
                    imageView.image = logo
                }
            }
            
        }else if row == 1{
            
            cell = tableView.dequeueReusableCellWithIdentifier("chartCell")
            let viewholder = cell?.viewWithTag(1)
            viewholder?.addSubview(chartView!)
            chartView?.autoresizingMask = UIViewAutoresizing.FlexibleWidth | UIViewAutoresizing.FlexibleLeftMargin
            chartView?.frame = viewholder!.bounds
            chartView?.reloadData()
            
            
        }else if row == games.count + 2{
            
            cell = tableView.dequeueReusableCellWithIdentifier("newCell")
            
        }else {
            
            cell = tableView.dequeueReusableCellWithIdentifier("defaultCell")
            if let tempGames = opponent?.games{
                let againstLabel = cell?.viewWithTag(1) as! UILabel
                let forLabel = cell?.viewWithTag(2) as! UILabel
                
                if let againstScore = (tempGames.allObjects[indexPath.row-2] as? Game)?.scoreAgainst, let forScore = (tempGames.allObjects[indexPath.row-2] as? Game)?.scoreFor{
                    againstLabel.text = String(stringInterpolationSegment: againstScore)
                    forLabel.text = String(stringInterpolationSegment: forScore)
                }

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
            return 300
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
        let game =  Game(entity: entity!, insertIntoManagedObjectContext: managedContext)
        game.scoreAgainst = opponentScore
        game.scoreFor = playerScore
        var newSet = opponent?.games as! NSMutableSet
        newSet.addObject(game)
        opponent?.games = newSet
        game.opponent = opponent!
        var error:NSError? =  nil
        managedContext.save(&error)
        games = newSet
        tableView.reloadData()
        
    }
//    MARK: ChartViewDelegate and DataSource

    func numberOfBarsInBarChartView(barChartView:JBBarChartView)-> UInt32
    {
        return UInt32(games.count)
    }
    
    func barChartView(barChartView: JBBarChartView, heightForBarViewAtIndex index: UInt) -> CGFloat {
        let game = games.allObjects[Int(index)] as! Game
        
        let scoreDifference:CGFloat = CGFloat(game.scoreFor.intValue - game.scoreAgainst.intValue)
        return abs(scoreDifference)
    }
    
    func barChartView(barChartView: JBBarChartView, colorForBarViewAtIndex index:UInt) -> UIColor{
        let game = games.allObjects[Int(index)] as! Game

        let scoreDifference = game.scoreFor.intValue - game.scoreAgainst.intValue
        if (scoreDifference > 0){
            return UIColor.greenColor()
        }else if(scoreDifference < 0){
            return UIColor.redColor()
        }else{
            return UIColor.blueColor()
        }
    }
}