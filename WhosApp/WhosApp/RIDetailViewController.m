//
//  RIDetailViewController.m
//  WhosApp
//
//  Created by Ondrej Rafaj on 22/04/2014.
//  Copyright (c) 2014 Ridiculous Innovations. All rights reserved.
//

#import "RIDetailViewController.h"
#import "RIUtilities.h"
#import "RIDownloads.h"
#import "RIEmployee.h"


@interface RIDetailViewController ()

@property (nonatomic, readonly) UIScrollView *scrollView;

@property (nonatomic, readonly) UIImageView *imageView;
@property (nonatomic, readonly) UILabel *infoLabel;

@end


@implementation RIDetailViewController


#pragma mark Settting data

- (void)setEmployee:(RIEmployee *)employee {
    _employee = employee;
}

#pragma mark Creating elements

- (void)createScrollView {
    _scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    [_scrollView setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:_scrollView];
}

- (void)createImageView {
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 22, 280, 280)];
    [_imageView.layer setCornerRadius:140];
    [_imageView setClipsToBounds:YES];
    if (_employee.image) {
        [_imageView setImage:_employee.image];
    }
    else if (_employee.imageUrlString) {
        [self.utilities.downloads downloadImageFromUrlString:_employee.imageUrlString withSuccessBlock:^(UIImage *image) {
            [_employee setImage:image];
            dispatch_async(dispatch_get_main_queue(), ^{
                [_imageView setImage:_employee.image];
            });
        }];
    }
    [_scrollView addSubview:_imageView];
}

- (void)createInfoLabel {
    _infoLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 334, 280, 30)];
    [_infoLabel setFont:[UIFont systemFontOfSize:13]];
    [_infoLabel setTextColor:[UIColor grayColor]];
    [_infoLabel setNumberOfLines:0];
    [_infoLabel setLineBreakMode:NSLineBreakByWordWrapping];
    [_infoLabel setText:_employee.info];
    [_infoLabel sizeToFit];
    [_scrollView addSubview:_infoLabel];
    
    CGFloat height = (304 + _infoLabel.frame.size.height + 20);
    [_scrollView setContentSize:CGSizeMake(320, height)];
}

- (void)createAllElements {
    [super createAllElements];
    
    [self createScrollView];
    [self createImageView];
    [self createInfoLabel];
    
    [self setTitle:_employee.name];
    [self.navigationItem setPrompt:_employee.title];
}


@end
