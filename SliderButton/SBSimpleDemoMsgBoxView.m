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
        NSLog(@"width: %f",frame.size.width);
        CGRect innerFrame = CGRectMake(0, 0, frame.size.width, frame.size.height);
        _message = [UILabel new];
        [_message setText: @"Welcome."];
        [_message setFrame: innerFrame];
        [_message setTextAlignment: NSTextAlignmentCenter];
        [self addSubview:_message];
        _sliderButtonUp = [SliderButton sliderWithDirection:SliderButtonDirectionUp ParentFrame: innerFrame];
        [self addSubview:_sliderButtonUp];
        _sliderButtonLeft = [SliderButton sliderWithDirection:SliderButtonDirectionLeft ParentFrame: innerFrame];
        [self addSubview:_sliderButtonLeft];
        _sliderButtonRight = [SliderButton sliderWithDirection:SliderButtonDirectionRight ParentFrame: innerFrame];
        [self addSubview:_sliderButtonRight];
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
