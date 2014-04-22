//
//  RIHomeViewController.m
//  WhosApp
//
//  Created by Ondrej Rafaj on 22/04/2014.
//  Copyright (c) 2014 Ridiculous Innovations. All rights reserved.
//

#import "RIHomeViewController.h"
#import "RIDetailViewController.h"
#import "RIEmployeeTableViewCell.h"
#import "RIUtilities.h"
#import "RIData.h"
#import "RIDownloads.h"
#import "RIEmployee.h"


@interface RIHomeViewController ()

@property (nonatomic, readonly) UITableView *tableView;
@property (nonatomic, readonly) UIImageView *logoView;

@property (nonatomic, readonly) NSArray *data;

@end


@implementation RIHomeViewController


#pragma mark Data

- (void)reload {
    UIActivityIndicatorView *ai = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [ai startAnimating];
    UIBarButtonItem *reload = [[UIBarButtonItem alloc] initWithCustomView:ai];
    [self.navigationItem setRightBarButtonItem:reload animated:YES];
    
    [self.utilities.data loadEmployees:^(NSArray *employees) {
        _data = employees;
        [_tableView reloadData];
        UIBarButtonItem *reload = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(reload)];
        [self.navigationItem setRightBarButtonItem:reload animated:YES];
    }];
}

#pragma Nav bar animations

- (void)animateAppLogo {
    CABasicAnimation *rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    [rotationAnimation setToValue:[NSNumber numberWithFloat:(M_PI * 2.0)]];
    [rotationAnimation setDuration:0.5];
    [rotationAnimation setCumulative:YES];
    [rotationAnimation setRepeatCount:0];
    [_logoView.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
    
    [NSTimer scheduledTimerWithTimeInterval:8 target:self selector:@selector(animateAppLogo) userInfo:nil repeats:NO];
}

- (void)showAppLogo {
    _logoView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Logo"]];
    UIButton *logoButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [logoButton setBounds:_logoView.bounds];
    [logoButton addTarget:self action:@selector(animateAppLogo) forControlEvents:UIControlEventTouchUpInside];
    [logoButton addSubview:_logoView];
    UIBarButtonItem *logoItem = [[UIBarButtonItem alloc] initWithCustomView:logoButton];
    [self.navigationItem setLeftBarButtonItem:logoItem animated:YES];
    
    [NSTimer scheduledTimerWithTimeInterval:0.8 target:self selector:@selector(animateAppLogo) userInfo:nil repeats:NO];
}

#pragma mark Creating elements

- (void)createTableView {
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    [_tableView setDataSource:self];
    [_tableView setDelegate:self];
    [_tableView setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight];
    [self.view addSubview:_tableView];
}

- (void)createAllElements {
    [super createAllElements];
    
    [self setTitle:NSLocalizedString(@"Who's Who", nil)];
    [self createTableView];
}

#pragma mark View lifecycle

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    if (!_data) {
        [NSTimer scheduledTimerWithTimeInterval:0.8 target:self selector:@selector(showAppLogo) userInfo:nil repeats:NO];
        [self reload];
    }
}

#pragma mark Table view delegate and data source methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_data count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"employeeCell";
    RIEmployeeTableViewCell *cell = (RIEmployeeTableViewCell *)[tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[RIEmployeeTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    
    __block RIEmployee *employee = [_data objectAtIndex:indexPath.row];
    [cell.textLabel setText:employee.name];
    [cell.detailTextLabel setText:employee.title];
    
    if (employee.image) {
        [cell.imageView setImage:employee.image];
    }
    else {
        [cell.imageView setImage:[UIImage imageNamed:@"Logo"]];
        if (employee.imageUrlString) {
            [self.utilities.downloads downloadImageFromUrlString:employee.imageUrlString withSuccessBlock:^(UIImage *image) {
                [employee setImage:image];
                dispatch_async(dispatch_get_main_queue(), ^{
                    [tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationNone];
                });
            }];
        }
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    RIEmployee *employee = [_data objectAtIndex:indexPath.row];
    RIDetailViewController *detail = [[RIDetailViewController alloc] init];
    [detail setEmployee:employee];
    [self.navigationController pushViewController:detail animated:YES];
}


@end
