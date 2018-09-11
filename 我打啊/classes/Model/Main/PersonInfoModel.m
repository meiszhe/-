//
//  PersonInfoModel.m
//  我打啊
//
//  Created by imac on 15/11/3.
//  Copyright (c) 2015年 张喆. All rights reserved.
//

#import "PersonInfoModel.h"

@implementation PersonInfoModel

+ (instancetype)modelChange
{
    PersonInfoModel *model = [[PersonInfoModel alloc]init];
    return model;
}

- (instancetype)init
{
    if(self = [super init])
    {
        _totalDate = [NSMutableArray array];
    }
    return self;
}

@end
