//
//  RIData.m
//  WhosApp
//
//  Created by Ondrej Rafaj on 22/04/2014.
//  Copyright (c) 2014 Ridiculous Innovations. All rights reserved.
//

#import "RIData.h"
#import "RIUtilities.h"
#import "RIDownloads.h"
#import "RIEmployee.h"
#import "HTMLParser.h"


@implementation RIData


#pragma mark Loading employees

- (void)loadEmployees:(void (^)(NSArray *employees))successBlock {
    NSString *url = @"http://www.theappbusiness.com/our-team/";
    [self.utilities.downloads downloadDataUrlString:url withSuccessBlock:^(NSData *data) {
        NSError *error = nil;
        NSString *html = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        HTMLParser *parser = [[HTMLParser alloc] initWithString:html error:&error];
        
        if (error) {
            NSLog(@"Error: %@", error);
            if (successBlock) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    successBlock(nil);
                });
            }
            return;
        }
        HTMLNode *bodyNode = [parser body];
        NSArray *rows = [bodyNode findChildrenOfClass:@"col col2"];
        
        NSMutableArray *employees = [NSMutableArray array];
        
        for (HTMLNode *row in rows) {
            // Employee name
            NSString *name = [[row findChildTag:@"h3"] contents];
            if (name) {
                RIEmployee *employee = [[RIEmployee alloc] init];
                [employee setName:name];
                
                // Job title
                NSString *title = [[row findChildTag:@"p"] contents];
                [employee setTitle:title];
                
                // Info
                NSString *info = [[row findChildOfClass:@"user-description"] contents];
                [employee setInfo:info];
                
                // Image
                NSString *imageUrlString = [[row findChildTag:@"img"] getAttributeNamed:@"src"];
                [employee setImageUrlString:imageUrlString];
                
                [employees addObject:employee];
            }
        }
        
        if (successBlock) {
            dispatch_async(dispatch_get_main_queue(), ^{
                successBlock([employees copy]);
            });
        }
    }];
}


@end
