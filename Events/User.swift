//
//  User.swift
//  Events
//
//  Created by Walter Martin Vargas-Pena on 4/20/15.
//  Copyright (c) 2015 Epiphany Apps. All rights reserved.
//

import Foundation
import CoreData

class User: ParseObject {

    @NSManaged var authenticated: NSNumber
    @NSManaged var cell: String
    @NSManaged var dob: NSDate
    @NSManaged var email: String
    @NSManaged var emailVerified: NSNumber
    @NSManaged var firstName: String
    @NSManaged var gender: String
    @NSManaged var largePickLink: String
    @NSManaged var lastName: String
    @NSManaged var md5: String
    @NSManaged var mediumPicLink: String
    @NSManaged var phone: String
    @NSManaged var seed: String
    @NSManaged var sha1: String
    @NSManaged var sha256: String
    @NSManaged var snn: String
    @NSManaged var thumbnailPicLink: String
    @NSManaged var userName: String

}
