//
//  Game.swift
//  
//
//  Created by Andrew Codispoti on 2015-08-09.
//
//

import Foundation
import CoreData

class Game: NSManagedObject {

    @NSManaged var scoreAgainst: NSNumber
    @NSManaged var scoreFor: NSNumber
    @NSManaged var opponent: Opponent

}
