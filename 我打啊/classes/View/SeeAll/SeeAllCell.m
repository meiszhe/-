//
//  SeeAllCell.m
//  我打啊
//
//  Created by imac on 15/11/8.
//  Copyright (c) 2015年 张喆. All rights reserved.
//

#import "SeeAllCell.h"

@implementation SeeAllCell

- (void)awakeFromNib {
    // Initialization code
}

#pragma mark - 初始化
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self.contentView addSubview:self.itemName_lb];
        [self.contentView addSubview:self.totalDays_lb];
    }
    return self;
}
#pragma mark - 懒加载
- (UILabel *)itemName_lb
{
    if(!_itemName_lb)
    {
        _itemName_lb = [[UILabel alloc]initWithFrame:CGRectMake(0, self.height/2, self.width/4, self.height/4*3)];
        _itemName_lb.textAlignment = NSTextAlignmentCenter;
        _itemName_lb.font = [UIFont systemFontOfSize:18];
    }
    return _itemName_lb;
}
- (UILabel *)totalDays_lb
{
    if(!_totalDays_lb)
    {
        _totalDays_lb = [[UILabel alloc]initWithFrame:CGRectMake(self.width*3/4, self.height/2, self.width/4, self.height/4*3)];
        _totalDays_lb.textAlignment = NSTextAlignmentCenter;
        _totalDays_lb.font = [UIFont systemFontOfSize:14];
    }
    return _totalDays_lb;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
