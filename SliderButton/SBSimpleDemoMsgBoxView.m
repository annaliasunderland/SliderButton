//
//  SBSimpleDemoMsgBoxView.m
//  SliderButton
//
//  Created by Annalia Sunderland on 11/27/15.
//  Copyright © 2015 Annalia Sunderland. All rights reserved.
//

#import "SBSimpleDemoMsgBoxView.h"

@implementation SBSimpleDemoMsgBoxView

-(instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor: [UIColor whiteColor]];
        CGRect innerFrame   = CGRectMake(0, 0, frame.size.width, frame.size.height);
        CGRect messageFrame = CGRectMake(25, 0, frame.size.width - 50, frame.size.height);
        _message = [UILabel new];
        [_message setText: @"Welcome."];
        [_message setFrame: messageFrame];
        [_message setTextAlignment: NSTextAlignmentCenter];
        [_message setTextColor:[UIColor mainAppColor]];
        _message.lineBreakMode = NSLineBreakByWordWrapping;
        _message.numberOfLines = 3;
        [self addSubview:_message];
        
        _sliderButtonUp     = [SliderButton sliderWithDirection:SliderButtonDirectionUp     ParentFrame: innerFrame];
        _sliderButtonLeft   = [SliderButton sliderWithDirection:SliderButtonDirectionLeft   ParentFrame: innerFrame];
        _sliderButtonRight  = [SliderButton sliderWithDirection:SliderButtonDirectionRight  ParentFrame: innerFrame];
        
        [self addSubview:_sliderButtonUp];
        [self addSubview:_sliderButtonLeft];
        [self addSubview:_sliderButtonRight];
    }
    return self;
}

-(void)setMessageText:(NSString *)text {
    if (text.length > 50) {
        [_message setFont:[_message.font fontWithSize:8]];
    } else {
        [_message setFont:[_message.font fontWithSize:12]];
    }
    
    [_message setText:text];
}

@end
