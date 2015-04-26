//
//  DataContext.swift
//  AlecrimCoreDataExample
//
//  Created by Vanderlei Martinelli on 2014-11-30.
//  Copyright (c) 2014 Alecrim. All rights reserved.
//

import Foundation
import AlecrimCoreData

let dataContext = DataContext()!

final class DataContext: AlecrimCoreData.Context {
    var parseObjects: AlecrimCoreData.Table<ParseObject> { return AlecrimCoreData.Table<ParseObject>(context: self) }
    var resources: AlecrimCoreData.Table<Resource> { return AlecrimCoreData.Table<Resource>(context: self) }
    var sessions: AlecrimCoreData.Table<Session> { return AlecrimCoreData.Table<Session>(context: self) }
    var events: AlecrimCoreData.Table<User> { return AlecrimCoreData.Table<User>(context: self) }
    
}