//
//  Soccer.swift
//  Sportify
//
//  Created by Andrew Codispoti on 2015-06-04.
//  Copyright (c) 2015 Andrew Codispoti. All rights reserved.
//

import Foundation

class Soccer: Sport {
    override init(){
        super.init()
        amount=1
    }
    func goal(homeTeam:Bool){
        if homeTeam{
            self.incrementScore(self.homeTeam)
        }
        else{
            self.incrementScore(self.awayTeam)
        }
    }
    func takeAwayGoal(homeTeam:Bool){
        if homeTeam{
            self.decrementScore(self.homeTeam)
        }else{
            self.decrementScore(self.awayTeam)
        }
    }
}