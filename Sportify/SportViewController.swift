//
//  SportViewController.swift
//  Sportify
//
//  Created by Andrew Codispoti on 2015-06-04.
//  Copyright (c) 2015 Andrew Codispoti. All rights reserved.
//

import UIKit

class SportViewController:UIViewController{
    var sport:SPORT_TYPE?;
    var sportName:String?
    var pointLimit:Int?
    var timeLimit:NSDate?
    override func viewDidLoad() {
        self.title=sportName
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}