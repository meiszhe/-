//
//  NSDate+StringWithMatter.m
//  我打啊
//
//  Created by imac on 15/10/21.
//  Copyright (c) 2015年 张喆. All rights reserved.
//

#import "NSDate+StringWithMatter.h"

@implementation NSDate (StringWithMatter)

+ (NSString *)stringWithDate
{
    NSDate *date = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yy-MM-dd HH:mm"];
    return [formatter stringFromDate:date];
}

@end
