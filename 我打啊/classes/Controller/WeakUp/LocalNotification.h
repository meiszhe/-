//
//  LocalNotification.h
//  PeekInspiredTimePicker
//
//  Created by imac on 15/11/9.
//  Copyright (c) 2015年 Adam Cooper. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LocalNotification : UILocalNotification
+ (void)registerLocalNotification:(NSInteger)alertTime;
+ (void)cancelLocalNotificationWithKey:(NSString *)key;
@end
