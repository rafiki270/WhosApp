//
//  RIDownloads.h
//  WhosApp
//
//  Created by Ondrej Rafaj on 22/04/2014.
//  Copyright (c) 2014 Ridiculous Innovations. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface RIDownloads : NSObject

- (void)downloadDataUrlString:(NSString *)urlString withSuccessBlock:(void (^)(NSData *data))successBlock;
- (void)downloadImageFromUrlString:(NSString *)urlString withSuccessBlock:(void (^)(UIImage *image))successBlock;


@end
