//
//  SBMessageDemo.m
//  SliderButton
//
//  Created by Annalia Sunderland on 11/29/15.
//  Copyright © 2015 Annalia Sunderland. All rights reserved.
//

#import "SBMessageDemo.h"
#import "SliderButton.h"
#import "SBTypeMsgView.h"
#import "SBPastMsgScrollView.h"

@implementation SBMessageDemo  {
    UIScrollView *_scrollView;
    
    SBPastMsgScrollView *_pastMessages;
    
    SBTypeMsgView *_typeMessageBox;
}

NSUInteger const TMB_HEIGHT = 80; // height of type message box

- (void)loadView {
    [super loadView];
    CGRect fullScreenRect=[UIScreen mainScreen].bounds;
    CGRect screenRect = CGRectMake(0, self.navigationController.navigationBar.frame.size.height,
                                   fullScreenRect.size.width, fullScreenRect.size.height - self.navigationController.navigationBar.frame.size.height - 100);
    
    
    
    _scrollView=[[UIScrollView alloc] initWithFrame:screenRect];
    _scrollView.contentSize=fullScreenRect.size;
    _scrollView.backgroundColor = [UIColor whiteColor];
    
    _pastMessages = [[SBPastMsgScrollView alloc] initWithFrame:CGRectMake(0, 0, screenRect.size.width, screenRect.size.height - TMB_HEIGHT)];
    [_pastMessages setBackgroundColor:[UIColor whiteColor]];
    UIView *tmp = [[UIView alloc] initWithFrame:CGRectMake(0, 1, screenRect.size.width, 50)];
    tmp.backgroundColor = [UIColor redColor];
    [_pastMessages addSubview:tmp];
    
    
    _typeMessageBox = [[SBTypeMsgView alloc] initWithFrame:CGRectMake(0, screenRect.size.height - TMB_HEIGHT, screenRect.size.width, TMB_HEIGHT)];
    
    [_scrollView addSubview:_pastMessages];
    [_scrollView addSubview:_typeMessageBox];
    [self registerForKeyboardNotifications];
    _scrollView.scrollEnabled = NO;
    self.view = _scrollView;
}

-(void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"Giselle Lillie"];
    self.navigationItem.hidesBackButton = YES;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
}



#pragma mark - keyboard related methods
-(void)dismissKeyboard {
    [_typeMessageBox.textField resignFirstResponder];
}

// Copy Pasted & Edited from Managing the Keyboard guide on Apple Developer Guides
- (void)registerForKeyboardNotifications
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWasShown:)
                                                 name:UIKeyboardDidShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillBeHidden:)
                                                 name:UIKeyboardWillHideNotification object:nil];
    
}

// Called when the UIKeyboardDidShowNotification is sent.
- (void)keyboardWasShown:(NSNotification*)aNotification
{
    NSDictionary* info = [aNotification userInfo];
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0, kbSize.height, 0.0);
    _scrollView.contentInset = contentInsets;
    _scrollView.scrollIndicatorInsets = contentInsets;
    
    // If active text field is hidden by keyboard, scroll it so it's visible
    CGRect aRect = _scrollView.frame;
    aRect.size.height -= kbSize.height;
    if (!CGRectContainsPoint(aRect, _typeMessageBox.frame.origin) ) {
        [_scrollView scrollRectToVisible:_scrollView.frame animated:YES];
    }
}

// Called when the UIKeyboardWillHideNotification is sent
- (void)keyboardWillBeHidden:(NSNotification*)aNotification
{
    UIEdgeInsets contentInsets = UIEdgeInsetsZero;
    _scrollView.contentInset = contentInsets;
    _scrollView.scrollIndicatorInsets = contentInsets;
    [_scrollView setContentOffset:
     CGPointMake(0, -_scrollView.contentInset.top) animated:YES];
}

@end
