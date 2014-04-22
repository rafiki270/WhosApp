//
//  RIDownloads.m
//  WhosApp
//
//  Created by Ondrej Rafaj on 22/04/2014.
//  Copyright (c) 2014 Ridiculous Innovations. All rights reserved.
//

#import "RIDownloads.h"


@interface RIDownloads ()

@property (nonatomic, readonly) NSOperationQueue *queue;

@end


@implementation RIDownloads


#pragma mark Initialization

- (void)setup {
    _queue = [[NSOperationQueue alloc] init];
    [_queue setMaxConcurrentOperationCount:2];
}

- (id)init {
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}

#pragma mark Handling downloads

- (void)downloadDataUrlString:(NSString *)urlString withSuccessBlock:(void (^)(NSData *))successBlock {
    [_queue addOperationWithBlock:^{
        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlString]];
        if (successBlock) {
            successBlock(data);
        }
    }];
}

- (void)downloadImageFromUrlString:(NSString *)urlString withSuccessBlock:(void (^)(UIImage *))successBlock {
    [self downloadDataUrlString:urlString withSuccessBlock:^(NSData *data) {
        UIImage *image = [UIImage imageWithData:data];
        if (successBlock) {
            successBlock(image);
        }
    }];
}


@end
