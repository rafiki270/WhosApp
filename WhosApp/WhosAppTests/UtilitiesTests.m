//
//  UtilitiesTests.m
//  WhosApp
//
//  Created by Ondrej Rafaj on 22/04/2014.
//  Copyright (c) 2014 Ridiculous Innovations. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "RIUtilities.h"


@interface UtilitiesTests : XCTestCase

@end


@implementation UtilitiesTests


#pragma mark Setup

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

#pragma mark Tests

- (void)testDataIsNotNil {
    XCTAssertNotNil(self.utilities.data, @"Data can not be nil");
}

- (void)testDownloadsIsNotNil {
    XCTAssertNotNil(self.utilities.downloads, @"Downloads can not be nil");
}


@end
