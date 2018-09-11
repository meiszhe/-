//
//  PersonInfoModel.h
//  我打啊
//
//  Created by imac on 15/11/3.
//  Copyright (c) 2015年 张喆. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PersonInfoModel : NSObject

@property (nonatomic, strong) NSString *itemName;
@property (nonatomic, strong) NSMutableArray *totalDate;
@property (nonatomic, assign) NSInteger allDays;
@property (nonatomic, strong) NSDate *beginDate;

+ (instancetype)modelChange;

@end
