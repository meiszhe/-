//
//  LocalNotification.m
//  PeekInspiredTimePicker
//
//  Created by imac on 15/11/9.
//  Copyright (c) 2015年 Adam Cooper. All rights reserved.
//

#import "LocalNotification.h"

@implementation LocalNotification
#pragma mark - 本地推送
+ (void)registerLocalNotification:(NSInteger)alertTime
{
    
    
    UILocalNotification *notification = [[UILocalNotification alloc] init];
    // 设置触发通知的时间
//    NSLog(@"%@",[NSDate date]);
    NSDate *fireDate = [NSDate dateWithTimeIntervalSinceNow:alertTime];
    notification.fireDate = fireDate;
//    NSLog(@"firedate======%@",fireDate);
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@" yyyy/MM/dd HH"];
    NSString *now = [formatter stringFromDate:fireDate];
   
    // 通知被触发时播放的声音
    notification.soundName = UILocalNotificationDefaultSoundName;
    // 时区
//    notification.timeZone = [NSTimeZone defaultTimeZone];
    notification.userInfo = [NSDictionary dictionaryWithObject:fireDate forKey:now];
//     NSLog(@"now=====%@",now);
    
    // 设置重复的间隔
    notification.repeatInterval = kCFCalendarUnitDay;
    
    notification.alertAction = @"现在就去";

    // 通知内容
    notification.alertBody = @"快来坚持一下！";
    NSInteger badgeNumber = notification.applicationIconBadgeNumber;
    badgeNumber++;
    notification.applicationIconBadgeNumber = badgeNumber;
    // ios8后，需要添加这个注册，才能得到授权
    if ([[UIApplication sharedApplication] respondsToSelector:@selector(registerUserNotificationSettings:)]) {
        UIUserNotificationType type =  UIUserNotificationTypeAlert | UIUserNotificationTypeBadge | UIUserNotificationTypeSound;
        UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:type
                                                                                 categories:nil];
        [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
        notification.repeatInterval = kCFCalendarUnitDay;
        // 执行通知注册
        [[UIApplication sharedApplication] scheduleLocalNotification:notification];
    }
    
}

// 取消某个本地推送通知
+ (void)cancelLocalNotificationWithKey:(NSString *)key {
    // 获取所有本地通知数组
    NSArray *localNotifications = [UIApplication sharedApplication].scheduledLocalNotifications;
    
    for (UILocalNotification *notification in localNotifications) {
        //删除本地通知
//        [[UIApplication sharedApplication]cancelLocalNotification:notification];
//        NSLog(@"都删除了");
        NSDictionary *userInfo = notification.userInfo;
        if (userInfo) {
            // 根据设置通知参数时指定的key来获取通知参数
            NSString *info = userInfo[key];
            
            // 如果找到需要取消的通知，则取消
            if (info != nil) {
                [[UIApplication sharedApplication] cancelLocalNotification:notification];
                break;
            }
        }
    }
}
@end
