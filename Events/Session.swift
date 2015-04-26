//
//  Session.swift
//  Events
//
//  Created by Walter Martin Vargas-Pena on 4/20/15.
//  Copyright (c) 2015 Epiphany Apps. All rights reserved.
//

import Foundation
import CoreData

class Session: ParseObject {

    @NSManaged var endDate: NSDate
    @NSManaged var sessionDescription: String
    @NSManaged var startDate: NSDate
    @NSManaged var title: String

}
