//
//  ExperienceModel.h
//  我打啊
//
//  Created by imac on 15/10/17.
//  Copyright (c) 2015年 张喆. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ExperienceModel : NSObject

@property (nonatomic, strong) NSString *contents;
@property (nonatomic, strong) NSString *date;
@property (nonatomic, strong) NSMutableArray *dataArr;

+ (ExperienceModel *)modelWithDic:(NSMutableDictionary *)dic;
//- (instancetype)initWithDic:(NSMutableDictionary *)dic;
- (void)addDataInModel:(NSMutableDictionary *)dic;
//+ (ExperienceModel *)sharedModel;

@end
