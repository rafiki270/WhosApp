//
//  RIAppDelegate.h
//  WhosApp
//
//  Created by Ondrej Rafaj on 22/04/2014.
//  Copyright (c) 2014 Ridiculous Innovations. All rights reserved.
//

#import <UIKit/UIKit.h>


@class RIUtilities;

@interface RIAppDelegate : UIResponder <UIApplicationDelegate>

@property (nonatomic, strong) UIWindow *window;
@property (nonatomic, readonly) RIUtilities *utilities;


@end
