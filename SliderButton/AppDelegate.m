//
//  AppDelegate.m
//  SliderButton
//
//  Created by Annalia Sunderland on 11/23/15.
//  Copyright © 2015 Annalia Sunderland. All rights reserved.
//
//  This is used for testing out the widget.

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate {
    ViewController *_mainVController;
    UINavigationController *_navController;
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    _mainVController = [[ViewController alloc] init];
    _mainVController.view.backgroundColor = [UIColor whiteColor];
    _navController = [[UINavigationController alloc] initWithRootViewController:_mainVController];

    self.window.rootViewController = _navController;
    [self.window makeKeyAndVisible];
    return YES;
}

@end
