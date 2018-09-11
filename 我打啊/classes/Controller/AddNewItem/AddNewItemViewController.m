//
//  AddNewItemViewController.m
//  我打啊
//
//  Created by imac on 15/10/26.
//  Copyright (c) 2015年 张喆. All rights reserved.
//

#import "AddNewItemViewController.h"
#import "NSObject+MJKeyValue.h"
#import "PersonInfoModel.h"
#define mainx [UIScreen mainScreen].bounds.size.width
#define mainy [UIScreen mainScreen].bounds.size.height
@interface AddNewItemViewController ()<UITextFieldDelegate>

@property (nonatomic, strong) NSMutableDictionary *dataDic;
@property (nonatomic, strong) NSMutableArray *allArr;
@property (nonatomic, strong) NSDate *nowDate;
@property (nonatomic, strong) UILabel *chick_lb;
@property (nonatomic, strong) UILabel *title_lb;

@end

@implementation AddNewItemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.titleView = self.title_lb;

    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bac_allMain.jpg"]];
    self.navigationItem.leftBarButtonItem = self.complete_bt;
    [self.view addSubview:self.addItem_tf];
    [self.view addSubview:self.chick_lb];
    
    //侧滑返回
    self.navigationController.interactivePopGestureRecognizer.enabled = YES;
}
#pragma mark - 懒加载
- (UITextField *)addItem_tf
{
    if(!_addItem_tf)
    {
        _addItem_tf = [[UITextField alloc]initWithFrame:CGRectMake(0, mainy/7, mainx, mainy/4)];
        _addItem_tf.placeholder = @"快输入你要坚持类型的名字吧";
        _addItem_tf.font = [UIFont systemFontOfSize:40];
        _addItem_tf.adjustsFontSizeToFitWidth = YES;
        _addItem_tf.delegate = self;
        _addItem_tf.background = [UIImage imageNamed:@"bac_textview.png"];
//        NSLog(@"%@",NSStringFromCGRect(_addItem_tf.frame));
    }
    return _addItem_tf;
}
- (UILabel *)title_lb
{
    if(!_title_lb)
    {
        _title_lb = [[UILabel alloc]initWithFrame:CGRectMake(0, 4, 180, 41)];
        _title_lb.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"icon_nav_additem.png"]];
    }
    return _title_lb;
}
- (UILabel *)chick_lb
{
    if(!_chick_lb)
    {
        _chick_lb = [[UILabel alloc]initWithFrame:CGRectMake(170, self.view.height-300, 230, 300)];
        _chick_lb.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"icon_aimto.png"]];
    }
    return _chick_lb;
}

- (NSDate *)nowDate
{
    if(!_nowDate)
    {
        _nowDate = [NSDate date];
    }
    return _nowDate;
}

- (NSMutableDictionary *)dataDic
{
    if(!_dataDic)
    {
        _dataDic = [NSMutableDictionary dictionary];
    }
    return _dataDic;
}

- (UIBarButtonItem *)complete_bt
{
    if(!_complete_bt)
    {
        _complete_bt = [[UIBarButtonItem alloc]initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(clickComplete)];
    }
    return _complete_bt;
}

- (NSMutableArray *)allArr
{
    if(!_allArr)
    {
        _allArr = [NSMutableArray array];
    }
    return _allArr;
}
#pragma mark - 代理方法实现
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

#pragma mark - 点击方法
- (void)clickComplete
{
    PersonInfoModel *model = [PersonInfoModel modelChange];
    model.itemName = self.addItem_tf.text;
    model.allDays = 0;
    model.beginDate = self.nowDate;
    NSDictionary *modelDic = [model keyValues];
    NSString *path = [self getOutFile];
    [self.allArr addObject:modelDic];
    if(![model.itemName isEqualToString:@""])
    {
        [self.allArr writeToFile:path atomically:YES];
    }
    
    [self.navigationController popViewControllerAnimated:YES];
}



#pragma mark - 存入获取文件
- (NSString *)getOutFile
{
    NSArray *arr = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *path = [arr[0] stringByAppendingPathComponent:@"PersonMation.plist"];
    self.allArr = [NSMutableArray arrayWithContentsOfFile:path];
//    NSLog(@"%@",path);
    return path;
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
