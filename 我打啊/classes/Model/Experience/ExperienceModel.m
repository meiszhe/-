//
//  ExperienceModel.m
//  我打啊
//
//  Created by imac on 15/10/17.
//  Copyright (c) 2015年 张喆. All rights reserved.
//

#import "ExperienceModel.h"
#import "ExObb.h"
@implementation ExperienceModel
#pragma mark - 取模型层
+ (ExperienceModel *)modelWithDic:(NSMutableDictionary *)dic
{
    ExperienceModel *model = [[ExperienceModel alloc]init];
   [model setValuesForKeysWithDictionary:dic];
    return model;
}

- (NSMutableArray *)dataArr
{
    if(!_dataArr)
    {
        _dataArr = [NSMutableArray array];
    }
    return _dataArr;
}

#pragma mark - 模型层存入沙盒
//- (instancetype)initWithDic:(NSMutableDictionary *)dic
//{
//    if(self = [super init])
//    {
//        NSArray *arr = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
//        NSString *path = [arr[0] stringByAppendingPathComponent:@"Experience.plist"];
//        self.dataArr = [NSMutableArray arrayWithContentsOfFile:path];
//        [self.dataArr addObject:dic];
//        [self.dataArr writeToFile:path atomically:YES];
////        NSLog(@"%@",arr[0]);
//    }
//    return self;
//}
- (void)addDataInModel:(NSMutableDictionary *)dic
{
    NSArray *arr = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *path = [arr[0] stringByAppendingPathComponent:@"Experience.plist"];
    self.dataArr = [NSMutableArray arrayWithContentsOfFile:path];
    [self.dataArr addObject:dic];
    [self.dataArr writeToFile:path atomically:YES];
}

@end
