//
//  User+Networking.m
//  Mobile-Template-iOS
//
//  Created by Walter M Vargas-Pena on 1/10/15.
//  Copyright (c) 2015 Epiphany Apps. All rights reserved.
//

#import "User+Networking.h"
#import <CoreData+MagicalRecord.h>
#import "RESTAPIClient.h"

@implementation User (Networking)

/*
{
    "results" : [
                 {
                     "seed" : "90cc78a30ebab975",
                     "user" : {
                         "name" : {
                             "title" : "mr",
                             "last" : "foster",
                             "first" : "kent"
                         },
                         "cell" : "(673)-733-7151",
                         "phone" : "(774)-926-8410",
                         "version" : "0.4.1",
                         "SSN" : "549-46-4754",
                         "registered" : "1030898502",
                         "dob" : "443514182",
                         "sha1" : "0d379d64fa5ada9081bc3ba849332bbd71a159ff",
                         "picture" : {
                             "medium" : "http://api.randomuser.me/portraits/med/men/87.jpg",
                             "thumbnail" : "http://api.randomuser.me/portraits/thumb/men/87.jpg",
                             "large" : "http://api.randomuser.me/portraits/men/87.jpg"
                         },
                         "location" : {
                             "street" : "9230 pockrus page rd",
                             "city" : "lewiston",
                             "zip" : "74480",
                             "state" : "michigan"
                         },
                         "password" : "pepe",
                         "salt" : "htAJdvh2",
                         "username" : "purplefrog796",
                         "md5" : "03f0a1a1b30295e4a2e3925dd3621159",
                         "email" : "kent.foster44@example.com",
                         "gender" : "male",
                         "sha256" : "e0b1 9525f194d79a8bbf30e49f20e8d4819054285a57cb4c9d86c8550b230a54"
                     }
                 }
                 ]
}
*/

+ (NSURLSessionDataTask *)getRandomUsersWithNumber:(NSNumber *)number
                                         withBlock:(void (^)(NSError *error))block {
    NSString *key = @"XZ40-B0QN-8SEE-7X1O";
    NSString *url = [NSString stringWithFormat:@"http://api.randomuser.me/?results=%@&key=%@", number.stringValue, key];
    return [[RESTAPIClient sharedClient] GET:url parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        __block NSArray *results = responseObject[@"results"];
        [MagicalRecord saveWithBlock:^(NSManagedObjectContext *localContext) {
            [results enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
                NSDictionary *userDict = [obj objectForKey:@"user"];
                [User updateWithJSON:userDict
                           inContext:localContext];
            }];
        } completion:^(BOOL contextDidSave, NSError *error) {
            if (block) {
                block(error);
            }
        }];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        if (block) {
            block(error);
        }
    }];
}

+ (User *)updateWithJSON:(NSDictionary *)jsonDict inContext:(NSManagedObjectContext *)localContext {
    //we use SHA256 as a identifier
    NSString *sha256 = jsonDict[@"sha256"];
    
    User *localUser = [User MR_findFirstOrCreateByAttribute:@"sha256"
                                                  withValue:sha256
                                                  inContext:localContext];
    /*
     missing version,
     registered,
     password
     salt
     */
    
    localUser.firstName = [jsonDict valueForKeyPath:@"name.first"];
    localUser.lastName = [jsonDict valueForKeyPath:@"name.last"];
    localUser.sha256 = jsonDict[@"sha256"];
    localUser.snn = jsonDict[@"SSN"];
    localUser.cell = jsonDict[@"cell"];
    localUser.email = jsonDict[@"email"];
    localUser.gender = jsonDict[@"gender"];
    localUser.userName = jsonDict[@"username"];
    localUser.md5 = jsonDict[@"md5"];
    localUser.phone = jsonDict[@"phone"];
    localUser.largePickLink = [jsonDict valueForKeyPath:@"picture.large"];
    localUser.mediumPicLink = [jsonDict valueForKeyPath:@"picture.medium"];
    localUser.thumbnailPicLink = [jsonDict valueForKeyPath:@"picture.thumbnail"];
    localUser.cell = jsonDict[@"cell"];
    localUser.dob = [NSDate dateWithTimeIntervalSince1970:
                     [[jsonDict objectForKey:@"dob"] doubleValue]];
    return localUser;
}

+ (NSString *)titleForType:(UserAttributeType)type {
    switch (type) {
        case UserAttributeTypeFirstName: {
            return @"First Name";
        }
            break;
        case UserAttributeTypeLastName: {
            return @"Last Name";
        }
            break;
        case UserAttributeTypeDOB: {
            return @"Date of Birth";
        }
            break;
        case UserAttributeTypeGender: {
            return @"Gender";
        }
            break;
        case UserAttributeTypeUserName: {
            return @"Username";
        }
            break;
        case UserAttributeTypeEmail: {
            return @"Email";
        }
            break;
        default:
            return nil;
            break;
    }
}
@end
