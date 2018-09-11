//
//  SignInCalendar.h
//  我打啊
//
//  Created by imac on 15/10/26.
//  Copyright (c) 2015年 张喆. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface SignInCalendar : UIView<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *collection;
@property (nonatomic, strong) UILabel *month_lb;
@property (nonatomic, strong) UIButton *left_bt;
@property (nonatomic, strong) UIButton *right_bt;
@property (nonatomic, strong) NSDate *date;
@property (nonatomic, strong) NSDate *today;
@property (nonatomic, strong) NSArray *dateArr;
@property (nonatomic, strong) NSMutableArray *monthArr;
@property (nonatomic, strong) NSMutableArray *sdayArr;
@property (nonatomic, strong) NSArray *viewTotalDate;
@property (nonatomic, copy) NSString *itemName;


//- (instancetype)initWithToday:(NSDate *)today;


@end
