//
//  SignInBt.m
//  我打啊
//
//  Created by imac on 15/10/26.
//  Copyright (c) 2015年 张喆. All rights reserved.
//

#import "SignInBt.h"

@interface SignInBt ()
@property (nonatomic, strong) UILabel *img_lb;
@end

@implementation SignInBt

- (instancetype)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
    {
        self.imageView.contentMode = UIViewContentModeCenter;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont systemFontOfSize:20];
        [self addSubview:self.img_lb];
//        [self setTitle:@"签到" forState:UIControlStateNormal];
        [self setTitleColor:[UIColor colorWithRed:244 green:112 blue:45] forState:UIControlStateNormal];
//        self.backgroundColor = [UIColor greenColor];
        UIImage *orignal = [UIImage imageNamed:@"icon_signin.png"];
        orignal = [orignal stretchableImageWithLeftCapWidth:floorf(orignal.size.width) topCapHeight:floorf(orignal.size.height)];
        [self setImage:orignal forState:UIControlStateNormal];
//        [self setBackgroundImage:orignal forState:UIControlStateNormal];
//        [self setImage:[UIImage imageNamed:@"icon_signin.png"] forState:UIControlStateNormal];
        [self addTarget:self action:@selector(turnToSignIn:) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}
- (UILabel *)img_lb
{
    if(!_img_lb)
    {
        _img_lb = [[UILabel alloc]initWithFrame:self.titleLabel.bounds];
        UIImage *image = [UIImage imageNamed:@"main_sign.png"];
        image = [image stretchableImageWithLeftCapWidth:floorf(image.size.width) topCapHeight:floorf(image.size.height)];
        [_img_lb setBackgroundColor:[UIColor colorWithPatternImage:image]];
//        _img_lb.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"main_sign.png"]];
    }
    return _img_lb;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    self.imageView.frame = CGRectMake(0, 0, self.width, self.height-self.height/6);
    self.titleLabel.frame = CGRectMake(0, self.imageView.height, self.imageView.width, self.height/6);
    self.img_lb.frame = CGRectMake(self.titleLabel.origin.x+self.titleLabel.width/5, self.titleLabel.origin.y+5, self.titleLabel.width/2, self.titleLabel.height+self.titleLabel.height/2);
}

- (void)turnToSignIn:(UIButton *)sender
{
    [_delegate signIn];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
