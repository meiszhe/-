//
//  SignInViewController.h
//  我打啊
//
//  Created by imac on 15/10/26.
//  Copyright (c) 2015年 张喆. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SignInCalendar.h"
#import "PickerItemName.h"
@interface SignInViewController : UIViewController

@property (nonatomic, strong) SignInCalendar *signInCalendar;
@property (nonatomic, strong) PickerItemName *pickItemName;

@end
