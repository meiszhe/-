//
//  AddBt.m
//  我打啊
//
//  Created by imac on 15/10/26.
//  Copyright (c) 2015年 张喆. All rights reserved.
//

#import "AddBt.h"

@implementation AddBt

- (instancetype)initWithTitle:(NSString *)title style:(UIBarButtonItemStyle)style target:(id)target action:(SEL)action
{
    if(self = [super initWithTitle:title style:style target:target action:action])
    {
        NSMutableDictionary *dic = [NSMutableDictionary dictionary];
        dic[NSForegroundColorAttributeName] = [UIColor grayColor];
        [self setTitleTextAttributes:dic forState:UIControlStateNormal];
    }
    return self;
}

@end
