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
    
    int _swapIndex;
    BOOL _swapOccurred;
    
    SliderButton *_sliderButton1;
    SliderButton *_sliderButton2;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    _directionsArray = [NSArray arrayWithObjects:@"swipe right to continue", @"This is for creating an alternative to the buttons on iPhones", @"...", @"Swiping left takes you back. Try it!", @"In the following example, the swipe widget will take over send function in a messaging app; Swipe to continue", nil];
    _counter = 0;
    
    float FRAME_WIDTH = self.view.frame.size.width;
    _swapIndex = 3;
    _swapOccurred = NO;
    
    UILabel *welcome = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, FRAME_WIDTH, 100)];
    welcome.text = @"Welcome to the Swipe Kit Widget";
    welcome.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:welcome];
    
    _simpleFrame = [[UIView alloc] initWithFrame:CGRectMake(0, 100, FRAME_WIDTH, 100)];
    _simpleFrame.backgroundColor = [UIColor whiteColor];
    
    CGRect reusableFrame = CGRectMake(0, 0, FRAME_WIDTH, 100);
    _directions = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, FRAME_WIDTH, 100)];
    _directions.textAlignment = NSTextAlignmentCenter;
    _directions.font = [UIFont systemFontOfSize:10];
    _directions.text = _directionsArray[0];
    [_simpleFrame addSubview:_directions];
    
    [self _addSliderButton:reusableFrame]; // SLIDER BUTTON ADDED.
    [self.view addSubview:_simpleFrame];
}


- (NSString *)getNextDirection {
    if (_sliderButton1.direction == SliderButtonDirectionRight) {
        _counter++;
        if (_counter == (_directionsArray.count - 1)) {
             [_sliderButton1 addTarget:self action:@selector(messagesAction:) forControlEvents:UIControlEventValueChanged];
        }
    } else {
        _counter--;
        if (_counter < 0) {
            _counter = _directionsArray.count - 1;
        }
    }
    
    if (_counter == _swapIndex) {
//        _sliderButton1 = [[SliderButton alloc] initWithFrame:_sliderButton1.frame slideDirection:SliderButtonDirectionLeft];
//        
    }
    
    return _directionsArray[_counter];
}


# pragma mark - Slider Button related methods
// !!! HERE IS WHERE THE SLIDER BUTTON IS ADDED.
- (void)_addSliderButton:(CGRect)frame{
    
    _sliderButton1 = [SliderButton sliderWithDirection:SliderButtonDirectionLeft];
    [_sliderButton1 setFrame:frame];
    
//    _sliderButton1 = [[SliderButton alloc] initWithFrame:frame slideDirection:SliderButtonDirectionRight];
    [_sliderButton1 addTarget:self action:@selector(coolAction:) forControlEvents:UIControlEventValueChanged];
    [_simpleFrame addSubview:_sliderButton1];
    
//    _sliderButton2 = [[SliderButton alloc] initWithFrame:frame slideDirection:SliderButtonDirectionRight];
//    [_sliderButton2 addTarget:self action:@selector(messagesAction:) forControlEvents:UIControlEventValueChanged];
//    [_simpleFrame addSubview:_sliderButton2];
}

- (void)coolAction:(SliderButton *)slider {
    [slider resetSliderButtonAfter:0.2];
    _directions.text = [self getNextDirection];
}
-(void) messagesAction:(SliderButton *)slider {
    NSLog(@"This");
}



@end
