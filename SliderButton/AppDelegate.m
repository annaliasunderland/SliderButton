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
#import "UIColor+SliderButton.h"

@interface AppDelegate ()

@end

@implementation AppDelegate {
    ViewController *_mainVController;
    UINavigationController *_navController;
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    // Main VC
    _mainVController = [[ViewController alloc] init];
    _mainVController.title = @"Jeff Huang";
    _mainVController.view.backgroundColor = [UIColor whiteColor];
    
    // Nav
    _navController = [[UINavigationController alloc] initWithRootViewController:_mainVController];
    _navController.navigationBar.barTintColor = [UIColor mainAppColor];
    _navController.navigationBar.translucent = NO;
    [_navController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
   
    self.window.rootViewController = _navController;
    [self.window makeKeyAndVisible];
    return YES;
}

@end
