//
//  RIUtilities.m
//  WhosApp
//
//  Created by Ondrej Rafaj on 22/04/2014.
//  Copyright (c) 2014 Ridiculous Innovations. All rights reserved.
//

#import "RIUtilities.h"
#import "RIData.h"
#import "RIDownloads.h"


@implementation RIUtilities


#pragma mark Initialization

- (void)instanciateUtilities {
    _data = [[RIData alloc] init];
    
    _downloads = [[RIDownloads alloc] init];
}

- (id)init {
    self = [super init];
    if (self) {
        [self instanciateUtilities];
    }
    return self;
}


@end
