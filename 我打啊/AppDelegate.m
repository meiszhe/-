//
//  AppDelegate.m
//  我打啊
//
//  Created by imac on 15/10/17.
//  Copyright (c) 2015年 张喆. All rights reserved.
//

#import "AppDelegate.h"
#import "SignInViewController.h"
#import "NewFeatureViewController.h"

@interface AppDelegate ()<UIAlertViewDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
//    NSString *key = (NSString *)kCFBundleVersionKey;
//    NSDictionary *dic = [NSBundle mainBundle].infoDictionary;
//    NSString *versionstr = dic[key];
//    
//    NSString *versionstring = [[NSUserDefaults standardUserDefaults] objectForKey:key];
//    if([versionstring isEqualToString:versionstr])
//    {
    
    UIApplication *app = [UIApplication sharedApplication];
    UIUserNotificationSettings *notiSettings = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeBadge categories:nil];
    [app registerUserNotificationSettings:notiSettings];
    NSInteger badgeNumber = app.applicationIconBadgeNumber;
    if(badgeNumber > 1)
    {
        badgeNumber -= 1;
    }
    else if (badgeNumber == 1)
    {
        badgeNumber = 0;
    }
    app.applicationIconBadgeNumber = badgeNumber;
    
        [self buildNav];
//    }
//    else
//    {
//        NewFeatureViewController *feature = [[NewFeatureViewController alloc]init];
//        self.window.rootViewController = feature;
//        [[NSUserDefaults standardUserDefaults]setObject:versionstr forKey:key];
//    }
    
    return YES;
}

- (void)buildNav
{
    self.mainView = [[MainViewController alloc]init];
    self.wada = [[WaDaViewController alloc]initWithRootViewController:self.mainView];
    self.window.rootViewController = self.wada;
}
-(void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification
{
//    NSLog(@"收到通知");

    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"小鸡打卡" message:notification.alertBody delegate:self  cancelButtonTitle:@"关闭" otherButtonTitles:notification.alertAction, nil, nil];
    [alert show];
    
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex)
    {
        case 0:
            
        {
            
        }
            break;
            
        default:
        {
            SignInViewController *sign = [[SignInViewController alloc]init];
            UIApplication *app = [UIApplication sharedApplication];
            UIUserNotificationSettings *notiSettings = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeBadge categories:nil];
            [app registerUserNotificationSettings:notiSettings];
            NSInteger badgeNumber = app.applicationIconBadgeNumber;
            if(badgeNumber > 1)
            {
                badgeNumber -= 1;
            }
            else if (badgeNumber == 1)
            {
                badgeNumber = 0;
            }
            app.applicationIconBadgeNumber = badgeNumber;
            [self.mainView.navigationController pushViewController:sign animated:YES];
        }
            break;
    }
    
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
