//
//  Cell.m
//  我打啊
//
//  Created by imac on 15/10/26.
//  Copyright (c) 2015年 张喆. All rights reserved.
//

#import "Cell.h"

@implementation Cell

- (instancetype)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
    {
        _date_lb = [[UILabel alloc]initWithFrame:self.bounds];
//        _signIn_image = [[UIImageView alloc]initWithFrame:CGRectMake(_date_lb.origin.x+4, _date_lb.origin.y, _date_lb.width/2, _signIn_image.height)];
        _signIn_image = [[UIImageView alloc]initWithFrame:self.bounds];
        _signIn_image.alpha = 0.0;
//        _date_lb.backgroundColor = [UIColor whiteColor];
//        _date_lb.layer.borderColor = [[UIColor orangeColor]CGColor];
//        _date_lb.layer.borderWidth = 0.8;
        _date_lb.textAlignment = NSTextAlignmentCenter;
        self.userInteractionEnabled = YES;
        [self.contentView addSubview:_date_lb];
        [self.contentView addSubview:_signIn_image];
    }
    return self;
}


@end
