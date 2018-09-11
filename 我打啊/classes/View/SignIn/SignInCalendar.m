//
//  SignInCalendar.m
//  我打啊
//
//  Created by imac on 15/10/26.
//  Copyright (c) 2015年 张喆. All rights reserved.
//

#import "SignInCalendar.h"
#import "Cell.h"
#define mainx [UIScreen mainScreen].bounds.size.width
#define mainy [UIScreen mainScreen].bounds.size.height

@interface SignInCalendar ()


@property (nonatomic, assign) BOOL isIn;

@end

@implementation SignInCalendar

#pragma mark - 构造器

- (instancetype)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
    {
        [self addSubview:self.month_lb];
        [self addSubview:self.collection];
        self.collection.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bac_allMain.jpg"]];
        [self.month_lb addSubview:self.left_bt];
        [self.month_lb addSubview:self.right_bt];
        self.userInteractionEnabled = YES;
    }
    return self;
}
#pragma mark - 重写set方法
- (void)setItemName:(NSString *)itemName
{
    _itemName = itemName;
    NSDictionary *dic = [PersonTool findPersonWithItemName:itemName];
    self.viewTotalDate = dic[@"totalDate"];
    [self.collection reloadData];
}

#pragma mark - 懒加载

- (UICollectionView *)collection
{
    if(!_collection)
    {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        _collection = [[UICollectionView alloc]initWithFrame:CGRectMake(0, self.month_lb.frame.origin.y+self.month_lb.frame.size.height, mainx, mainy-44-self.month_lb.height) collectionViewLayout:layout];
//        NSLog(@"%d",self.month_lb.bounds.size)
        [_collection registerClass:[Cell class] forCellWithReuseIdentifier:@"dateCell"];
        _collection.dataSource = self;
        _collection.delegate = self;
    }
    return _collection;
}

- (NSMutableArray *)sdayArr
{
    if(!_sdayArr)
    {
        _sdayArr = [NSMutableArray array];
    }
    return _sdayArr;
}

- (NSMutableArray *)monthArr
{
    if(!_monthArr)
    {
        _monthArr = [NSMutableArray array];
    }
    return _monthArr;
}

- (UILabel *)month_lb
{
    if(!_month_lb)
    {
        _month_lb = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, mainx, self.height/6)];
//        NSLog(@"%@",NSStringFromCGRect(_month_lb.frame));
        _month_lb.textAlignment = NSTextAlignmentCenter;
        _month_lb.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bac_allMain.jpg"]];
        _month_lb.textColor = [UIColor colorWithRed:244 green:112 blue:45];

        _month_lb.font = [UIFont systemFontOfSize:30];
        _month_lb.userInteractionEnabled = YES;
    }
    return _month_lb;
}

- (UIButton *)left_bt
{
    if(!_left_bt)
    {
        _left_bt = [[UIButton alloc]initWithFrame:CGRectMake(mainx/17, 0, mainx/6, self.month_lb.height)];
        [_left_bt setImage:[UIImage imageNamed:@"icon_premon"] forState:UIControlStateNormal];
        _left_bt.userInteractionEnabled = YES;
        [_left_bt addTarget:self action:@selector(lastMonth:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _left_bt;
}

- (UIButton *)right_bt
{
    if(!_right_bt)
    {
        _right_bt = [[UIButton alloc]initWithFrame:CGRectMake(mainx-mainx/5, 0, mainx/6, self.month_lb.height)];
         [_right_bt setImage:[UIImage imageNamed:@"icon_nextmon"] forState:UIControlStateNormal];
        _right_bt.userInteractionEnabled = YES;
        [_right_bt addTarget:self action:@selector(nextMonth:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _right_bt;
}

- (NSInteger)day:(NSDate *)date
{
    NSDateComponents *comp = [[NSCalendar currentCalendar]components:(NSCalendarUnitDay|NSCalendarUnitMonth|NSCalendarUnitYear) fromDate:date];
    return comp.day;
}

- (NSInteger)month:(NSDate *)date
{
    NSDateComponents *comp = [[NSCalendar currentCalendar]components:(NSCalendarUnitDay|NSCalendarUnitMonth|NSCalendarUnitYear) fromDate:date];
    return comp.month;
}

- (NSInteger)year:(NSDate *)date
{
    NSDateComponents *comp = [[NSCalendar currentCalendar]components:(NSCalendarUnitDay|NSCalendarUnitMonth|NSCalendarUnitYear) fromDate:date];
    return comp.year;
}

- (void)setDate:(NSDate *)date
{
    _date = date;
    self.month_lb.text = [NSString stringWithFormat:@"%ld - %ld",(long)[self month:_date],(long)[self year:_date]];
    [self.collection reloadData];
}

- (NSArray *)dateArr
{
    if(!_dateArr)
    {
        _dateArr = @[@"日",@"一",@"二",@"三",@"四",@"五",@"六"];
    }
    return _dateArr;
}

#pragma mark - collection代理方法
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 2;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if(section == 0)
    {
        return self.dateArr.count;
    }
    else
    {
        return 42;
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    Cell *cell = [self.collection dequeueReusableCellWithReuseIdentifier:@"dateCell" forIndexPath:indexPath];
    cell.signIn_image.alpha = 0.0;
    if(indexPath.section == 0)
    {
        cell.date_lb.text = self.dateArr[indexPath.row];
        cell.date_lb.textColor = [UIColor colorWithRed:244 green:112 blue:45];
    }
    else
    {
        NSInteger totalDaysThisMonth = [self numberOfDaysInThisMonth:_date];
        NSInteger firstWeekDays = [self firstWeekDays:_date];
        NSInteger day = 0;
        NSInteger i = indexPath.row;
        if(i<firstWeekDays)
        {
            cell.date_lb.text = @"";
        }
        else if (i>firstWeekDays+totalDaysThisMonth-1)
        {
            cell.date_lb.text = @"";
        }
        else
        {
            day = i - firstWeekDays +1;
//            NSLog(@"day:%ld",(long)day);
            cell.date_lb.text = [NSString stringWithFormat:@"%ld",(long)day];
            cell.date_lb.textColor = [UIColor grayColor];
            cell.date_lb.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bac_allMain.jpg"]];
            if([_today isEqualToDate:_date])
            {
                if(day == [self day:_date])
                {
                    cell.date_lb.textColor = [UIColor colorWithRed:97 green:176 blue:279];
                    
                }
                else if (day < [self day:_date])
                {
                    cell.date_lb.textColor = [UIColor blackColor];
                }
            }
            else if ([_today compare:_date] == NSOrderedDescending)
            {
                
                cell.date_lb.textColor = [UIColor blackColor];
                
                
            }
            
            NSString *myDate = [NSString stringWithFormat:@"%ld-%ld-%ld",(long)[self year:_date],(long)[self month:_date],(long)day];
            if([self month:_date] < 10)
            {
                myDate = [NSString stringWithFormat:@"%ld-0%ld-%ld",(long)[self year:_date],(long)[self month:_date],(long)day];
            }
            if(day < 10)
            {
                myDate = [NSString stringWithFormat:@"%ld-%ld-0%ld",(long)[self year:_date],(long)[self month:_date],(long)day];
                if([self month:_date] < 10)
                {
                    myDate = [NSString stringWithFormat:@"%ld-0%ld-0%ld",(long)[self year:_date],(long)[self month:_date],(long)day];
                }
            }
            
//            NSLog(@"mydate:%@",myDate);
//            NSLog(@"viewTotal:%@",[self.viewTotalDate firstObject]);
//            NSLog(@"isequal:%d",[myDate isEqualToString:self.viewTotalDate.firstObject]);
            if([self.viewTotalDate containsObject:myDate])
            {
                cell.signIn_image.alpha = 1.0;
                cell.signIn_image.image = [UIImage imageNamed:@"icon_brockenegg.png"];
            }
        }
    }
    return cell;
}

#pragma mark - 日历高度宽度
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(mainx/7, self.height/8);
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
    
}

#pragma mark - 点击表格
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section == 1)
    {
        NSInteger totalDaysThisMonth = [self numberOfDaysInThisMonth:self.date];
        NSInteger firstWeekDays = [self firstWeekDays:self.date];
        NSInteger day = 0;
        NSInteger i = indexPath.row;
        if(i>=firstWeekDays && i<=firstWeekDays + totalDaysThisMonth - 1)
        {
            day = i - firstWeekDays + 1;
            if([_today isEqualToDate:_date])
            {
                if(day == [self day:_date])
                {
                    return YES;
                }
            }
        }
    }
    return NO;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger firstWeekDays = [self firstWeekDays:self.date];
    NSInteger month = [self month:self.date];
    NSInteger day = 0;
    NSInteger i = indexPath.row;
    day = i - firstWeekDays + 1;
    [self.monthArr addObject:@(month)];
    [self.sdayArr addObject:@(day)];
//    NSLog(@"day=%ld",day);
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSString *myDate = [formatter stringFromDate:self.today];
    NSLog(@"mymy-%@",myDate);
    for (NSDictionary *dic in [PersonTool allPersonInfo]) {
        if([dic[@"itemName"] isEqualToString:self.itemName])
        {
            if(![dic[@"totalDate"] containsObject:myDate])
            {
                [[NSNotificationCenter defaultCenter]postNotificationName:@"signed" object:nil userInfo:@{@"signedDate":myDate,@"itemName":self.itemName}];
                [self.collection reloadData];
            }
        }
    }
    [self.collection reloadItemsAtIndexPaths:@[indexPath]];

}

#pragma mark - 日历私有方法
- (NSInteger)numberOfDaysInThisMonth:(NSDate *)date
{
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSInteger days = [cal rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:date].length;
    return days;
}

- (NSInteger)firstWeekDays:(NSDate *)date
{
    NSCalendar *cal = [NSCalendar currentCalendar];
    [cal setFirstWeekday:1];
    NSDateComponents *comp = [cal components:(NSCalendarUnitDay|NSCalendarUnitMonth|NSCalendarUnitYear) fromDate:date];
    [comp setDay:1];
    NSDate *nowDate = [cal dateFromComponents:comp];
    NSInteger firstWeekday = [cal ordinalityOfUnit:NSCalendarUnitWeekday inUnit:NSCalendarUnitWeekOfMonth forDate:nowDate];
//    NSLog(@"0000%ld",firstWeekday-1);
    return firstWeekday - 1;
}

- (NSDate *)daysInLastMonth:(NSDate *)date
{
    NSDateComponents *comp = [[NSDateComponents alloc]init];
    comp.month = -1;
    NSDate *lastDate = [[NSCalendar currentCalendar]dateByAddingComponents:comp toDate:date options:0];
    return lastDate;
}

- (NSDate *)daysInNextMonth:(NSDate *)date
{
    NSDateComponents *comp = [[NSDateComponents alloc]init];
    comp.month = +1;
    NSDate *nextDate = [[NSCalendar currentCalendar]dateByAddingComponents:comp toDate:date options:0];
    return nextDate;
}

#pragma mark - 按钮点击方法
- (void)lastMonth:(UIButton *)sender
{
    [UIView transitionWithView:(UIView *)self duration:0.5 options:UIViewAnimationOptionTransitionCurlDown animations:^{
        self.date = [self daysInLastMonth:self.date];
    } completion:nil];
}

- (void)nextMonth:(UIButton *)sender
{
    [UIView transitionWithView:(UIView *)self duration:0.5 options:UIViewAnimationOptionTransitionCurlUp animations:^{
        self.date = [self daysInNextMonth:self.date];
    } completion:nil];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
