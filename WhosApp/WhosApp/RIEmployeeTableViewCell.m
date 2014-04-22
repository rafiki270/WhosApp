//
//  RIEmployeeTableViewCell.m
//  WhosApp
//
//  Created by Ondrej Rafaj on 22/04/2014.
//  Copyright (c) 2014 Ridiculous Innovations. All rights reserved.
//

#import "RIEmployeeTableViewCell.h"


@implementation RIEmployeeTableViewCell


#pragma mark Layout

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self.imageView setFrame:CGRectMake(18, 10, 50, 50)];
    [self.imageView setBackgroundColor:[UIColor clearColor]];
    [self.imageView.layer setCornerRadius:25];
    [self.imageView setClipsToBounds:YES];
}

#pragma mark Initialization

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    }
    return self;
}


@end
