//
//  Team.swift
//  Sportify
//
//  Created by Andrew Codispoti on 2015-06-04.
//  Copyright (c) 2015 Andrew Codispoti. All rights reserved.
//

import Foundation

class Team{
    var score:Int!
    init(){
        self.score=0
    }
    func incrementScore(amount:Int){
        self.score!+=amount
    }
}