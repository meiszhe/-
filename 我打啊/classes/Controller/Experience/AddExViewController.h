//
//  AddExViewController.h
//  我打啊
//
//  Created by imac on 15/10/17.
//  Copyright (c) 2015年 张喆. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ReloadView.h"



@interface AddExViewController : UIViewController<UITextViewDelegate>

@property (nonatomic, strong) UITextView *textView;
@property (nonatomic, strong) UITextView *twpTextView;
@property (nonatomic, strong) UIBarButtonItem *complete;
@property (nonatomic, strong) UIBarButtonItem *back;
@property (nonatomic, strong) NSMutableArray *addArr;
@property (nonatomic, strong) NSDate *date;
@property (nonatomic, weak) id<ReloadView> delegate;

@end
