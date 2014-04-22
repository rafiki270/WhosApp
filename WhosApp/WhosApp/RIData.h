//
//  RIData.h
//  WhosApp
//
//  Created by Ondrej Rafaj on 22/04/2014.
//  Copyright (c) 2014 Ridiculous Innovations. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface RIData : NSObject

- (void)loadEmployees:(void (^)(NSArray *employees))successBlock;


@end
