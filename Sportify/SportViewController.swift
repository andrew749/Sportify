//
//  SportViewController.swift
//  Sportify
//
//  Created by Andrew Codispoti on 2015-06-04.
//  Copyright (c) 2015 Andrew Codispoti. All rights reserved.
//

import UIKit

class SportViewController:UIViewController{
    @IBOutlet weak var awayScore: UILabel!
    @IBOutlet weak var homeScore: UILabel!
    var sport:SPORT_TYPE?;
    var sportName:String?
    @IBOutlet weak var timeLabel: UILabel!
    var pointLimit:Int?
    var timeLimit:(Int,Int,Int)=(0,0,0)
    override func viewDidLoad() {
        self.title=sportName
        var timeLimitString:(String,String,String)
        if(timeLimit.0<10){
            timeLimitString.0="0\(timeLimit.0)"
        }else{
            timeLimitString.0="\(timeLimit.0)"
        }
        if(timeLimit.1<10){
            timeLimitString.1="0\(timeLimit.1)"
        }else{
            timeLimitString.1="\(timeLimit.1)"
        }
        if(timeLimit.2<10){
            timeLimitString.2="0\(timeLimit.2)"
        }else{
            timeLimitString.2="\(timeLimit.2)"
        }
        self.timeLabel.text="\(timeLimitString.0):\(timeLimitString.1):\(timeLimitString.2)"

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}