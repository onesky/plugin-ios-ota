//
//  OSAppDelegate.m
//  OneSkyOTADemo
//
//  Created by Bret Cheng on 24/7/14.
//  Copyright (c) 2014 OneSky Inc. All rights reserved.
//

#import "OSAppDelegate.h"
#import <OneSkyOTAPlugin/OneSkyOTAPlugin.h>

@implementation OSAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    /* 
     For security reason you might not want to embed the API secret in
     the source code of your application, in this case you can skip the 
     API secret by setting the string output API privacy to public, 
     Go to "Project settings > Privacy > String out API" on OneSky platform
     for details.
     */
    [OneSkyOTAPlugin provideAPIKey:@"Kc9XXu3bsFpAJsDI6BjX08WoRtYLPhtp"
                         APISecret:nil
                         projectID:@"32417"];
    [OneSkyOTAPlugin checkForUpdate];
    
    // Test OSLocalizedString calls
    NSLog(@"Monday = %@", OSLocalizedString(@"Monday", nil));
    NSLog(@"Tuesday = %@", OSLocalizedString(@"Tuesday", nil));

    return YES;
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Keep the translations updated
    [OneSkyOTAPlugin checkForUpdate];
}

@end
