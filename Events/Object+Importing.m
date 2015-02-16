//
//  Object+Importing.m
//  Events
//
//  Created by Walter M Vargas-Pena on 2/6/15.
//  Copyright (c) 2015 Epiphany Apps. All rights reserved.
//

#import "Object+Importing.h"
#import <MagicalRecord.h>

@implementation Object (Importing)

static NSDateFormatter *dateFormatter = nil;

- (void)updateObjectWithDict:(NSDictionary *)objectDict {
    if (!dateFormatter) {
        dateFormatter = [[NSDateFormatter alloc] init];
        //set date format
    }
    self.createdAt = [dateFormatter dateFromString:[objectDict objectForKey:createdAtKey]];
    self.updatedAt = [dateFormatter dateFromString:[objectDict objectForKey:updatedAtKey]];
    self.parseObjectId = [objectDict objectForKey:objectIdKey];
}

@end
