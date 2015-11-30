//
//  SBMsgDemoViewController.m
//  SliderButton
//
//  Created by Annalia Sunderland on 11/29/15.
//  Copyright © 2015 Annalia Sunderland. All rights reserved.
//  One method from: http://stackoverflow.com/questions/26213681/ios-8-keyboard-hides-my-textview/26226732#26226732 (see below)
//

#import "SBMsgDemoViewController.h"
#import "SliderButton.h"
#import "SBTypeMsgView.h"
#import "SBPastMsgScrollView.h"

@interface SBMsgDemoViewController () <UIScrollViewDelegate> {
    
}

@end
@implementation SBMsgDemoViewController {
    SBPastMsgScrollView *_pastMessages;
    SBTypeMsgView *_typeMessageBox;
}
NSUInteger const TMB_HEIGHT = 80; // height of type message box


#pragma mark - Initialization

-(void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"Jeff Huang"];
    self.navigationItem.hidesBackButton = YES;
    
    CGRect mainFrameRect = CGRectMake(0, self.navigationController.navigationBar.frame.size.height,
                                      self.view.frame.size.width,
                                      self.view.frame.size.height - self.navigationController.navigationBar.frame.size.height);
    [self.view setBackgroundColor: [UIColor greenColor]];
    
    float ySeparator = mainFrameRect.size.height - TMB_HEIGHT - 20;
    
    [self initPastMessages:ySeparator   mainFrame:mainFrameRect];
    [self initTypeMessageBox:ySeparator mainFrame:mainFrameRect];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tap];
}

-(void)initPastMessages:(int)ySeparator
              mainFrame:(CGRect)mainFrameRect {
    CGRect msgFrame = CGRectMake(0, 0, mainFrameRect.size.width, ySeparator);
    _pastMessages = [[SBPastMsgScrollView alloc] initWithFrame:msgFrame];
    _pastMessages.delegate = self;
    [self.view addSubview:_pastMessages];
}

-(void)initTypeMessageBox:(int)ySeparator
                mainFrame:(CGRect)mainFrameRect{
    
    _typeMessageBox = [[SBTypeMsgView alloc] initWithFrame:CGRectMake(0, ySeparator, mainFrameRect.size.width, TMB_HEIGHT)];
    
    /****************************************************************************************************************************
     ******* This is where the SliderButton's action is set.
     ******* You can use this as reference when using you own SliderButtons.                                                    */
    
    [_typeMessageBox.sendButton addTarget:self action:@selector(upAction:) forControlEvents:UIControlEventValueChanged];
    
    /****************************************************************************************************************************/

    [self.view addSubview:_typeMessageBox];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardFrameWillChange:)
                                                 name:UIKeyboardWillChangeFrameNotification object:nil];
}



#pragma mark - Slider Button method
- (void)upAction:(SliderButton *)slider {
    if ([_typeMessageBox.textField hasText]) {
        
        NSString *text = _typeMessageBox.textField.text;
        [_pastMessages addMessage:text];
        NSLog(@"SEND: %@", text);
        _typeMessageBox.textField.text = @"";
    }
    [_typeMessageBox.sendButton resetSliderButtonAfter:0.2];
}

#pragma mark - Messaging App methods


#pragma mark - keyboard related methods
-(void)dismissKeyboard {
    [_typeMessageBox.textField resignFirstResponder];
}


// The following method is by: http://stackoverflow.com/questions/26213681/ios-8-keyboard-hides-my-textview/26226732#26226732
- (void)keyboardFrameWillChange:(NSNotification *)notification {
    CGRect keyboardEndFrame = [[[notification userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGRect keyboardBeginFrame = [[[notification userInfo] objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue];
    UIViewAnimationCurve animationCurve = [[[notification userInfo] objectForKey:UIKeyboardAnimationCurveUserInfoKey] integerValue];
    NSTimeInterval animationDuration = [[[notification userInfo] objectForKey:UIKeyboardAnimationDurationUserInfoKey] integerValue];
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:animationDuration];
    [UIView setAnimationCurve:animationCurve];
    
    CGRect newFrame = self.view.frame;
    CGRect keyboardFrameEnd = [self.view convertRect:keyboardEndFrame toView:nil];
    CGRect keyboardFrameBegin = [self.view convertRect:keyboardBeginFrame toView:nil];
    
    newFrame.origin.y -= (keyboardFrameBegin.origin.y - keyboardFrameEnd.origin.y);
    self.view.frame = newFrame;
    
    [UIView commitAnimations];
}
@end
