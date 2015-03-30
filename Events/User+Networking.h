//
//  User+Networking.h
//  Mobile-Template-iOS
//
//  Created by Walter M Vargas-Pena on 1/10/15.
//  Copyright (c) 2015 Epiphany Apps. All rights reserved.
//

#import "User.h"

typedef NS_ENUM(NSUInteger, UserAttributeType) {
    UserAttributeTypeFirstName,
    UserAttributeTypeLastName,
    UserAttributeTypeDOB,
    UserAttributeTypeGender,
    UserAttributeTypeUserName,
    UserAttributeTypeEmail,
    UserAttributeTypeCount
};

@interface User (Networking)

+ (NSURLSessionDataTask *)getRandomUsersWithNumber:(NSNumber *)number
                                         withBlock:(void (^)(NSError *error))block;

+ (NSString *)titleForType:(UserAttributeType)type;

@end
