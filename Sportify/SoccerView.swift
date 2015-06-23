//
//  SoccerView.swift
//  Sportify
//
//  Created by Andrew Codispoti on 2015-06-08.
//  Copyright (c) 2015 Andrew Codispoti. All rights reserved.
//

import Foundation
import UIKit
class SoccerView:UIView {
    var team:Team!
    var goalButton:UIButton
    var minusButton:UIButton
    var delegate:ScoreDelegate?
    init(){
        goalButton=UIButton()
        minusButton=UIButton()
        super.init(frame: CGRect.zeroRect)
        goalButton.setTitle("Goal", forState: UIControlState.Normal)
        goalButton.addTarget(self, action: "goalClick", forControlEvents: UIControlEvents.TouchUpInside)
        minusButton.setTitle("-", forState: UIControlState.Normal)
        minusButton.addTarget(self, action: "minusClick", forControlEvents: UIControlEvents.TouchUpInside)
    }
    convenience init(inout team:Team){
        self.init()
        self.team=team
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func minusClick(sender: AnyObject) {
        if let s=delegate{
            
        }
    }
    func goalClick(sender: AnyObject) {
        if let s=delegate{
            
        }
    }
}