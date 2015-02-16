//
//  Session+Importing.h
//  Events
//
//  Created by Walter M Vargas-Pena on 2/6/15.
//  Copyright (c) 2015 Epiphany Apps. All rights reserved.
//

#import "Session.h"

NSString * const sessionClassName = @"Session";

NSString * const sessionTitleKey = @"title";
NSString * const sessionCreatedAtKey = @"createdAt";
NSString * const sessionUpdatedAtKey = @"updatedAt";
NSString * const sessionDescriptionKey = @"description";
NSString * const sessionStartDatetKey = @"startDate";
NSString * const sessionEndDateKey = @"endDate";

@interface Session (Importing)

+ (Session *)sessionWithDict:(NSDictionary *)sessionDict;

@end
