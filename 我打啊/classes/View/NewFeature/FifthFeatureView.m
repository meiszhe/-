//
//  FifthFeatureView.m
//  我打啊
//
//  Created by imac on 15/11/11.
//  Copyright (c) 2015年 张喆. All rights reserved.
//

#import "FifthFeatureView.h"
#import "AppDelegate.h"
@interface FifthFeatureView ()
@property (nonatomic, strong) UILabel *sLabel;
@property (nonatomic, strong) UIButton *turn_bt;
@end

@implementation FifthFeatureView
- (instancetype)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
    {
        self.backgroundColor = [UIColor colorWithRed:239 green:130 blue:238];
        [self addSubview:self.sLabel];
        [self addSubview:self.turn_bt];
//        [self setAlpha:0.6];
        
    }
    return self;
    //return [[[NSBundle mainBundle]loadNibNamed:@"FifthFeatureView" owner:self options:nil]firstObject];
}
- (UILabel *)sLabel
{
    if(!_sLabel)
    {
        _sLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 300, 235,250)];
        _sLabel.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"welcome.gif"]];
    }
    return _sLabel;
}
- (UIButton *)turn_bt
{
    if(!_turn_bt)
    {
        _turn_bt = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 150, 40)];
        _turn_bt.backgroundColor = [UIColor colorWithRed:255 green:255 blue:84];
        [_turn_bt setTitle:@"进入小鸡打卡" forState:UIControlStateNormal];
        [_turn_bt setTitleColor:[UIColor colorWithRed:239 green:130 blue:238] forState:UIControlStateNormal];
//        [_turn_bt setAlpha:0.7];
        _turn_bt.layer.cornerRadius = 10;
        [_turn_bt addTarget:self action:@selector(clickTurn:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _turn_bt;
}
- (void)clickTurn:(UIButton *)sender
{
    AppDelegate *app = (AppDelegate *)[UIApplication sharedApplication].delegate;
    [app buildNav];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
