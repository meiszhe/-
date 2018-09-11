//
//  MainViewController.h
//  PeekInspiredTimePicker
//
//  Created by imac on 15/11/7.
//  Copyright (c) 2015年 Adam Cooper. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TimeMainViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) UITableView *tableView;
@end
