//
//  SliderButton.h
//  SliderButton
//
//  Created by Annalia Sunderland on 11/23/15.
//  Copyright © 2015 Annalia Sunderland. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIColor+SliderButton.h"

@interface SliderButton : UIControl

typedef enum {
    SliderButtonDirectionUp,
//    SliderButtonDirectionDown,
    SliderButtonDirectionLeft,
    SliderButtonDirectionRight
} SliderButtonDirection;


@property (nonatomic, readonly) SliderButtonDirection direction;

+(instancetype)sliderWithDirection:(SliderButtonDirection)sliderButtonDirection
                       ParentFrame:(CGRect)parentFrame;

-(void) resetSliderButton;
-(void) resetSliderButtonAfter:(float)delay;
@end