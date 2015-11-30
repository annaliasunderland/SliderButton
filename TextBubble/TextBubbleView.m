//
//  TextBubbleView.m
//  SliderButton
//
//  Created by Annalia Sunderland on 11/29/15.
//  Copyright © 2015 Annalia Sunderland. All rights reserved.
//
//  Lol this ended up being another widget kinda.

#import "TextBubbleView.h"
#import "UIColor+SliderButton.h"

@implementation TextBubbleView {
}

+(TextBubbleView *)textBubbleWithText:(NSString *)text {
    return [[self alloc] _initWithText:text];
}

CGFloat const MAXIMUM_WIDTH = 170.0f;
CGFloat const MINIMUM_WIDTH = 60.0f;
CGFloat const MINIMUM_HEIGHT = 22.0f;


-(instancetype) _initWithText:(NSString *)text {
    self = [super init];
    if (self) {
        [self.layer setCornerRadius:15.0f];
        [self.layer setMasksToBounds:YES];
        [self setBackgroundColor:[UIColor mainAppColor]];
        
        _text=[UILabel new];
        [_text setTextAlignment:NSTextAlignmentCenter];
        [_text setText:text];
        [_text setFont:[_text.font fontWithSize:10]];
        [_text setNumberOfLines:100];
        [_text setTextColor:[UIColor whiteColor]];
        [_text sizeToFit];
        CGSize textSize = _text.frame.size;
        if (textSize.height < MINIMUM_HEIGHT) {
            textSize.height = MINIMUM_HEIGHT;
        }
        if (textSize.width < MINIMUM_WIDTH) {
            textSize.width = MINIMUM_WIDTH;
        }
        if (textSize.width > MAXIMUM_WIDTH) {
            textSize.height = textSize.height + (((textSize.width - MAXIMUM_WIDTH)/MAXIMUM_WIDTH) + 1)*13;
            textSize.width = MAXIMUM_WIDTH;
        }
        
        [self.layer setFrame:CGRectMake(0, 0, textSize.width + 20, textSize.height+20)];
        [_text setFrame:CGRectMake(10, 10, textSize.width, textSize.height)];
        [self addSubview:_text];
    }
    return self;
}


//-(CGSize)_sizeForText:(NSString *)text {
//    [_text setText: text];
//    return _text.intrinsicContentSize;
////    CGSize expectedLabelSize = [text sizeWithFont:_text.font
////                                      constrainedToSize:CGSizeMake(120, 30)
////                                          lineBreakMode:_text.lineBreakMode];
////    return expectedLabelSize;
////
////    if (text.length < 30) {
////        return CGSizeMake(120, 30);
////    }
////    if (text.length < 100) {
////        return CGSizeMake(240, 30);
////    }
////    
////    if (text.length < 200) {
////        return CGSizeMake(240, 40); // 3 lines
////    }
////    return CGSizeMake(240, 90);
//}

@end
