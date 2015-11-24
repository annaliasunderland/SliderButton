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

@implementation ViewController {
    UITextField *_msgBox;
    UILabel *_msgs;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self _setUpMessages];
}

-(void)_setUpMessages {
    
    float FRAME_WIDTH = self.view.frame.size.width;

    // Messages
    _msgs = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, FRAME_WIDTH - 50, 50)];
    _msgs.textAlignment = NSTextAlignmentRight;
    _msgs.text = @"";
    [self.view addSubview:_msgs];
    
    // Message Box
    UIView *msgBg = [[UIView alloc] initWithFrame:CGRectMake(0, 300, FRAME_WIDTH - 10, 70)];
    msgBg.backgroundColor = [UIColor colorWithRed:232/255.0 green:232/255.0 blue:232/255.0 alpha:1.0];
    
    _msgBox = [[UITextField alloc] initWithFrame:CGRectMake(20, 10, FRAME_WIDTH - 40, 30)];
    _msgBox.backgroundColor = [UIColor whiteColor];
    _msgBox.font = [UIFont systemFontOfSize:15];
    _msgBox.placeholder = @"Enter Message";
    _msgBox.keyboardType = UIKeyboardTypeDefault;
    _msgBox.returnKeyType = UIReturnKeyDone;
    _msgBox.clearButtonMode = UITextFieldViewModeWhileEditing;
    _msgBox.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    
    
    // Slider Button !!! THIS IS THE EXAMPLE OF HOW TO USE SLIDER BUTTON
    SliderButton *sbutton = [[SliderButton alloc] initWithFrame:CGRectMake(0, 0, FRAME_WIDTH, 70)];
    [sbutton addTarget:self action:@selector(completedSlide:) forControlEvents:UIControlEventValueChanged];
    [msgBg addSubview:sbutton];
    [msgBg addSubview:_msgBox];
    [self.view addSubview:msgBg];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIControlEventValueChanged method
-(void)completedSlide:(SliderButton *)slider {
    _msgs.text = [NSString stringWithFormat:@"%@%@", _msgs.text, _msgBox.text];
    _msgBox.text = @"";
    
    [self performSelector:@selector(resetSliderButton:) withObject:slider afterDelay:0.5];
}

-(void)resetSliderButton:(SliderButton *)slider {
    [slider resetSliderButton];
}

@end
