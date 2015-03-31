//
//  Session.h
//  Events
//
//  Created by Walter M Vargas-Pena on 2/6/15.
//  Copyright (c) 2015 Epiphany Apps. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "ParseObject.h"


@interface Session : ParseObject

@property (nonatomic, retain) NSDate * endDate;
@property (nonatomic, retain) NSString * sessionDescription;
@property (nonatomic, retain) NSDate * startDate;
@property (nonatomic, retain) NSString * title;

@end
