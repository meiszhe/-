//
//  FourthFeatureView.m
//  我打啊
//
//  Created by imac on 15/11/11.
//  Copyright (c) 2015年 张喆. All rights reserved.
//

#import "FourthFeatureView.h"

@interface FourthFeatureView ()
@property (nonatomic, strong) UILabel *fLabel;
@property (nonatomic, strong) UILabel *sLabel;
@end

@implementation FourthFeatureView
- (instancetype)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
    {
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"签到.png"]];
        [self addSubview:self.fLabel];
        [self addSubview:self.sLabel];
    }
    return self;
//    return [[[NSBundle mainBundle]loadNibNamed:@"FourthFeatureView" owner:self options:nil]firstObject];
}
- (UILabel *)fLabel
{
    if(!_fLabel)
    {
        _fLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 100, 250, 160)];
        _fLabel.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"nav_Background_meitu_25.png"]];
    }
    return _fLabel;
}
- (UILabel *)sLabel
{
    if(!_sLabel)
    {
        _sLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 260, 300, 250)];
        _sLabel.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"nav_Background_meitu_24.png"]];
    }
    return _sLabel;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
