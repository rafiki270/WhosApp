//
//  NSObject+Utilities.m
//  WhosApp
//
//  Created by Ondrej Rafaj on 22/04/2014.
//  Copyright (c) 2014 Ridiculous Innovations. All rights reserved.
//

#import "NSObject+Utilities.h"
#import "RIAppDelegate.h"


@implementation NSObject (Utilities)

- (RIUtilities *)utilities {
    return [(RIAppDelegate *)[[UIApplication sharedApplication] delegate] utilities];
}


@end
