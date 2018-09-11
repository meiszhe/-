//
//  SignInModel.m
//  我打啊
//
//  Created by imac on 15/10/27.
//  Copyright (c) 2015年 张喆. All rights reserved.
//

#import "SignInModel.h"

@implementation SignInModel

+ (void)signInModelWithDic:(NSMutableDictionary *)dic
{
//    SignInModel *model = [[SignInModel alloc]initWithDic:dic];
    SignInModel *model = [[SignInModel alloc]init];
    [model configureWithDic:dic];
}

- (void)configureWithDic:(NSMutableDictionary *)dic
{
    [self setValuesForKeysWithDictionary:dic];
}

- (instancetype)initWithDic:(NSMutableDictionary *)dic
{
    if(self = [super init])
    {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}

@end
