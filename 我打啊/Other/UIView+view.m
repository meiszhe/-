//
//  UIView+view.m
//  打卡等级升级版
//
//  Created by imac on 15/10/20.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "UIView+view.h"

@implementation UIView (view)
+ (instancetype)viewWithOriginalName:(UIView *)view WithFrame:(CGRect)frame
{
    view = [[UIView alloc]initWithFrame:frame];
    return view;
}
@end
