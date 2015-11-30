//
//  SBPastMsgScrollView.m
//  SliderButton
//
//  Created by Annalia Sunderland on 11/29/15.
//  Copyright © 2015 Annalia Sunderland. All rights reserved.
//

#import "SBPastMsgScrollView.h"
#import "TextBubbleView.h"

@implementation SBPastMsgScrollView {
    UIView *_contentView;
    CGFloat xOffset, yOffset;
}

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, 2000)];
    if (self) {
        [self setBackgroundColor:[UIColor whiteColor]];
        _contentView = [[UIView alloc] initWithFrame:CGRectMake(0,0,frame.size.width, frame.size.height)];
        [_contentView setBackgroundColor:[UIColor whiteColor]];
        self.scrollEnabled = YES;
        [self setClipsToBounds:YES];
        [self addSubview:_contentView];
        [self setContentSize:frame.size];
        self.userInteractionEnabled = YES;
        self.showsVerticalScrollIndicator = YES;
        self.translatesAutoresizingMaskIntoConstraints = NO;
        // So it still doesn't scroll.
        // But since this isn't the main part of this assignment, I will look into this another day.
        
        xOffset = self.frame.size.width - 10;
        yOffset = self.frame.origin.y + 10;
        [self addMessage:@"Type your message in the bottom and swipe the Slider Button up to send!"];
        [self addMessage:@"If you don't see your message after swiping up, it's because this Scroll View has scrolled under the Navigation bar to make room for the ridiculously large keyboard. Just click anywhere (other than the keyboard)."];
//        [self addMessage:@"Ohhhhhhhhhhh"];
//        [self addMessage:@"I wish you could meet my girlfriend."];
//        [self addMessage:@"My girlfriend who lives in canada!"];

    }
    return self;
}

-(void)addMessage:(NSString *)message {
    TextBubbleView *newText = [TextBubbleView textBubbleWithText:message];
    [newText setFrame:CGRectMake(xOffset - newText.frame.size.width,
                                 yOffset, newText.frame.size.width, newText.frame.size.height)];
    yOffset = yOffset + newText.frame.size.height;
    
    // Delivered stamp.
    UILabel *deliveryLabel = [UILabel new];
    [deliveryLabel setTextAlignment:NSTextAlignmentRight];
    [deliveryLabel setText:@"Delivered."];
    [deliveryLabel sizeToFit];
    [deliveryLabel setFont:[deliveryLabel.font fontWithSize:8]];
    [deliveryLabel setTextColor:[UIColor lightGrayColor]];
    [deliveryLabel setFrame:CGRectMake(xOffset - deliveryLabel.frame.size.width,
                                       yOffset, deliveryLabel.frame.size.width, deliveryLabel.frame.size.height)];
    yOffset = yOffset + deliveryLabel.frame.size.height + 12;
    [self addSubview:newText];
    [self addSubview:deliveryLabel];
}

@end
