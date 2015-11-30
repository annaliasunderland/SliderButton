//
//  SBSimpleDemoMsgBoxView.h
//  SliderButton
//
//  Created by Annalia Sunderland on 11/27/15.
//  Copyright © 2015 Annalia Sunderland. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SliderButton.h"

@interface SBSimpleDemoMsgBoxView : UIView

@property (nonatomic, readonly) SliderButton *sliderButtonUp;
@property (nonatomic, readonly) SliderButton *sliderButtonLeft;
@property (nonatomic, readonly) SliderButton *sliderButtonRight;


@property (nonatomic, readonly) UILabel *message;

-(void) setMessageText:(NSString *)text;

@end
