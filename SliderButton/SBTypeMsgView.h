//
//  SBTypeMsgView.h
//  SliderButton
//
//  Created by Annalia Sunderland on 11/29/15.
//  Copyright © 2015 Annalia Sunderland. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SliderButton.h"

@interface SBTypeMsgView : UIView

@property (nonatomic, readonly) UITextField *textField; //where message is typed

@property (nonatomic, readonly) SliderButton *sendButton;

@end
