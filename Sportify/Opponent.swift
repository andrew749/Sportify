//
//  Opponent.swift
//  
//
//  Created by Andrew Codispoti on 2015-08-09.
//
//

import Foundation
import CoreData

class Opponent: NSManagedObject {

    @NSManaged var logo: NSData
    @NSManaged var name: String
    @NSManaged var games: NSSet

}
