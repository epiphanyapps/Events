//
//  Resource.swift
//  Events
//
//  Created by Walter Martin Vargas-Pena on 4/20/15.
//  Copyright (c) 2015 Epiphany Apps. All rights reserved.
//

import Foundation
import CoreData

class Resource: ParseObject {

    @NSManaged var data: NSData
    @NSManaged var resourceDescription: String
    @NSManaged var title: String

}
