//
//  SBTypeMsgView.m
//  SliderButton
//
//  Created by Annalia Sunderland on 11/29/15.
//  Copyright © 2015 Annalia Sunderland. All rights reserved.
//

#import "SBTypeMsgView.h"

@interface SBTypeMsgView () <UITextFieldDelegate>
@end

@implementation SBTypeMsgView


-(id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:[UIColor colorWithRed:232.0/255.0 green:232.0/255.0 blue:232.0/255.0 alpha:1.0]];
        
        [self initMessagingBox];
        [self initSliderButton];
    }
    return self;
}

-(void)initMessagingBox {
    
    _textField = [[UITextField alloc] initWithFrame:CGRectMake(25, 10, self.frame.size.width - 50, 25)];
    [_textField setBackgroundColor:[UIColor whiteColor]];
    
    [_textField setKeyboardAppearance:UIKeyboardAppearanceDefault];
    [_textField setUserInteractionEnabled:YES];
    _textField.placeholder = @"enter text";
    _textField.autocorrectionType = UITextAutocorrectionTypeNo;
    _textField.borderStyle = UITextBorderStyleRoundedRect;
    _textField.keyboardType = UIKeyboardTypeDefault;
    _textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    _textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    _textField.delegate = self;
    
    [self addSubview:_textField];
}

-(void)initSliderButton {
    _sendButton = [SliderButton sliderWithDirection:SliderButtonDirectionUp ParentFrame:self.frame];
    [self addSubview:_sendButton];
}

@end
