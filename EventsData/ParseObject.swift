//
//  ParseObject.swift
//  Events
//
//  Created by Walter Martin Vargas-Pena on 4/26/15.
//  Copyright (c) 2015 Epiphany Apps. All rights reserved.
//

import Foundation
import CoreData

public class ParseObject: NSManagedObject {
    
    @NSManaged var createdAt: NSDate
    @NSManaged var parseObjectId: String
    @NSManaged var updatedAt: NSDate
    
}
