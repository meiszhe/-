//
//  PersonTool.h
//  我打啊
//
//  Created by imac on 15/11/6.
//  Copyright (c) 2015年 张喆. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PersonInfoModel.h"
@interface PersonTool : NSObject

+ (NSMutableArray *)allPersonInfo;

+ (NSDictionary *)findPersonWithItemName:(NSString *)itemName;

+ (NSInteger)findAllDaysWithItemName:(NSString *)itemName;

+ (PersonInfoModel *)moedlWithItemName:(NSString *)itemName;

+ (void)writeInMyFile:(NSMutableArray *)person;

@end
