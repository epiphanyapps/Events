//
//  User.h
//  Events
//
//  Created by Walter M Vargas-Pena on 2/6/15.
//  Copyright (c) 2015 Epiphany Apps. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Object.h"


@interface User : Object

@property (nonatomic, retain) NSString * firstName;
@property (nonatomic, retain) NSString * lastName;
@property (nonatomic, retain) NSNumber * emailVerified;
@property (nonatomic, retain) NSString * email;
@property (nonatomic, retain) NSString * userName;
@property (nonatomic, retain) NSNumber * authenticated;

@end
