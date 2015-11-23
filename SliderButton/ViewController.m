//
//  ViewController.m
//  SliderButton
//
//  Created by Annalia Sunderland on 11/23/15.
//  Copyright © 2015 Annalia Sunderland. All rights reserved.
//

#import "ViewController.h"
#import "SliderButton.h"
#import "SBDemoView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    SBDemoView *demoView = [[SBDemoView alloc] initWithFrame:CGRectMake(0, 150, self.view.frame.size.width, 100)];
    [self.view addSubview:demoView];
//    SliderButton *demoButton = [[SliderButton alloc] initWithFrame:CGRectMake(0, 150, self.view.frame.size.width, 50)];
//    [demoView addSubview:demoButton];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
