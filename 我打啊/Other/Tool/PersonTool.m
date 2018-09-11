//
//  PersonTool.m
//  我打啊
//
//  Created by imac on 15/11/6.
//  Copyright (c) 2015年 张喆. All rights reserved.
//

#import "PersonTool.h"
#import "PersonInfoModel.h"
@implementation PersonTool

static NSString *path;
+ (NSMutableArray *)allPersonInfo
{
    if(path == nil)
    {
        NSArray *arr = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
        path = [arr[0] stringByAppendingPathComponent:@"PersonMation.plist"];
    }
    return [NSMutableArray arrayWithContentsOfFile:path];
}

+ (NSDictionary *)findPersonWithItemName:(NSString *)itemName
{
    NSArray *arr = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    path = [arr[0] stringByAppendingPathComponent:@"PersonMation.plist"];
    NSDictionary *personDic = nil;
    for (NSDictionary *dic in [NSArray arrayWithContentsOfFile:path]) {
        if([dic[@"itemName"] isEqualToString:itemName])
        {
            personDic = dic;
        }
    }
    return personDic;
}

+ (NSInteger)findAllDaysWithItemName:(NSString *)itemName
{
    NSArray *arr = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    path = [arr[0] stringByAppendingPathComponent:@"PersonMation.plist"];
    NSInteger proAllDays = 0;
    for (NSDictionary *dic in [NSArray arrayWithContentsOfFile:path]) {
        if([dic[@"itemName"] isEqualToString:itemName])
        {
            proAllDays = [dic[@"allDays"] integerValue];
        }
    }
    return proAllDays;
}

+ (PersonInfoModel *)moedlWithItemName:(NSString *)itemName
{
    NSArray *arr = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    path = [arr[0] stringByAppendingPathComponent:@"PersonMation.plist"];
    PersonInfoModel *model = nil;
    for (NSDictionary *dic in [NSArray arrayWithContentsOfFile:path]) {
        if([dic[@"itemName"] isEqualToString:itemName])
        {
            model = [PersonInfoModel objectWithKeyValues:dic];
        }
    }
    return model;
}

+ (void)writeInMyFile:(NSMutableArray *)person
{
    [person writeToFile:path atomically:YES];
}

@end
