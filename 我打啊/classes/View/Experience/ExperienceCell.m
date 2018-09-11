//
//  ExperienceCell.m
//  我打啊
//
//  Created by imac on 15/10/21.
//  Copyright (c) 2015年 张喆. All rights reserved.
//

#import "ExperienceCell.h"
#define mainx [UIScreen mainScreen].bounds.size.width
#define mainy [UIScreen mainScreen].bounds.size.height
#define frontX [UIScreen mainScreen].bounds.size.width/10
@implementation ExperienceCell

- (void)awakeFromNib {
    // Initialization code
    
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self addSubview:self.exDateLabel];
        [self addSubview:self.exContentLabel];
    }
    return self;
}

- (UILabel *)exDateLabel
{
    if(!_exDateLabel)
    {
        _exDateLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 5, mainx, self.frame.size.height/3)];
        _exDateLabel.font = [UIFont systemFontOfSize:12];
    }
    return _exDateLabel;
}

- (UILabel *)exContentLabel
{
    if(!_exContentLabel)
    {
        _exContentLabel = [[UILabel alloc]initWithFrame:CGRectMake(frontX, _exDateLabel.frame.size.height+10, mainx, self.frame.size.height-_exDateLabel.frame.size.height)];
        _exContentLabel.font = [UIFont systemFontOfSize:20];
    }
    return _exContentLabel;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
