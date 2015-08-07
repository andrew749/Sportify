//
//  SportViewController.swift
//  Sportify
//
//  Created by Andrew Codispoti on 2015-06-04.
//  Copyright (c) 2015 Andrew Codispoti. All rights reserved.
//

import UIKit
import CoreData
class SportViewController: UIViewController, ScoreDelegate{
//    Interface builder elements
    @IBOutlet weak var playerScore: UILabel!
    @IBOutlet weak var opponentScore: UILabel!
    @IBOutlet weak var opponentName: UILabel!
    @IBOutlet weak var playerCounter: UIView!
    @IBOutlet weak var opponentCounter: UIView!
    
    var awayCounterView:SportView?,homeCounterView:SportView?;

    var opponent:NSManagedObject?
    
    var sportCounter:UIView?
    
    @IBOutlet weak var timeLabel: UILabel!
    var game:Game = Game()
    var timerLabel:MZTimerLabel?
    @IBAction func startTimer(sender: AnyObject) {
        timerLabel?.start()
    }
    
    func incrementScore(value:Int, homeTeam:Bool){
        if homeTeam{
            game.incrementScore(game.homeTeam)
        }else{
            game.incrementScore(game.awayTeam)
        }
        updateScore()
    }
    func updateScore(){
        opponentScore.text="\(game.homeTeam.score)"
        playerScore.text="\(game.awayTeam.score)"
    }
    func decrementScore(value:Int, homeTeam:Bool){
        if homeTeam{
            if(game.homeTeam.score != 0){
                game.decrementScore(game.homeTeam)
            }
        }else{
            if(game.awayTeam.score != 0){
                game.decrementScore(game.awayTeam)
            }
        }
        updateScore()
    }
    func createView(){

        homeCounterView=NSBundle.mainBundle().loadNibNamed("SportView", owner: self, options: nil)[0] as? SportView
        awayCounterView=NSBundle.mainBundle().loadNibNamed("SportView", owner: self, options: nil)[0] as? SportView
        homeCounterView!.isHomeView=true
        awayCounterView!.isHomeView=false
        homeCounterView?.delegate=self
        awayCounterView?.delegate=self
  
        opponentCounter.addSubview(homeCounterView!)
        playerCounter.addSubview(awayCounterView!)
        
        homeCounterView?.frame=opponentCounter.bounds
        awayCounterView?.frame=playerCounter.bounds
    }

    override func viewDidLoad() {
        timerLabel=MZTimerLabel(label: self.timeLabel, andTimerType: MZTimerLabelTypeTimer)
        timerLabel!.timeFormat="HH:mm:ss"
        timerLabel!.setStopWatchTime(100)
        if let s = self.opponent?.valueForKey("name") as? String{
            self.opponentName.text=s
        }
       
        self.createView()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}