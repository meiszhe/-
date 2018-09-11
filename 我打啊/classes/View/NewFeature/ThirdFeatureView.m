//
//  ThirdFeatureView.m
//  我打啊
//
//  Created by imac on 15/11/11.
//  Copyright (c) 2015年 张喆. All rights reserved.
//

#import "ThirdFeatureView.h"

@interface ThirdFeatureView ()
@property (nonatomic, strong) UILabel *fLabel;
@end

@implementation ThirdFeatureView
- (instancetype)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
    {
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"提醒.png"]];
        [self setAlpha:0.7];
        [self addSubview:self.fLabel];
    }
    return self;
//    return [[[NSBundle mainBundle]loadNibNamed:@"ThirdFeatureView" owner:self options:nil]firstObject];
}
- (UILabel *)fLabel
{
    if(!_fLabel)
    {
        _fLabel = [[UILabel alloc]initWithFrame:CGRectMake(60, 300, 300, 320)];
        _fLabel.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"nav_Background_meitu_23.png"]];
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
