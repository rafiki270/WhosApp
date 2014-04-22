//
//  RIUtilities.h
//  WhosApp
//
//  Created by Ondrej Rafaj on 22/04/2014.
//  Copyright (c) 2014 Ridiculous Innovations. All rights reserved.
//

#import <Foundation/Foundation.h>


@class RIData, RIDownloads;

@interface RIUtilities : NSObject

@property (nonatomic, readonly) RIData *data;
@property (nonatomic, readonly) RIDownloads *downloads;


@end
