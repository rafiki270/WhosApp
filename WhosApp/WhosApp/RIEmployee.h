//
//  RIEmployee.h
//  WhosApp
//
//  Created by Ondrej Rafaj on 22/04/2014.
//  Copyright (c) 2014 Ridiculous Innovations. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface RIEmployee : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *imageUrlString;
@property (nonatomic, strong) NSString *info;

@property (nonatomic, strong) UIImage *image;


@end
