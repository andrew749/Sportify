//
//  Opponent.swift
//  Sportify
//
//  Created by Andrew Codispoti on 2015-08-07.
//  Copyright (c) 2015 Andrew Codispoti. All rights reserved.
//

import Foundation
import CoreData

class Opponent: NSManagedObject {

    @NSManaged var logo: NSData
    @NSManaged var name: String
    @NSManaged var games: NSSet

}
