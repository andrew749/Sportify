//
//  Sport.swift
//  Sportify
//
//  Created by Andrew Codispoti on 2015-06-04.
//  Copyright (c) 2015 Andrew Codispoti. All rights reserved.
//
//  A class to represent a game being played.

import Foundation
class Game{
    var homeTeam:Team
    var awayTeam:Team
    var amount=1
    init(){
        self.homeTeam=Team()
        self.awayTeam=Team()
    }
    func incrementScore(team:Team){
        team.incrementScore(amount)
    }
    func decrementScore(team:Team){
        team.decrementScore(amount)
    }
}