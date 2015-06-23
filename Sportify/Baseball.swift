//
//  Baseball.swift
//  Sportify
//
//  Created by Andrew Codispoti on 2015-06-04.
//  Copyright (c) 2015 Andrew Codispoti. All rights reserved.
//

import Foundation

class Baseball:Sport{
    
    override init(){
        super.init()
        amount=1
    }
    func run(isHomeTeam:Bool){
        if isHomeTeam{
            self.incrementScore(homeTeam)
        }
        else{
            self.incrementScore(awayTeam)
        }
    }
    func takeAwayRun(isHomeTeam:Bool){
        if isHomeTeam{
            self.decrementScore(homeTeam)
        }else{
            self.decrementScore(awayTeam)
        }
    }
}