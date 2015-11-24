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
    float FRAME_WIDTH = self.view.frame.size.width;
    SBDemoView *demoView = [[SBDemoView alloc] initWithFrame:CGRectMake(0, 150, FRAME_WIDTH, 100)];
    SliderButton *sbutton = [[SliderButton alloc] initWithFrame:CGRectMake(0, 0, FRAME_WIDTH, 100)];
    [sbutton addTarget:self action:@selector(completedSlide:) forControlEvents:UIControlEventValueChanged];
    [demoView addSubview:sbutton];
    
    [self.view addSubview:demoView];
}

#pragma mark - UIControlEventValueChanged method
-(void)completedSlide:(SliderButton *)slider {
    NSLog(@"completed!");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
