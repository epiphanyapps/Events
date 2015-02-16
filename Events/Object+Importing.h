//
//  Object+Importing.h
//  Events
//
//  Created by Walter M Vargas-Pena on 2/6/15.
//  Copyright (c) 2015 Epiphany Apps. All rights reserved.
//

#import "Object.h"

NSString * const objectClassName = @"Object";

NSString * const createdAtKey = @"createdAt";
NSString * const updatedAtKey = @"updatedAt";
NSString * const objectIdKey = @"objectID";

@interface Object (Importing)

- (void)updateObjectWithDict:(NSDictionary *)objectDict;

@end
