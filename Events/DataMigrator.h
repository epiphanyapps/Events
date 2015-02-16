//
//  DataMigrator.h
//  Events
//
//  Created by Walter M Vargas-Pena on 2/6/15.
//  Copyright (c) 2015 Epiphany Apps. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface DataMigrator : NSObject

+ (void)populateEventsFromFile:(NSString *)path;

@end
