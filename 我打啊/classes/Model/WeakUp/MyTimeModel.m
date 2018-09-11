//
//  MyTimeModel.m
//  PeekInspiredTimePicker
//
//  Created by imac on 15/11/7.
//  Copyright (c) 2015年 Adam Cooper. All rights reserved.
//

#import "MyTimeModel.h"

@implementation MyTimeModel
-(NSMutableArray *)timeArr
{
    if(!_timeArr)
    {
        NSArray *arr = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
        NSString *path = [arr[0] stringByAppendingPathComponent:@"Time.plist"];
//        NSLog(@"%@",path);
        self.timeArr = [NSMutableArray array];
        self.timeArr = [NSMutableArray arrayWithContentsOfFile:path];
    }
    return _timeArr;
}
@end
