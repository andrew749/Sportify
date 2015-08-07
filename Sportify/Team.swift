//
//  Team.swift
//  Sportify
//
//  Created by Andrew Codispoti on 2015-06-04.
//  Copyright (c) 2015 Andrew Codispoti. All rights reserved.
//
//  A class to represent one of the teams playing a game.
//

import Foundation

class Team{
    var score:Int
    init(){
        self.score=0
    }
    func incrementScore(amount:Int){
        self.score+=amount
    }
    func decrementScore(amount:Int){
        self.score-=amount
    }
}