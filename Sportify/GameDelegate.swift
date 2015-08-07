//
//  GameDelegate.swift
//  Sportify
//
//  Created by Andrew Codispoti on 2015-08-06.
//  Copyright (c) 2015 Andrew Codispoti. All rights reserved.
//

import Foundation

protocol GameDelegate{
    func didFinishGame(playerScore:Int, opponentScore:Int)
}