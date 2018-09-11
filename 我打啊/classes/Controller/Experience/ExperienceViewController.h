//
//  ExperienceViewController.h
//  我打啊
//
//  Created by imac on 15/10/17.
//  Copyright (c) 2015年 张喆. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ReloadView.h"
@interface ExperienceViewController : UIViewController<UITableViewDataSource, UITableViewDelegate, ReloadView>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIBarButtonItem *add;
@property (nonatomic, strong) UIBarButtonItem *back;

@end
