//
//  ViewController.m
//  SliderButton
//
//  Created by Annalia Sunderland on 11/23/15.
//  Copyright © 2015 Annalia Sunderland. All rights reserved.
//

#import "ViewController.h"
#import "SliderButton.h"
#import "UIColor+SliderButton.h"

@interface ViewController ()

@end

@implementation ViewController {
    UITextField *_msgBox;
    UILabel *_msgs;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Jeff Huang";
    self.view.backgroundColor = [UIColor whiteColor];
    [self _setUpMessages];
}

-(void)_setUpMessages {
    
    float FRAME_WIDTH = self.view.frame.size.width;
    float FRAME_HEIGHT = self.view.frame.size.height;
    
    // Placeholder Box
    UIView *placeholder = [[UIView alloc] initWithFrame:CGRectMake(0, FRAME_HEIGHT - 280, FRAME_WIDTH, 280)];
    placeholder.backgroundColor = [UIColor colorWithRed:135/255.0 green:206/255.0 blue:235/255.0 alpha:0.2];
    [self.view addSubview:placeholder];

    // Messages
    _msgs = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, FRAME_WIDTH - 50, 50)];
    _msgs.textAlignment = NSTextAlignmentRight;
    _msgs.text = @"";
    [self.view addSubview:_msgs];
    
    // Message Box
    UIView *msgBg = [[UIView alloc] initWithFrame:CGRectMake(0, FRAME_HEIGHT - 350, FRAME_WIDTH, 70)];
    msgBg.backgroundColor = [UIColor colorWithRed:232/255.0 green:232/255.0 blue:232/255.0 alpha:1.0];
    
    _msgBox = [[UITextField alloc] initWithFrame:CGRectMake(20, 10, FRAME_WIDTH - 40, 30)];
    _msgBox.userInteractionEnabled = YES;
    _msgBox.backgroundColor = [UIColor whiteColor];
    _msgBox.font = [UIFont systemFontOfSize:15];
    _msgBox.placeholder = @"  Enter Message";
    _msgBox.keyboardType = UIKeyboardAppearanceLight; //Keyboard doesn't appear
    _msgBox.returnKeyType = UIReturnKeyDone;
    _msgBox.clearButtonMode = UITextFieldViewModeWhileEditing;
    _msgBox.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    
    
    ////////////////////////////////////////////////////////////////////////////////////////////////
    // Slider Button !!! THIS IS THE EXAMPLE OF HOW TO USE SLIDER BUTTON
    SliderButton *sbutton = [SliderButton sliderWithDirection:SliderButtonDirectionUp Frame:CGRectMake(0, 0, FRAME_WIDTH, 70)];
    [sbutton addTarget:self action:@selector(completedSlide:) forControlEvents:UIControlEventValueChanged];
    [msgBg addSubview:sbutton];
    ////////////////////////////////////////////////////////////////////////////////////////////////
    
    // Adding Message box to View
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
