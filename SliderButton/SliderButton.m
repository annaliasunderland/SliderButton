//
//  SliderButton.m
//  SliderButton
//
//  Created by Annalia Sunderland on 11/23/15.
//  Copyright © 2015 Annalia Sunderland. All rights reserved.
//

#import "SliderButton.h"

@implementation SliderButton {

    UIImageView *_head;
    UIView      *_tail;
    
    float   _headHei;
    float   _headWid;
    
    float   _parentHei;
    float   _parentWid;
    
    CGRect  _startFrame;
    CGRect  _completeFrame;
    
    float   _endX;
    float   _endY;
    
    CGRect  _startTail; // endTail = parentFrame
    CGRect  _startHead; // endHead is when it is hidden
    
}

NSString *const SLIDER_IMG_UP      = @"New_Half.png";
NSString *const SLIDER_IMG_LEFT    = @"SwipeLeft.png";
NSString *const SLIDER_IMG_RIGHT   = @"SwipeRight.png";

float const RATIO = 0.5;

# pragma mark - Init

// Public Factory Method
+(instancetype)sliderWithDirection:(SliderButtonDirection)sliderButtonDirection
                       ParentFrame:(CGRect)parentFrame {
    return [[self alloc] _initWithSliderDirection: sliderButtonDirection
                                      ParentFrame: parentFrame];
}

# pragma mark - Init Helper Methods

// Private initializer method, for factory method to use
-(id)_initWithSliderDirection:(SliderButtonDirection)sliderButtonDirection
                        ParentFrame:(CGRect)parentFrame {
    
    self = [super init];
    if (self) {
        _completeFrame  = parentFrame;
        _parentHei      = parentFrame.size.height;
        _parentWid      = parentFrame.size.width;
        _direction      = sliderButtonDirection;
        
        UIImage *sliderHeadImage = [self _imageForDirection:sliderButtonDirection];
        
        _headHei    = sliderHeadImage.size.height / 4;
        _headWid    = sliderHeadImage.size.width / 4;
        
        _head = [[UIImageView alloc] initWithImage:sliderHeadImage];
        _tail = [[UIView alloc] init];
        
        [self   _setGlobalsForDirection:sliderButtonDirection];
        [self   setFrame:_startFrame];
        [_head  setFrame:_startHead];
        [_tail  setFrame:_startTail];
        
        
        [self addSubview:_head];
        [self addSubview:_tail];
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

/*
 * Sets the following globals:
 *      - startFrame
 *      - startTail
 *      - startHead
 *      - endX or endY
 */
-(void) _setGlobalsForDirection:(SliderButtonDirection) sliderButtonDirection {
    float startX, startY;
    
    switch (sliderButtonDirection) {
        case SliderButtonDirectionUp: {
            startX      = RATIO * _parentWid - RATIO * _headWid;
            startY      = _parentHei - _headHei;
            _endY       = RATIO * _parentHei;
            _startTail  = CGRectMake(-1 * startX, _headHei,
                                     _parentWid,  0);
            [_tail setBackgroundColor:[UIColor defaultColorUp]];
            break;
        };
            
        case SliderButtonDirectionLeft: {
            startX      = _parentWid - _headWid;
            startY      = (RATIO * _parentHei) - (RATIO * _headHei);
            _endX       = RATIO * _parentWid;
            _startTail  = CGRectMake(_headWid, -1 * startY,
                                     0, _parentHei);
            
            [_tail setBackgroundColor:[UIColor defaultColorLeft]];
            break;
        };

        case SliderButtonDirectionRight: {
            startX      = 0;
            startY      = (RATIO * _parentHei) - (RATIO * _headHei);
            _endX       = RATIO * _parentWid;
            _startTail  = CGRectMake(0, -1 * startY,
                                     0, _parentHei);
            [_tail setBackgroundColor:[UIColor defaultColorRight]];
            break;
        };
    }                       //   x          y           width       height
    _startHead      = CGRectMake(0,         0,          _headWid,   _headHei); // always the case
    _startFrame     = CGRectMake(startX,    startY,     _headWid,   _headHei);
}


# pragma mark - Update Views (Private Methods)

// TODO how mask tag?
// Updates the Slider Button to the new Origin; updates Tail and SliderHead Frames
-(void) _moveSliderTo:(CGPoint) newOrigin {
    
    // if there's a change, the case will change it
    float newFrameX     = self.frame.origin.x;
    float newFrameY     = self.frame.origin.y;
    float newTailWidth  = _tail.frame.size.width;
    float newTailHeight = _tail.frame.size.height;
    float newTailX      = _tail.frame.origin.x; //the tail's origin y doesn't change for any of the directions.
    
    switch (_direction) {
        case SliderButtonDirectionUp: {         // Move entire frame up, not headFrame; only change tail height
            
            newFrameY       = self.frame.origin.y + newOrigin.y;
            newFrameY       = MIN(newFrameY, _parentHei);
            newFrameY       = MAX(newFrameY, -1 * _headHei);
            
            newTailHeight   = _parentHei - newFrameY;
            break;
        };
            
        case SliderButtonDirectionLeft: {       // Move entire frame left, not headFrame; only change tail width
            
            newFrameX       = self.frame.origin.x + newOrigin.x;
            newFrameX       = MIN(newFrameX, _parentWid);
            newFrameX       = MAX(newFrameX, -1 * _headWid);
            
            newTailWidth    = _parentWid - newFrameX;
            break;
        };
            
        case SliderButtonDirectionRight: {      // Move entire frame right, not headFrame; only change tail width

            newFrameX       = self.frame.origin.x + newOrigin.x;
            newFrameX       = MIN(newFrameX, _parentWid);
            newFrameX       = MAX(newFrameX, 0);
            
            newTailX        = -1 * newFrameX;
            newTailWidth    = newFrameX;
            break;
        };
    }
    
    [self   setFrame:CGRectMake(newFrameX,  newFrameY,              self.frame.size.width,  self.frame.size.height)];
    [_tail  setFrame:CGRectMake(newTailX,   _tail.frame.origin.y,   newTailWidth,           newTailHeight)];
}

// Snaps the Slider Button to the end frame
-(void)_snapToComplete {
    [CATransaction begin];
    [CATransaction setDisableActions:YES];
    [_tail setFrame:_completeFrame];
    _head.hidden = YES;
    [self setFrame:_completeFrame];
    [CATransaction commit];
}

// Returns YES if in end zone
-(BOOL)isInEndZone {
    switch (_direction) {
            
        case SliderButtonDirectionUp : {
            return (self.frame.origin.y <= _endY) ? YES : NO;
        };
            
        case SliderButtonDirectionLeft : {
            return (self.frame.origin.x <= _endX) ? YES : NO;
        };
            
        case SliderButtonDirectionRight : {
            return (self.frame.origin.x >= _endX) ? YES : NO;
        };
    }
    return NO;
}

# pragma mark - UIControl Methods
-(BOOL)beginTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event {
    CGPoint recentTouchPoint = [touch locationInView:self];
    
    if (CGRectContainsPoint(_head.frame, recentTouchPoint)) {
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
    if ([self isInEndZone]) {
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
    _head.hidden = NO;
    [_tail  setFrame:_startTail];
    [_head  setFrame:_startHead];
    [self   setFrame:_startFrame];
    [CATransaction commit];
}

// snaps to start after delay
-(void)resetSliderButtonAfter:(float)delay {
    [self performSelector:@selector(resetSliderButton) withObject:nil afterDelay:delay];
}

@end
