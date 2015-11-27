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
    
    CGRect _startFrameSlider, _endZoneSlider;
    CGRect _startFrameTail, _endFrameTail;
}

// initWithFrame with specified slide direction.
-(id)initWithFrame:(CGRect)frame
    slideDirection:(SliderButtonDirection)sliderButtonDirection {
    self = [super initWithFrame:frame];
    if (self) {
        _direction = sliderButtonDirection;
        [self _initialize:frame];
        
    }
    return self;
}

// initWithFrame without slide direction specified. Default is up.
-(id) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _direction = SliderButtonDirectionUp;
        [self _initialize:frame];
    }
    return self;
}

# pragma mark - Init Helper Methods
-(void) _initialize:(CGRect) frame {
    UIImage *sliderTagImage = [self _imageForDirection:_direction];
    _sliderTag = [[UIImageView alloc] initWithImage:sliderTagImage];
    
    _sHeight = sliderTagImage.size.height/4;
    _sWidth = sliderTagImage.size.width/4;
    _fHeight = frame.size.height;
    _fWidth = frame.size.width;
    
    [self _setFrames];
    _sliderTag.frame = _startFrameSlider;
    _tail = [[UIView alloc] initWithFrame:_startFrameTail];
    
    _tail.backgroundColor = [UIColor mainAppColor];
    
    
    [self addSubview:_sliderTag];
    [self addSubview:_tail];
}

- (UIImage *) _imageForDirection:(SliderButtonDirection) sbdir {
    switch(sbdir) {
        case SliderButtonDirectionUp: {
            return [UIImage imageNamed:@"New_Half.png"];
        };
        case SliderButtonDirectionLeft: {
            return [UIImage imageNamed:@"SwipeLeft.png"];
        };
        case SliderButtonDirectionRight: {
            return [UIImage imageNamed:@"SwipeRight.png"];
        }
    }
}

/* Sets the end and start zones/frames using slide direction. */
- (void) _setFrames {
    switch (_direction) {
        case SliderButtonDirectionUp: {
            _startFrameSlider = CGRectMake(_fWidth/2 - _sWidth/2,
                                           _fHeight - _sHeight,
                                           _sWidth,
                                           _sHeight);
            _endZoneSlider = CGRectMake(0, 0, _fWidth, _sHeight*1.5);
            _startFrameTail = CGRectMake(0, _fHeight, _fWidth, 0);
            _endFrameTail = CGRectMake(0,0,_fWidth,_fHeight);
            return;
        };
            
        case SliderButtonDirectionLeft: {
            _startFrameSlider = CGRectMake(_fWidth - _sWidth,
                                           (_fHeight/2) - (_sHeight/2),
                                           _sWidth,
                                           _sHeight);
            _endZoneSlider = CGRectMake(0, 0, _fWidth/2, _fHeight);
            _startFrameTail = CGRectMake(0, 0, 0, _fHeight);// TODO
            _endFrameTail = CGRectMake(0,0,_fWidth,_fHeight);// TODO
            return;
        }
        case SliderButtonDirectionRight: {
            _startFrameSlider = CGRectMake(0,
                                           _fHeight/2 - _sHeight/2,
                                           _sWidth,
                                           _sHeight);
            _endZoneSlider = CGRectMake(_fWidth/2, 0, _fWidth/2, _fHeight);
            _startFrameTail = CGRectMake(0, 0, 0, _fHeight);// TODO
            _endFrameTail = CGRectMake(0,0,_fWidth,_fHeight);// TODO
            return;
        }
    }
}

# pragma mark - Update Views

-(void) _moveSliderTo:(CGPoint) newOrigin {
    switch (_direction) {
        case SliderButtonDirectionUp: {
            float newY = newOrigin.y - self.frame.origin.y;
            newY = MIN(_fHeight - _sHeight, newY);
            newY = MAX(0, newY);
            
            _sliderTag.frame = CGRectMake(_sliderTag.frame.origin.x, newY, _sWidth, _sHeight);
            
            _tail.frame = CGRectMake(0, newY + _sHeight, _fWidth, _fHeight - (newY + _sHeight));
            return;
        };
        case SliderButtonDirectionLeft: {
            float newX = newOrigin.x - self.frame.origin.x;
            newX = MIN(_fWidth - _sWidth, newX);
            newX = MAX(0, newX);
            
            _sliderTag.frame = CGRectMake(newX, _sliderTag.frame.origin.y, _sWidth, _sHeight);
            
            _tail.frame = CGRectMake(newX + _sWidth, 0, _fWidth - (newX + _sWidth), _fHeight);
            return;
        };
        case SliderButtonDirectionRight: {
            float newX = newOrigin.x - self.frame.origin.x;
            newX = MIN(_fWidth - _sWidth, newX);
            newX = MAX(0, newX);
            
            _sliderTag.frame = CGRectMake(newX, _sliderTag.frame.origin.y, _sWidth, _sHeight);
            
            _tail.frame = CGRectMake(0, 0, newX, _fHeight);
            return;
        };
    }
    
}

-(void)_resetToStart {
    [CATransaction begin];
    [CATransaction setDisableActions:YES];
    _sliderTag.hidden = NO;
    _tail.frame = _startFrameTail;
    _sliderTag.frame = _startFrameSlider;
    [CATransaction commit];
}

-(void)_snapToComplete {
    [CATransaction begin];
    [CATransaction setDisableActions:YES];
    _tail.frame = _endFrameTail;
    _sliderTag.hidden = YES;
    [CATransaction commit];
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
    if (CGRectContainsRect(_endZoneSlider, _sliderTag.frame)) {
        [self _snapToComplete];
        [self sendActionsForControlEvents:UIControlEventValueChanged];
    } else {
        [self _resetToStart];
    }
}


# pragma mark - reset methods

-(void)resetSliderButton {
    [self _resetToStart];
}

-(void)resetSliderButtonAfter:(float)delay {
    [self performSelector:@selector(_resetToStart) withObject:nil afterDelay:delay];
}

@end
