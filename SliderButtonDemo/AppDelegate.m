//
//  AppDelegate.m
//  SliderButton
//
//  Created by Annalia Sunderland on 11/23/15.
//  Copyright © 2015 Annalia Sunderland. All rights reserved.
//
//  This is used for testing out the widget.

#import "AppDelegate.h"
#import "SBSimpleDemo.h"
#import "UIColor+SliderButton.h"

@interface AppDelegate ()

@end

@implementation AppDelegate {
    SBSimpleDemo *_mainVController;
    UINavigationController *_navController;
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    // Main VC
    _mainVController = [[SBSimpleDemo alloc] init];
    
    // Nav
    _navController = [[UINavigationController alloc] initWithRootViewController:_mainVController];
    _navController.navigationBar.barTintColor = [UIColor defaultColorRight];
    _navController.navigationBar.barStyle = UIBarStyleBlack;
    _navController.navigationBar.translucent = NO;
    [_navController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
   
    self.window.rootViewController = _navController;
    [self.window makeKeyAndVisible];
    return YES;
}

@end
