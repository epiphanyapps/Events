//
//  Created by Jesse Squires
//  http://www.jessesquires.com
//
//
//  Documentation
//  http://www.jessesquires.com/JSQCoreDataKit
//
//
//  GitHub
//  https://github.com/jessesquires/JSQCoreDataKit
//
//
//  License
//  Copyright (c) 2015 Jesse Squires
//  Released under an MIT license: http://opensource.org/licenses/MIT
//

import Foundation
import CoreData


public let EventsModelName = "Events"

public let EventsModelBundle = NSBundle(identifier: "com.epiphanyapps.EventsData")!


public struct EventsModelEntity {
    public static let User = "User"
}


public func newFakeUser(context: NSManagedObjectContext,
    name: String = "Walter",
    last: String = "Vargas-Pena",
    dob: NSDate = NSDate(),
    email: String = "walter.vargaspena@gmail.com",
    sha256: String = NSUUID().UUIDString) -> User {
        
        return User(context: context, firstName: name, lastName: last, dob: dob, email: email, sha256: sha256)
}


