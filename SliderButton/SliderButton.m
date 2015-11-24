//
//  SliderButton.m
//  SliderButton
//
//  Created by Annalia Sunderland on 11/23/15.
//  Copyright © 2015 Annalia Sunderland. All rights reserved.
//

#import "SliderButton.h"
#import "UIColor+SliderButton.h"

@implementation SliderButton {
    UIImageView *_sliderTag;
    UIView *_tail;
    
    float _sHeight, _sWidth, _fHeight, _fWidth;
    
    CGRect _sliderStartFrame, _sliderEndZone;
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        UIImage *sliderTagImage = [UIImage imageNamed:@"New_Half.png"];
        _sliderTag = [[UIImageView alloc] initWithImage:sliderTagImage];
        
        _sHeight = sliderTagImage.size.height/4;
        _sWidth = sliderTagImage.size.width/4;
        _fHeight = frame.size.height;
        _fWidth = frame.size.width;
        
        _sliderStartFrame = CGRectMake(_fWidth/2 - _sWidth/2,
                                       _fHeight - _sHeight,
                                       _sWidth,
                                       _sHeight);
        _sliderTag.frame = _sliderStartFrame;
        _sliderEndZone = CGRectMake(0, 0, _fWidth, _sHeight*1.5);
        
        _tail = [[UIView alloc] initWithFrame: CGRectMake(0, _fHeight, _fWidth, 0)];
        _tail.backgroundColor = [UIColor mainAppColor];
        
        
        [self addSubview:_sliderTag];
        [self addSubview:_tail];
        
    }
    return self;
}

# pragma mark - Update Views

-(void) _moveSliderTo:(CGPoint) newOrigin {
    // For now, only slides vertically
    float newY = newOrigin.y - self.frame.origin.y;
    newY = MIN(_fHeight - _sHeight, newY);
    newY = MAX(0, newY);
    
    _sliderTag.frame = CGRectMake(_sliderTag.frame.origin.x, newY, _sWidth, _sHeight);
    
    _tail.frame = CGRectMake(0, newY + _sHeight, _fWidth, _fHeight - (newY + _sHeight));
}


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
    [self _moveSliderTo:recentTouchPoint];
    [CATransaction commit];
    
    return YES;
}

-(void)endTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event {
    if (CGRectContainsRect(_sliderEndZone, _sliderTag.frame)) {
        [self _snapToComplete];
        [self sendActionsForControlEvents:UIControlEventValueChanged];
    } else {
        [self _resetToStart];
    }
}


-(void)_resetToStart {
    [CATransaction begin];
    [CATransaction setDisableActions:YES];
    _sliderTag.hidden = NO;
    _tail.frame = CGRectMake(0,_fHeight,_fWidth,0);
    _sliderTag.frame = _sliderStartFrame;
    [CATransaction commit];
}

-(void)_snapToComplete {
    [CATransaction begin];
    [CATransaction setDisableActions:YES];
    _tail.frame = CGRectMake(0,0,_fWidth,_fHeight);
    _sliderTag.hidden = YES;
    [CATransaction commit];
}

-(void)resetSliderButton {
    [self _resetToStart];
}

-(void)resetSliderButtonAfter:(float)delay {
    [self performSelector:@selector(_resetToStart) withObject:nil afterDelay:delay];
}

@end
