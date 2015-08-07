//
//  Opponent.swift
//  Sportify
//
//  Created by Andrew Codispoti on 2015-08-06.
//  Copyright (c) 2015 Andrew Codispoti. All rights reserved.
//
//  A class to save and load data which also represents a team.

import Foundation

class Opponent{
//    Team details
    var name:String
    var logo:UIImage?
//    record details
    var record:(wins:Int, losses:Int, ties:Int)?
    var detailedRecord:[(scoreFor:Int, scoreAgainst:Int)]?
    
    init(name:String, logo:UIImage?){
        self.name = name
        self.logo = logo
    }
    
    convenience init(name:String){
        self.init(name: name, logo: nil)
    }
}