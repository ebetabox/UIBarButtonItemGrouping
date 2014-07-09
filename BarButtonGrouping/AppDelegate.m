//
//  AppDelegate.m
//  BarButtonGrouping
//
//  Created by Emilio on 06/07/14.
//  Copyright (c) 2014 emlomar. All rights reserved.
//

#import "AppDelegate.h"
#import "SampleVC.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];


	SampleVC *sampleVC = [[SampleVC alloc] initWithNibName:@"SampleVC" bundle:nil];

	UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:sampleVC];

	self.window.rootViewController = navigationController;

    [self.window makeKeyAndVisible];
    return YES;
}

@end
