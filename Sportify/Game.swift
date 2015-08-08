//
//  Game.swift
//  Sportify
//
//  Created by Andrew Codispoti on 2015-08-07.
//  Copyright (c) 2015 Andrew Codispoti. All rights reserved.
//

import Foundation
import CoreData

class Game: NSManagedObject {

    @NSManaged var scoreAgainst: NSNumber
    @NSManaged var scoreFor: NSNumber
    @NSManaged var opponent: Opponent

}
