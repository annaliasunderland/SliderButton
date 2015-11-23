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
    [demoView addSubview:sbutton];
    
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
