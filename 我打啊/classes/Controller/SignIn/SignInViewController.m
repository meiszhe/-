//
//  SignInViewController.m
//  我打啊
//
//  Created by imac on 15/10/26.
//  Copyright (c) 2015年 张喆. All rights reserved.
//

#import "SignInViewController.h"
#import "SignInModel.h"
#import "PersonInfoModel.h"

#define mainx [UIScreen mainScreen].bounds.size.width
#define mainy [UIScreen mainScreen].bounds.size.height

@interface SignInViewController ()

@property (nonatomic, strong) NSDate *currentDate;
@property (nonatomic, strong) NSMutableArray *allArr;
@property (nonatomic, strong) NSArray *flagDate;
@property (nonatomic, copy) NSString *flagItemName;
@property (nonatomic, copy) NSString *itemName;
@property (nonatomic, strong) PersonInfoModel *proModel;
@property (nonatomic, strong) UIBarButtonItem *backItem;
@property (nonatomic, strong) UILabel *title_lb;

@end

@implementation SignInViewController

#pragma mark - viewDidLoad
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //侧滑返回
    self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    
    self.navigationItem.titleView = self.title_lb;
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bac_allMain.jpg"]];
    
    //传递用户数据
    [self seeAllFile];
    self.signInCalendar.viewTotalDate = self.flagDate;
    self.signInCalendar.itemName = self.itemName;
    
    //加载视图
    [self loadMyViews];
    self.view.userInteractionEnabled = YES;
    
    //接收通知
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(calendarOb:) name:@"signed" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(pickerItemName:) name:@"ItemNameDidChanged" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(selectSeeAll:) name:@"DidSelectSeeAllTable" object:nil];
}

#pragma mark - 接受通知
- (void)calendarOb:(NSNotification *)noti
{
    NSString *date = noti.userInfo[@"signedDate"];
    NSArray *arr = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *path = [arr[0] stringByAppendingPathComponent:@"PersonMation.plist"];
//    NSLog(@"%@",path);
    self.allArr = [NSMutableArray arrayWithContentsOfFile:path];
    for (NSDictionary *dic in self.allArr) {
        if([dic[@"itemName"] isEqualToString:self.itemName])
        {
            self.proModel = [PersonInfoModel objectWithKeyValues:dic];
            [self.proModel.totalDate addObject:date];
            self.proModel.allDays += 1;
            self.signInCalendar.viewTotalDate = self.proModel.totalDate;
            [dic setValuesForKeysWithDictionary:[self.proModel keyValues]];
        }
    }
    [self.allArr writeToFile:path atomically:YES];
}
- (void)pickerItemName:(NSNotification *)noti
{
    self.itemName = noti.userInfo[@"pickerItemName"];
    self.signInCalendar.itemName = self.itemName;
}
- (void)selectSeeAll:(NSNotification *)noti
{
//    self.signInCalendar.itemName = noti.userInfo[@"didSelectItemName"];
    NSInteger row = [noti.userInfo[@"selectRow"] integerValue];
    [self.pickItemName.pickName selectRow:row inComponent:0 animated:YES];
    self.itemName = noti.userInfo[@"didSelectItemName"];
    self.signInCalendar.itemName = self.itemName;
//    NSLog(@"%ld",(long)row);
}
#pragma mark - 遍历plist
- (void)seeAllFile
{
    NSArray *arr = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *path = [arr[0] stringByAppendingPathComponent:@"PersonMation.plist"];
    self.allArr = [NSMutableArray arrayWithContentsOfFile:path];
//    NSLog(@"%@",path);
    self.itemName = [self.allArr firstObject][@"itemName"];
    for (NSDictionary *dic in self.allArr) {
        if([dic[@"itemName"] isEqualToString:self.itemName])
        {
            self.proModel = [PersonInfoModel objectWithKeyValues:dic];
            self.flagDate = self.proModel.totalDate;
//            self.flagItemName = self.proModel.itemName;
        }
    }
}
#pragma mark - 添加视图
- (void)loadMyViews
{
    [self.view addSubview:self.pickItemName];
    [self.view addSubview:self.signInCalendar];
    
    self.navigationItem.leftBarButtonItem = self.backItem;
}
- (UILabel *)title_lb
{
    if(!_title_lb)
    {
        _title_lb = [[UILabel alloc]initWithFrame:CGRectMake(0, 4, 140, 41)];
        _title_lb.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"icon_nav_signin.png"]];
    }
    return _title_lb;
}
#pragma mark - 懒加载
- (UIBarButtonItem *)backItem
{
    if(!_backItem)
    {
        _backItem = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStyleDone target:self action:@selector(clickBack)];
    }
    return _backItem;
}
- (NSDate *)currentDate
{
    if(!_currentDate)
    {
        NSDate *date = [NSDate date];
        NSTimeZone *zone = [NSTimeZone systemTimeZone];
        NSInteger dateDistance = [zone secondsFromGMTForDate:date];
        _currentDate = [date dateByAddingTimeInterval:dateDistance];
    }
    return _currentDate;
}
- (NSMutableArray *)allArr
{
    if(!_allArr)
    {
        _allArr = [NSMutableArray array];
    }
    return _allArr;
}
- (SignInCalendar *)signInCalendar
{
    if(!_signInCalendar)
    {
        _signInCalendar = [[SignInCalendar alloc]initWithFrame:CGRectMake(0, self.pickItemName.y+self.pickItemName.height, mainx,(mainy-44)*2/3)];
        _signInCalendar.today = [NSDate date];
        _signInCalendar.date = _signInCalendar.today;
        _signInCalendar.userInteractionEnabled = YES;
    }
    return _signInCalendar;
}
- (PickerItemName *)pickItemName
{
    if(!_pickItemName)
    {
        _pickItemName = [[PickerItemName alloc]initWithFrame:CGRectMake(0, 44, mainx, (mainy-44)/3)];
    }
    return _pickItemName;
}
#pragma mark - 点击方法
- (void)clickBack
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
