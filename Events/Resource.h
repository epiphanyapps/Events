//
//  Resource.h
//  Events
//
//  Created by Walter M Vargas-Pena on 2/6/15.
//  Copyright (c) 2015 Epiphany Apps. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "ParseObject.h"

@interface Resource : ParseObject

@property (nonatomic, retain) NSData * data;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSString * resourceDescription;

@end
