//
//  UIColor+ThreeColor.m
//  我打啊
//
//  Created by imac on 15/11/10.
//  Copyright (c) 2015年 张喆. All rights reserved.
//

#import "UIColor+ThreeColor.h"

@implementation UIColor (ThreeColor)

+ (UIColor *)colorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue
{
    return [UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:1];
}

@end
