//
//  SeeAllBt.m
//  我打啊
//
//  Created by imac on 15/10/17.
//  Copyright (c) 2015年 张喆. All rights reserved.
//

#import "SeeAllBt.h"

@interface SeeAllBt ()
@property (nonatomic, strong) UILabel *img_lb;
@end

@implementation SeeAllBt

- (instancetype)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
    {
        self.imageView.contentMode = UIViewContentModeCenter;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.img_lb];
        self.titleLabel.font = [UIFont systemFontOfSize:20];
//        [self setTitle:@"所有" forState:UIControlStateNormal];
        [self setTitleColor:[UIColor colorWithRed:244 green:112 blue:45] forState:UIControlStateNormal];
//        self.backgroundColor = [UIColor greenColor];
        UIImage *orignal = [UIImage imageNamed:@"icon_chick2.gif"];
        orignal = [orignal stretchableImageWithLeftCapWidth:floorf(orignal.size.width) topCapHeight:floorf(orignal.size.height)];
        [self setBackgroundImage:orignal forState:UIControlStateNormal];
//        [self setImage:[UIImage imageNamed:@"icon_chick2.gif"] forState:UIControlStateNormal];
        [self addTarget:self action:@selector(turnToSeeAll:) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}
- (UILabel *)img_lb
{
    if(!_img_lb)
    {
        _img_lb = [[UILabel alloc]initWithFrame:self.titleLabel.bounds];
        UIImage *image = [UIImage imageNamed:@"main_list.png"];
        image = [image stretchableImageWithLeftCapWidth:floorf(image.size.width) topCapHeight:floorf(image.size.height)];
        [_img_lb setBackgroundColor:[UIColor colorWithPatternImage:image]];
//        _img_lb.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"main_list.png"]];
    }
    return _img_lb;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
//    self.imageView.frame = CGRectMake(0, 0, self.width, self.height-30);
//    self.titleLabel.frame = CGRectMake(0, self.imageView.height, self.imageView.width, 30);
//    self.img_lb.frame = CGRectMake(self.titleLabel.origin.x+10, self.titleLabel.origin.y+5, self.titleLabel.width, self.titleLabel.height);
    self.imageView.frame = CGRectMake(0, 0, self.width, self.height-self.height/6);
    self.titleLabel.frame = CGRectMake(0, self.imageView.height, self.imageView.width, self.height/5);
    self.img_lb.frame = CGRectMake(self.titleLabel.origin.x+self.titleLabel.width/5, self.titleLabel.origin.y, self.titleLabel.width*4/5, self.titleLabel.height);
}

- (void)turnToSeeAll:(UIButton *)sender
{
    [self.delegate turnSeeAll];
}
@end
