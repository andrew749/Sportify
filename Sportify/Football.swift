//
//  Football.swift
//  Sportify
//
//  Created by Andrew Codispoti on 2015-06-08.
//  Copyright (c) 2015 Andrew Codispoti. All rights reserved.
//

import Foundation

class Football:Sport{
    override init(){
        super.init()
    }
    func touchdown(isHomeTeam:Bool){
        amount=6
        if isHomeTeam{
            self.incrementScore(self.homeTeam)
        }else{
            self.incrementScore(awayTeam)
        }
    }
    func fieldGoal(isHomeTeam:Bool, afterTouchDown:Bool){
        if afterTouchDown{
            amount=1
        }else{
            amount=3
        }
        if isHomeTeam{
            self.incrementScore(homeTeam)
        }else{
            self.incrementScore(awayTeam)
        }
    }
    func safety(isHomeTeam:Bool){
        amount=2
        if isHomeTeam{
            self.incrementScore(homeTeam)
        }else{
            self.incrementScore(awayTeam)
        }
    }
    func removePoint(isHomeTeam:Bool){
        if isHomeTeam{
            self.decrementScore(homeTeam)
        }else{
            self.decrementScore(awayTeam) 
        }
    }
}
