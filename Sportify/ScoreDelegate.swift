//
//  ScoreDelegate.swift
//  Sportify
//
//  Created by Andrew Codispoti on 2015-06-22.
//  Copyright (c) 2015 Andrew Codispoti. All rights reserved.
//

import Foundation

protocol ScoreDelegate{
    func incrementScore(value:Int, homeTeam:Bool)
    func decrementScore(value:Int, homeTeam:Bool)
}