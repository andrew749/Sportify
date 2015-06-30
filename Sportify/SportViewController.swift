//
//  SportViewController.swift
//  Sportify
//
//  Created by Andrew Codispoti on 2015-06-04.
//  Copyright (c) 2015 Andrew Codispoti. All rights reserved.
//

import UIKit

class SportViewController:UIViewController,ScoreDelegate{
    @IBOutlet weak var awayScore: UILabel!
    @IBOutlet weak var homeScore: UILabel!
    @IBOutlet weak var awayTeamLabel: UILabel!
    @IBOutlet weak var homeTeamLabel: UILabel!
    @IBOutlet weak var awayCounter: UIView!
    @IBOutlet weak var homeCounter: UIView!
    var awayCounterView:SportView?,homeCounterView:SportView?;
    var awayTeamName:String?
    var homeTeamName:String?
    var sport:SPORT_TYPE?;
    var sportName:String?
    var sportCounter:UIView?
    @IBOutlet weak var timeLabel: UILabel!
    var pointLimit:Int?
    var timeLimit:(Int,Int,Int)=(0,0,0)
    var game:Sport
    var x:MZTimerLabel?
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        switch(sport!){
        case SPORT_TYPE.SOCCER:
            game=Soccer()
        default:
            game=Soccer()
        }
        x=MZTimerLabel(label: self.timeLabel, andTimerType: MZTimerLabelTypeTimer)
        x!.timeFormat="HH:mm:ss"
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    @IBAction func startTimer(sender: AnyObject) {
        x?.start()
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
        switch(sport!){
        case SPORT_TYPE.SOCCER:
            homeCounterView=NSBundle.mainBundle().loadNibNamed("SoccerView", owner: self, options: nil)[0] as? SportView
            awayCounterView=NSBundle.mainBundle().loadNibNamed("SoccerView", owner: self, options: nil)[0] as? SportView
            homeCounterView!.isHomeView=true
            awayCounterView!.isHomeView=false
            homeCounterView?.delegate=self
            awayCounterView?.delegate=self
        default:
            homeCounterView=NSBundle.mainBundle().loadNibNamed("SoccerView", owner: self, options: nil)[0] as? SportView
            awayCounterView=NSBundle.mainBundle().loadNibNamed("SoccerView", owner: self, options: nil)[0] as? SportView
            homeCounterView!.isHomeView=true
            awayCounterView!.isHomeView=false
            homeCounterView?.delegate=self
            awayCounterView?.delegate=self
        }
        homeCounter.addSubview(homeCounterView!)
        awayCounter.addSubview(awayCounterView!)
    }
    required init(coder aDecoder: NSCoder) {
        if let s = sport{
        switch(sport!){
        case SPORT_TYPE.SOCCER:
            game=Soccer()
        default:
            game=Soccer()
        }
        }else{
            sport=SPORT_TYPE.SOCCER
            game=Soccer()
        }
        x=MZTimerLabel(label: self.timeLabel, andTimerType: MZTimerLabelTypeStopWatch)
        x!.timeFormat="HH:mm:ss"
        super.init(coder: aDecoder)
    }
    override func viewDidLoad() {
        self.title=sportName
//        var timeLimitString:(String,String,String)
//        if(timeLimit.0<10){
//            timeLimitString.0="0\(timeLimit.0)"
//        }else{
//            timeLimitString.0="\(timeLimit.0)"
//        }
//        if(timeLimit.1<10){
//            timeLimitString.1="0\(timeLimit.1)"
//        }else{
//            timeLimitString.1="\(timeLimit.1)"
//        }
//        if(timeLimit.2<10){
//            timeLimitString.2="0\(timeLimit.2)"
//        }else{
//            timeLimitString.2="\(timeLimit.2)"
//        }
        let d=Double(timeLimit.0*3600)+Double(timeLimit.1*60)+Double(timeLimit.0)
        x!.setStopWatchTime(d)
//        self.timeLabel.text="\(timeLimitString.0):\(timeLimitString.1):\(timeLimitString.2)"
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