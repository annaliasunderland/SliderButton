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

    UIImageView *_sliderHead;
    UIView *_tail;
    
    float _headHei, _headWid, _parentHei, _parentWid;
    
    CGRect _startFrameSlider, _endZoneSlider;
    CGRect _startFrameTail, _endFrameTail;
}

NSString *const SLIDER_IMG_UP      = @"New_Half.png";
NSString *const SLIDER_IMG_LEFT    = @"SwipeLeft.png";
NSString *const SLIDER_IMG_RIGHT   = @"SwipeRight.png";

# pragma mark - Init

// Public Factory Method
+(instancetype)sliderWithDirection:(SliderButtonDirection)sliderButtonDirection
                             Frame:(CGRect)frame {
    return [[self alloc] _initWithSliderDirection: sliderButtonDirection
                                            Frame: frame];
}

# pragma mark - Init Helper Methods

// Private initializer method, for factory method to use
-(id)_initWithSliderDirection:(SliderButtonDirection)sliderButtonDirection
                        Frame:(CGRect)frame {
    self = [super initWithFrame: frame];
    if (self) {
        _direction = sliderButtonDirection;
        
        UIImage *sliderHeadImage = [self _imageForDirection:_direction];
        
        _sliderHead = [[UIImageView alloc] initWithImage:sliderHeadImage];
        
        _headHei    = sliderHeadImage.size.height / 4;
        _headWid    = sliderHeadImage.size.width / 4;
        _parentHei  = frame.size.height;
        _parentWid  = frame.size.width;
        
        [self _setFrames];
        [_sliderHead setFrame:_startFrameSlider];
        
        _tail = [[UIView alloc] initWithFrame:_startFrameTail];
        _tail.backgroundColor = [UIColor mainAppColor];
        
        [self addSubview:_sliderHead];
        [self addSubview:_tail];
        NSLog(@"HI");
    }
    return self;
}

// Private method, for returning Slider Button Image, given direction
- (UIImage *) _imageForDirection:(SliderButtonDirection) sliderButtonDirection {
    switch(sliderButtonDirection) {
        case SliderButtonDirectionUp: {
            return [UIImage imageNamed:SLIDER_IMG_UP];
        };
        case SliderButtonDirectionLeft: {
            return [UIImage imageNamed:SLIDER_IMG_LEFT];
        };
        case SliderButtonDirectionRight: {
            return [UIImage imageNamed:SLIDER_IMG_RIGHT];
        }
    }
}

// Sets the end and start zones/frames using slide direction.
- (void) _setFrames {
    //head
    float headStartX,      headEndX;
    float headStartY,      headEndY;
    float headStartWid,    headEndWid;
    float headStartHei,    headEndHei;
    
    //tail
    float tailStartX,      tailEndX;
    float tailStartY,      tailEndY;
    float tailStartWid,    tailEndWid;
    float tailStartHei,    tailEndHei;
    
    headStartWid = _headWid;    // head always has frame size of image
    headStartHei = _headHei;
    
    tailEndX = 0;               // tail always ends being entire parent frame
    tailEndY = 0;
    tailEndWid = _parentWid;
    tailEndHei = _parentHei;
    
    switch (_direction) {
        case SliderButtonDirectionUp: {
            headStartX = _parentWid/2 - _headWid/2;
            headStartY = _parentHei - _headHei;
            
            headEndX = 0;
            headEndY = 0;
            headEndWid = _parentWid;
            headEndHei  = _headHei*1.5;
            
            tailStartX = 0;
            tailStartY = _parentHei;
            tailStartWid = _parentWid;
            tailStartHei = 0;

            break;
        };
            
        case SliderButtonDirectionLeft: {
            headStartX = _parentWid - _headWid;
            headStartY = (_parentHei/2) - (_parentHei/2);
            
            headEndX = 0;
            headEndY = 0;
            headEndWid = _parentWid/2;
            headEndHei  = _parentHei;
            
            tailStartX = 0;
            tailStartY = 0;
            tailStartWid = 0;
            tailStartHei = _parentHei;

            break;
        }
        case SliderButtonDirectionRight: {
            headStartX = 0;
            headStartY = (_parentHei/2) - (_headHei/2);
            
            headEndX = _parentWid/2;
            headEndY = 0;
            headEndWid = _parentWid/2;
            headEndHei  = _parentHei;
            
            tailStartX = 0;
            tailStartY = 0;
            tailStartWid = 0;
            tailStartHei = _parentHei;
            
            break;
        }
    }
    _startFrameSlider   = CGRectMake(headStartX,    headStartY,     headStartWid,   headStartHei);
    _endZoneSlider      = CGRectMake(headEndX,      headEndY,       headEndWid,     headEndHei);
    _startFrameTail     = CGRectMake(tailStartX,    tailStartY,     tailStartWid,   tailStartHei);
    _endFrameTail       = CGRectMake(tailEndX,      tailEndY,       tailEndWid,     tailEndHei);
}

# pragma mark - Update Views (Private Methods)

// Updates the Slider Button to the new Origin; updates Tail and SliderHead Frames
-(void) _moveSliderTo:(CGPoint) newOrigin {
    
    float newHeadX, newHeadY;
    float newTailX, newTailY, newTailWid, newTailHei;
    
    switch (_direction) {
            
        case SliderButtonDirectionUp: { // same X, only move on vertical axis
            newHeadY    = MAX(0, MIN(_parentHei - _headHei,
                                     newOrigin.y - self.frame.origin.y));
            newHeadX    = _sliderHead.frame.origin.x;
            newTailX    = 0;
            newTailY    = newHeadY + _headHei;
            newTailWid  = _parentWid;
            newTailHei  = _parentHei - (newHeadY + _headHei);
            break;
        };
            
        case SliderButtonDirectionLeft: {
            newHeadX    = MAX(0, MIN(_parentWid - _headWid,
                                     newOrigin.x - self.frame.origin.x));
            newHeadY    = _sliderHead.frame.origin.y;
            newTailX    = newHeadX + _headWid;
            newTailY    = 0;
            newTailWid  = _parentWid - (newHeadX + _headWid);
            newTailHei  = _parentHei;
            break;
        };
            
        case SliderButtonDirectionRight: {
            newHeadX    = MAX(0, MIN(_parentWid - _headWid,
                                     newOrigin.x - self.frame.origin.x));
            newHeadY    = _sliderHead.frame.origin.y;
            newTailX    = 0;
            newTailY    = 0;
            newTailWid  = newHeadX;
            newTailHei  = _parentHei;
            break;
        };
    }
    // Set the Frames of the Head and Tail to new values
    [_sliderHead setFrame:CGRectMake(newHeadX, newHeadY, _headWid, _headHei)];
    [_tail setFrame:CGRectMake(newTailX, newTailY, newTailWid, newTailHei)];
}

// Snaps the Slider Button to the end frame
-(void)_snapToComplete {
    [CATransaction begin];
    [CATransaction setDisableActions:YES];
    _tail.frame = _endFrameTail;
    _sliderHead.hidden = YES;
    [CATransaction commit];
}

# pragma mark - UIControl Methods
-(BOOL)beginTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event {
    CGPoint recentTouchPoint = [touch locationInView:self];
    if (CGRectContainsPoint(_sliderHead.frame, recentTouchPoint)) {
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
    if (CGRectContainsRect(_endZoneSlider, _sliderHead.frame)) {
        [self _snapToComplete];
        [self sendActionsForControlEvents:UIControlEventValueChanged];
    } else {
        [self resetSliderButton];
    }
}


# pragma mark - reset methods
// snaps to start immediately
-(void)resetSliderButton {
    [CATransaction begin];
    [CATransaction setDisableActions:YES];
    _sliderHead.hidden = NO;
    _tail.frame = _startFrameTail;
    _sliderHead.frame = _startFrameSlider;
    [CATransaction commit];
}

// snaps to start after delay
-(void)resetSliderButtonAfter:(float)delay {
    [self performSelector:@selector(resetSliderButton) withObject:nil afterDelay:delay];
}

@end
