//
//  SportView.swift
//  Sportify
//
//  Created by Andrew Codispoti on 2015-06-24.
//  Copyright (c) 2015 Andrew Codispoti. All rights reserved.
//

import Foundation
import UIKit
class SportView:UIView{
    @IBAction func goalClick(sender: AnyObject) {
        if let d = delegate{
            d.incrementScore(1,homeTeam: isHomeView)
        }
    }
    @IBAction func minusClick(sender: AnyObject) {
        if let d = delegate{
            d.decrementScore(1,homeTeam: isHomeView)
        }
    }
    var delegate:ScoreDelegate?
    var isHomeView:Bool=false
}