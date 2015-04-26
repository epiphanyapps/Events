//
//  ParseObject.swift
//  Events
//
//  Created by Walter Martin Vargas-Pena on 4/25/15.
//  Copyright (c) 2015 Epiphany Apps. All rights reserved.
//

import Foundation
import CoreData

class ParseObject: NSManagedObject {
    
    @NSManaged var updatedAt: NSDate
    @NSManaged var createdAt: NSDate
    @NSManaged var parseObjectId: String

    
    
}