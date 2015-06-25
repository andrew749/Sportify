//
//  SoccerView.swift
//  Sportify
//
//  Created by Andrew Codispoti on 2015-06-08.
//  Copyright (c) 2015 Andrew Codispoti. All rights reserved.
//

import Foundation
import UIKit
class SoccerView:SportView {
    var goalButton:UIButton
    var minusButton:UIButton
    var delegate:ScoreDelegate
    var isHomeView:Bool=false
    init(delegate:ScoreDelegate){
        goalButton=UIButton()
        minusButton=UIButton()
        self.delegate=delegate
        super.init(frame: CGRect.zeroRect)
        goalButton.setTitle("Goal", forState: UIControlState.Normal)
        goalButton.addTarget(self, action: "goalClick", forControlEvents: UIControlEvents.TouchUpInside)
        minusButton.setTitle("-", forState: UIControlState.Normal)
        minusButton.addTarget(self, action: "minusClick", forControlEvents: UIControlEvents.TouchUpInside)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func minusClick(sender: AnyObject) {
        delegate.decrementScore(1,homeTeam: isHomeView)
    }
    func goalClick(sender: AnyObject) {
       delegate.incrementScore(1,homeTeam: isHomeView)
    }
}