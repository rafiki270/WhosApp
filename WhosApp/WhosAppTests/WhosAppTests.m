//
//  WhosAppTests.m
//  WhosAppTests
//
//  Created by Ondrej Rafaj on 22/04/2014.
//  Copyright (c) 2014 Ridiculous Innovations. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "RIAppDelegate.h"


@interface WhosAppTests : XCTestCase

@property (nonatomic, readonly) RIAppDelegate *delegate;

@end


@implementation WhosAppTests


#pragma mark Setup

- (void)setUp {
    [super setUp];
    
    _delegate = (RIAppDelegate *)[[UIApplication sharedApplication] delegate];
}

- (void)tearDown {
    [super tearDown];
}

#pragma mark Tests

- (void)testUtilitiesIsNotNil {
    XCTAssertNotNil(_delegate.utilities, @"Utilities can not be nil");
}


@end
