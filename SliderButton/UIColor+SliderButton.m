//
//  UIColor.m
//  SliderButton
//
//  Created by Annalia Sunderland on 11/23/15.
//  Copyright © 2015 Annalia Sunderland. All rights reserved.
//

#import "UIColor+SliderButton.h"

@implementation UIColor (SliderButton)

+(UIColor *) defaultColorRight {
    return [UIColor colorWithRed:42.0/255.0 green:80.0/255.0 blue:163.0/255.0 alpha:1.0];
}

+(UIColor *) defaultColorLeft {
    return [UIColor colorWithRed:99.0/255.0 green:99.0/255.0 blue:99.0/255.0 alpha:1.0];
}
+(UIColor *) defaultColorUp {
    return [UIColor colorWithRed:42.0/255.0 green:80.0/255.0 blue:163.0/255.0 alpha:1.0];
}
+(UIColor *) mainAppColor {
    return [UIColor colorWithRed:42.0/255.0 green:80.0/255.0 blue:163.0/255.0 alpha:1.0];
}

+(UIColor *) leftSliderButtonColor {
    return [UIColor colorWithRed:99.0/255.0 green:99.0/255.0 blue:99.0/255.0 alpha:1.0];
}

@end
