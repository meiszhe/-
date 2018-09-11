//
//  AppDelegate.h
//  我打啊
//
//  Created by imac on 15/10/17.
//  Copyright (c) 2015年 张喆. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WaDaViewController.h"
#import "MainViewController.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic,strong) WaDaViewController *wada;
@property (nonatomic,strong) MainViewController *mainView;

- (void)buildNav;

@end

