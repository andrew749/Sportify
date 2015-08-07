//
//  SportViewController.swift
//  Sportify
//
//  Created by Andrew Codispoti on 2015-06-04.
//  Copyright (c) 2015 Andrew Codispoti. All rights reserved.
//

import UIKit

class SportViewController: UIViewController, ScoreDelegate{
//    Interface builder elements
    @IBOutlet weak var awayScore: UILabel!
    @IBOutlet weak var homeScore: UILabel!
    @IBOutlet weak var awayTeamLabel: UILabel!
    @IBOutlet weak var homeTeamLabel: UILabel!
    @IBOutlet weak var awayCounter: UIView!
    @IBOutlet weak var homeCounter: UIView!
    
    var awayCounterView:SportView?,homeCounterView:SportView?;
    var awayTeamName:String?
    var homeTeamName:String?
    var sportName:String?
    var sportCounter:UIView?
    @IBOutlet weak var timeLabel: UILabel!
    var pointLimit:Int?
    var timeLimit:(Int,Int,Int)=(0,0,0)
    var game:Sport?
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
        homeScore.text="\(game.homeTeam.score)"
        awayScore.text="\(game.awayTeam.score)"
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
  
        homeCounter.addSubview(homeCounterView!)
        awayCounter.addSubview(awayCounterView!)
        
        homeCounterView?.frame=homeCounter.bounds
        awayCounterView?.frame=awayCounter.bounds
    }

    override func viewDidLoad() {
        game=Soccer()
        timerLabel=MZTimerLabel(label: self.timeLabel, andTimerType: MZTimerLabelTypeTimer)
        timerLabel!.timeFormat="HH:mm:ss"
        self.title=sportName
        let d=Double(timeLimit.0*3600)+Double(timeLimit.1*60)+Double(timeLimit.0)
        timerLabel!.setStopWatchTime(d)
        if let s = self.homeTeamName{
            self.homeTeamLabel.text=s
        }
        if let s = self.awayTeamName{
            self.awayTeamLabel.text=s
        }
        self.createView()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}