//
//  OSAppDelegate.m
//  OneSkyOTADemo
//
//  Created by Bret Cheng on 24/7/14.
//  Copyright (c) 2014 OneSky Inc. All rights reserved.
//

#import "OSAppDelegate.h"
#import <OneSkyOTAPlugin/OneSkyOTAPlugin.h>

//#define ONESKY_API_KEY @""
//#define ONESKY_API_SECRET @""
//#define ONESKY_PROJECT_ID @""

@implementation OSAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    [OneSkyOTAPlugin provideAPIKey:ONESKY_API_KEY
                         APISecret:ONESKY_API_SECRET
                         projectID:ONESKY_PROJECT_ID];
    [OneSkyOTAPlugin checkForUpdate];

    return YES;
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Keep the translations updated
    [OneSkyOTAPlugin checkForUpdate];
}

@end
