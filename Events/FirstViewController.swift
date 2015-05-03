//
//  FirstViewController.swift
//  Events
//
//  Created by Walter Martin Vargas-Pena on 4/26/15.
//  Copyright (c) 2015 Epiphany Apps. All rights reserved.
//

import UIKit
import CoreData
import EventsData

import JSQCoreDataKit

class FirstViewController: UIViewController {
    var stack: CoreDataStack?

    /*
    
    Here's a terrible, Obj-C-ish way to do things.
    
    extension NSManagedObject {
    
    class func entityName() -> String {
    let fullClassName = NSStringFromClass(object_getClass(self))
    let classNameComponents: [String] = split(fullClassName) { $0 == "." }
    return last(classNameComponents)!
    }
    
    convenience init(context: NSManagedObjectContext) {
    let entityDescription = NSEntityDescription.entityForName(self.dynamicType.entityName(), inManagedObjectContext: context)!
    self.init(entity: entityDescription, insertIntoManagedObjectContext: context)
    }
    }
    
    */
    
    
        override func viewDidLoad() {
            super.viewDidLoad()
            
            // Create model
            let model = CoreDataModel(name: EventsModelName, bundle: EventsModelBundle)
            
            // Create stack
            self.stack = CoreDataStack(model: model)
            
            if let context: NSManagedObjectContext = self.stack?.managedObjectContext {
                let walter: User = newFakeUser(context)
//                println(walter)
            }
            
            
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

