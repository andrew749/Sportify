//
//  Sport.swift
//  Sportify
//
//  Created by Andrew Codispoti on 2015-06-04.
//  Copyright (c) 2015 Andrew Codispoti. All rights reserved.
//

import Foundation
class Sport{
    var team1:Team
    var team2:Team
    init(){
        self.team1=Team()
        self.team2=Team()
    }
    func incrementScore(team:Team){
        team.incrementScore(1)
    }
}