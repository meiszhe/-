//
//  ExObb.m
//  我打啊
//
//  Created by imac on 15/10/18.
//  Copyright (c) 2015年 张喆. All rights reserved.
//

#import "ExObb.h"

@implementation ExObb

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    NSArray *arr = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *path = [arr[0] stringByAppendingPathComponent:@"Experience.plist"];
    NSMutableArray *dataArr = [NSMutableArray arrayWithContentsOfFile:path];
    [dataArr addObject:(__bridge id)(context)];
    [dataArr writeToFile:path atomically:YES];
}

@end
