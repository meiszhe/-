//
//  FirstFeatureView.m
//  我打啊
//
//  Created by imac on 15/11/11.
//  Copyright (c) 2015年 张喆. All rights reserved.
//

#import "FirstFeatureView.h"

@interface FirstFeatureView ()
@property (nonatomic, strong) UIImageView *fImage;
@property (nonatomic, strong) UILabel *fLabel;
@property (nonatomic, strong) UIImageView *sImage;

@end

@implementation FirstFeatureView

- (instancetype)initWithFrame:(CGRect)frame

{
    if (self = [super initWithFrame:frame])
    {
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"主界面.png"]];
        [self setAlpha:0.7];
        [self addSubview:self.fLabel];
        [self addSubview:self.fImage];
    }
//    return [[[NSBundle mainBundle]loadNibNamed:@"FirstFeatureView" owner:self options:nil]firstObject];
    return self;
}
- (UIImageView *)fImage
{
    if(!_fImage)
    {
        _fImage = [[UIImageView alloc]initWithFrame:CGRectMake(10, 220, 375, 200)];
        _fImage.image = [UIImage imageNamed:@"icon_newFeature2.png"];
    }
    return _fImage;
}
- (UILabel *)fLabel
{
    if(!_fLabel)
    {
        _fLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, 300, 300)];
        _fLabel.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"icon_newFeature1.png"]];
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
