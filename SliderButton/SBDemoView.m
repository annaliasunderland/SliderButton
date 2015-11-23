//
//  SBDemoView.m
//  SliderButton
//
//  Created by Annalia Sunderland on 11/23/15.
//  Copyright © 2015 Annalia Sunderland. All rights reserved.
//

#import "SBDemoView.h"

@implementation SBDemoView {
    NSDictionary *_viewsDictionary;
    UILabel *_message;
}
-(id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (!self) {
        return nil;
    }
    _message = [UILabel new];
    _message.font = [UIFont preferredFontForTextStyle:UIFontTextStyleCaption1];
    _message.text = @"Slide Button up.";
    self.backgroundColor = [UIColor grayColor];
    _viewsDictionary = NSDictionaryOfVariableBindings(_message);
    _message.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:_message];
    
    return self;
}

+(BOOL)requiresConstraintBasedLayout {
    return YES;
}

-(void)updateConstraints {
    [super updateConstraints];
    
    //Horizontal Constraints
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[_message]"
                                                                 options:0
                                                                 metrics:nil
                                                                   views:_viewsDictionary]];
    
    
//    //Vertical Constraints
//    
//    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-10-[_message]"
//                                                                 options:0
//                                                                 metrics:nil
//                                                                   views:_viewsDictionary]];
    
}

@end