//
//  TextBubbleView.h
//  SliderButton
//
//  Created by Annalia Sunderland on 11/29/15.
//  Copyright © 2015 Annalia Sunderland. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TextBubbleView : UIView

@property (nonatomic, readonly) UILabel *text;

+(TextBubbleView*)textBubbleWithText:(NSString *)text;

@end
