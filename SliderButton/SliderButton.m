//
//  SliderButton.m
//  SliderButton
//
//  Created by Annalia Sunderland on 11/23/15.
//  Copyright © 2015 Annalia Sunderland. All rights reserved.
//

#import "SliderButton.h"

@implementation SliderButton {
    UIImageView *_sliderTag;
    UIImageView *_sliderTrack;
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        UIImage *sliderTagImage = [UIImage imageNamed:@"SliderTag.png"];
        _sliderTag = [[UIImageView alloc] initWithImage:sliderTagImage];
        
        float sHeight = sliderTagImage.size.height/2;
        float sWidth = sliderTagImage.size.width/2;
        float fHeight = frame.size.height;
        float fWidth = frame.size.width;
        
        _sliderTag.frame = CGRectMake(fWidth/2 - sWidth/2,
                                      fHeight - sHeight,
                                      sWidth,
                                      sHeight);
        
        [self addSubview:_sliderTag];
        
    }
    return self;
}

# pragma mark - Update Views

//-(void) _moveSliderTo:(CGPoint) newOrigin


# pragma mark - UIControl Methods
-(BOOL)beginTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event {
    CGPoint recentTouchPoint = [touch locationInView:self];
    if (CGRectContainsPoint(_sliderTag.frame, recentTouchPoint)) {
        return YES;
    }
    return NO;
}

-(BOOL)continueTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event {
    CGPoint recentTouchPoint = [touch locationInView:self];
    
    [CATransaction begin];
    [CATransaction setDisableActions:YES];
//    [self _moveSliderTo:_recentTouchPoint];
    [CATransaction commit];
    
    return YES;
}

-(void)endTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event {
    // TODO
}

@end
