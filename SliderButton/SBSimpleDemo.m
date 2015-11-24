//
//  SBSimpleDemo.m
//  SliderButton
//
//  Created by Annalia Sunderland on 11/23/15.
//  Copyright © 2015 Annalia Sunderland. All rights reserved.
//

#import "SBSimpleDemo.h"
#import "SliderButton.h"
#import "UIColor+SliderButton.h"

@interface SBSimpleDemo ()

@end

@implementation SBSimpleDemo {
    UIView *_simpleFrame;
    UILabel *_directions;
    
    int _counter;
    NSArray *_directionsArray; // loops through directions
    
    UIView *_otherFrame;
    
    SliderButton *_sliderButton1;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    _directionsArray = [NSArray arrayWithObjects:@"Swipe up. I dare you.", @"DO THAT AGAIN.", @"IM SRY, DO U WANT SOMETHING?!?", @"omg.", @"Fine. I can do this forever.", nil];
    _counter = 0;
    
    // Welcome to the Swipe Widget Kit
    // Swipe right to continue.
    // This is for creating an alternative to the button on iPhones.
    // ...
    // (make button on right pop up) Swiping left takes you back
    // Try it.
    //
    
    float FRAME_WIDTH = self.view.frame.size.width;
    
    _simpleFrame = [[UIView alloc] initWithFrame:CGRectMake(0, 100, FRAME_WIDTH, 100)];
    _simpleFrame.backgroundColor = [UIColor whiteColor];
    
    CGRect reusableFrame = CGRectMake(0, 0, FRAME_WIDTH, 100);
    _directions = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, FRAME_WIDTH, 100)];
    _directions.textAlignment = NSTextAlignmentCenter;
    _directions.text = _directionsArray[0];
    [_simpleFrame addSubview:_directions];
    
    [self _addSliderButton:reusableFrame]; // SLIDER BUTTON ADDED.
    [self.view addSubview:_simpleFrame];
}


- (NSString *)getNextDirection {
    _counter++;
    if (_counter >= _directionsArray.count) {
        _counter = 0;
    }
    return _directionsArray[_counter];
}


# pragma mark - Slider Button related methods
// !!! HERE IS WHERE THE SLIDER BUTTON IS ADDED.
- (void)_addSliderButton:(CGRect)frame{
    
    _sliderButton1 = [[SliderButton alloc] initWithFrame:frame slideDirection:SliderButtonDirectionUp];
    [_sliderButton1 addTarget:self action:@selector(coolAction:) forControlEvents:UIControlEventValueChanged];
    [_simpleFrame addSubview:_sliderButton1];
}

- (void)coolAction:(SliderButton *)slider {
    [slider resetSliderButtonAfter:0.2];
    _directions.text = [self getNextDirection];
}



@end
