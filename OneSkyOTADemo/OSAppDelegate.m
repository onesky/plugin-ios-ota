//
//  OSAppDelegate.m
//  OneSkyOTADemo
//
//  Created by Bret Cheng on 24/7/14.
//  Copyright (c) 2014 OneSky Inc. All rights reserved.
//

#import "OSAppDelegate.h"
#import "OneSkyOTAPlugin.h"

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
    [OneSkyOTAPlugin provideAPIKey:@"E1pO0tjuOJ9xWw4VmqargWcD4YDEq7AU"
                         APISecret:nil
                         projectID:@"56727"];
    [OneSkyOTAPlugin checkForUpdate];
    // force language
    [OneSkyOTAPlugin setLanguage:@"zh-HK"];

    // set a custom log level
    [OneSkyOTAPlugin setLogLevel:OneSkyLogLevelInfo];

    // Test OSLocalizedString calls
    NSLog(@"Monday = %@", OSLocalizedString(@"Monday", nil));

    // Fallback to specific bundle for callback
    NSString *testBundlePath = [[NSBundle mainBundle] pathForResource:@"TestBundle" ofType:@"bundle"];
    NSBundle *testBundle = [NSBundle bundleWithPath:testBundlePath];
    // register before use
    [OneSkyOTAPlugin registerFallbackBundles:@[testBundle]];
    NSLog(@"Tuesday = %@", OSLocalizedStringFromTableWithFallbackToBundle(@"Tuesday", nil, testBundle, nil));

    // Custom default value
    NSLog(@"Wednesday = %@", OSLocalizedStringWithDefaultValue(@"Wednesday", @"Days", @"Default Day", nil));

    return YES;
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Keep the translations updated
    [OneSkyOTAPlugin checkForUpdate];
}

@end
