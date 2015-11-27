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
        CGRect innerFrame = CGRectMake(0, 0, frame.size.width, frame.size.height);
        _message = [UILabel new];
        [_message setText: @"Welcome."];
        [_message setFrame: innerFrame];
        [_message setTextAlignment: NSTextAlignmentCenter];
        _sliderButton = [SliderButton sliderWithDirection:SliderButtonDirectionRight Frame: innerFrame];
        [self addSubview:_message];
        [self addSubview:_sliderButton];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
