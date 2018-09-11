//
//  SecondFeatureView.m
//  我打啊
//
//  Created by imac on 15/11/11.
//  Copyright (c) 2015年 张喆. All rights reserved.
//

#import "SecondFeatureView.h"

@interface SecondFeatureView ()

@property (nonatomic, strong) UILabel *fLabel;

@end

@implementation SecondFeatureView
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"心得.png"]];
        [self setAlpha:0.7];
        [self addSubview:self.fLabel];
    }

//    return [[[NSBundle mainBundle]loadNibNamed:@"SecondFeatureView" owner:self options:nil]firstObject];
    return self;
}
- (UILabel *)fLabel
{
    if(!_fLabel)
    {
        _fLabel = [[UILabel alloc]initWithFrame:CGRectMake(30, 250, 350, 300)];
        _fLabel.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"icon_newFeature3.png"]];
    }
    return _fLabel;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
