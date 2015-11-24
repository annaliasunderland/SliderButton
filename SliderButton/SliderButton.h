//
//  SliderButton.h
//  SliderButton
//
//  Created by Annalia Sunderland on 11/23/15.
//  Copyright © 2015 Annalia Sunderland. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SliderButton : UIControl

typedef enum {
    SliderButtonDirectionUp,
    SliderButtonDirectionDown,
    SliderButtonDirectionLeft,
    SliderButtonDirectionRight
} SliderButtonDirection;

@property (nonatomic, readonly) SliderButtonDirection direction;

-(id)initWithFrame:(CGRect)frame
    slideDirection:(SliderButtonDirection)sliderButtonDirection;

-(void) resetSliderButton;
-(void) resetSliderButtonAfter:(float)delay;
@end
