//
//  SBSimpleDemo.m
//  SliderButton
//
//  Created by Annalia Sunderland on 11/23/15.
//  Copyright © 2015 Annalia Sunderland. All rights reserved.
//

#import "SBSimpleDemo.h"
#import "SliderButton.h"
#import "SBSimpleDemoMsgBoxView.h"
#import "SBMsgDemoViewController.h"

@implementation SBSimpleDemo {
    
    int _counter;
    NSArray *_directionsArray; // loops through directions
    
    NSArray *_statesArray;
    int counter;
    
    UIView *_otherFrame;
    
    int _swapIndex;
    BOOL _swapOccurred;
    
    SBSimpleDemoMsgBoxView *_messageBox;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor colorWithRed:232.0/255.0 green:232.0/255.0 blue:232.0/255.0 alpha:1.0]];
    [self setTitle:@"SliderButton Widget Demo"];
    
    
    
    counter = 0;
    
    float FRAME_WIDTH = self.view.frame.size.width;

    _messageBox = [[SBSimpleDemoMsgBoxView alloc] initWithFrame:CGRectMake(20, 100, FRAME_WIDTH - 40, 100)];
    
    /****************************************************************************************************************************
     ******* This is where the SliderButton's actions are set.
     ******* You can use this as reference when using you own SliderButtons.                                                    */
    
    [_messageBox.sliderButtonLeft   addTarget:self action:@selector(leftAction:)    forControlEvents:UIControlEventValueChanged];
    [_messageBox.sliderButtonRight  addTarget:self action:@selector(rightAction:)   forControlEvents:UIControlEventValueChanged];
    [_messageBox.sliderButtonUp     addTarget:self action:@selector(upAction:)      forControlEvents:UIControlEventValueChanged];
    
    /****************************************************************************************************************************/
    
    
    _statesArray = [NSArray arrayWithObjects:
                    @{@"Text"       :@"Welcome to the Slider Widget Kit!",
                      @"Visible"    :@[_messageBox.sliderButtonRight],
                      @"Hidden"     :@[_messageBox.sliderButtonLeft, _messageBox.sliderButtonUp]},
                    
                    @{@"Text"       :@"Swiping Right takes you Forward.",
                      @"Visible"    :@[_messageBox.sliderButtonRight],
                      @"Hidden"     :@[_messageBox.sliderButtonLeft, _messageBox.sliderButtonUp]},
                    
                    @{@"Text"   :@"Swiping Left takes you Back.",
                      @"Visible":@[_messageBox.sliderButtonRight, _messageBox.sliderButtonLeft],
                      @"Hidden" :@[_messageBox.sliderButtonUp]},
                    
                    @{@"Text"   :@"The Slider Button can also swipe up!",
                      @"Visible":@[_messageBox.sliderButtonRight, _messageBox.sliderButtonLeft, _messageBox.sliderButtonUp],
                      @"Hidden" :@[]},
                    
                    @{@"Text"   :@"In the following example, the SliderButton Widget will replace the Send Button function in a messaging app.",
                      @"Visible":@[_messageBox.sliderButtonRight],
                      @"Hidden" :@[_messageBox.sliderButtonUp, _messageBox.sliderButtonLeft]},
                    nil];
    
    
    
    [self changeState:0];
    
    [self.view addSubview: _messageBox];
}


# pragma mark - Part 1 Methods
-(int)getNewCounter:(int)oldCounter
          increment:(int)increment {
    int newCounter = oldCounter + increment;
    if (newCounter < 0) {
        newCounter = _statesArray.count - 1;
    }
    return newCounter;
}

-(void)changeState:(int)increment {
    counter = [self getNewCounter:counter increment:increment];
    if (counter >= _statesArray.count) {
        SBMsgDemoViewController *msgDemoViewController = [[SBMsgDemoViewController alloc] init];
        [self.navigationController pushViewController:msgDemoViewController animated:NO];
        return;
    }
    NSDictionary *stateInfo = [_statesArray objectAtIndex:counter];
    [_messageBox setMessageText:[stateInfo objectForKey:@"Text"]];          // Change Message
    NSArray *visibleSliderButtons = [stateInfo objectForKey:@"Visible"];    // Set visible SliderButtons
    for (SliderButton *sb in visibleSliderButtons) {
        [sb setHidden:NO];
    }
    NSArray *hiddenSliderButtons = [stateInfo objectForKey:@"Hidden"];      // Set hidden SliderButtons
    for (SliderButton *sb in hiddenSliderButtons) {
        [sb setHidden:YES];
    }
}

# pragma mark - Slider Button action methods set here
- (void)leftAction:(SliderButton *)slider {
    [self changeState:-1];
    [_messageBox.sliderButtonLeft resetSliderButtonAfter:0.2];
}
- (void)rightAction:(SliderButton *)slider {
    [self changeState:1];
    [_messageBox.sliderButtonRight resetSliderButtonAfter:0.2];
}
- (void)upAction:(SliderButton *)slider {
    [_messageBox setMessageText:@"Yup, you swiped up. Swipe right now to continue."];
    [_messageBox.sliderButtonUp resetSliderButtonAfter:0.2];
}


@end
