//
//  User.h
//  Events
//
//  Created by Walter Martin Vargas-Pena on 3/29/15.
//  Copyright (c) 2015 Epiphany Apps. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Object.h"


@interface User : Object

@property (nonatomic, retain) NSNumber * authenticated;
@property (nonatomic, retain) NSNumber * emailVerified;
@property (nonatomic, retain) NSString * cell;
@property (nonatomic, retain) NSDate * dob;
@property (nonatomic, retain) NSString * email;
@property (nonatomic, retain) NSString * firstName;
@property (nonatomic, retain) NSString * gender;
@property (nonatomic, retain) NSString * largePickLink;
@property (nonatomic, retain) NSString * lastName;
@property (nonatomic, retain) NSString * md5;
@property (nonatomic, retain) NSString * mediumPicLink;
@property (nonatomic, retain) NSString * phone;
@property (nonatomic, retain) NSString * seed;
@property (nonatomic, retain) NSString * sha1;
@property (nonatomic, retain) NSString * sha256;
@property (nonatomic, retain) NSString * snn;
@property (nonatomic, retain) NSString * thumbnailPicLink;
@property (nonatomic, retain) NSString * userName;

@end
