//
//  DataMigrator.m
//  Events
//
//  Created by Walter M Vargas-Pena on 2/6/15.
//  Copyright (c) 2015 Epiphany Apps. All rights reserved.
//

#import "DataMigrator.h"
#import <NSDate-Utilities.h>
#import <CoreData+MagicalRecord.h>
#import "Session.h"
#import "Resource.h"

@implementation DataMigrator

+ (void)populateEventsFromFile:(NSString *)path {
    
    [MagicalRecord saveWithBlock:^(NSManagedObjectContext *localContext) {
        
        Session *session = [Session MR_createEntityInContext:localContext];
        session.title = @"iOS Development";
        session.createdAt = [NSDate dateYesterday];
        session.updatedAt = [NSDate date];
        session.sessionDescription = @"Learning iOS Development";
        session.startDate = [NSDate dateWithDaysFromNow:5];
        session.endDate = [NSDate dateWithDaysFromNow:6];
        
        NSString *resourcePath = [[NSBundle mainBundle] pathForResource:@"NSHipster - Obscure Topics in Cocoa & Objective C"
                                                                 ofType:@"pdf"];
        NSData *data = [NSData dataWithContentsOfFile:resourcePath];
        Resource *pdfResource = [Resource MR_createEntityInContext:localContext];
        pdfResource.data = data;
        pdfResource.title = @"NSHipster - Obscure Topics in Cocoa & Objective C";
        pdfResource.resourceDescription = @"One of the best books about iOS Dev!";
        if (!pdfResource.data) {
            
        }
    } completion:^(BOOL contextDidSave, NSError *error) {
        //
    }];
}
@end
