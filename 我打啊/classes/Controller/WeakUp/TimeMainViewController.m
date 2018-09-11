//
//  MainViewController.m
//  PeekInspiredTimePicker
//
//  Created by imac on 15/11/7.
//  Copyright (c) 2015年 Adam Cooper. All rights reserved.
//

#import "TimePickViewController.h"
#import "TimeMainViewController.h"
#import "MyTimeModel.h"
#import "LocalNotification.h"
@interface TimeMainViewController ()

@property (nonatomic, strong) UIBarButtonItem *itemAdd;
@property (nonatomic, strong) UIBarButtonItem *itemDelete;
@property (nonatomic, strong) UILabel *title_lb;

@end

@implementation TimeMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //侧滑返回
    self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    
    [self.view addSubview:self.tableView];
    self.navigationItem.titleView = self.title_lb;

    
    self.itemAdd = [[UIBarButtonItem alloc]initWithTitle:@"添加" style:UIBarButtonItemStylePlain target:self action:@selector(addMore)];
    
    self.itemDelete = [[UIBarButtonItem alloc]initWithTitle:@"删除 |" style:UIBarButtonItemStyleDone target:self action:@selector(click)];
    self.navigationItem.rightBarButtonItems = @[self.itemAdd,self.itemDelete];
    
    UIBarButtonItem *itemBack = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStyleDone target:self action:@selector(clickBack)];
    self.navigationItem.leftBarButtonItem = itemBack;

    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(recieveCheck:) name:@"CheckNotification" object:nil];
    
    }
-(UITableView *)tableView
{
    if (!_tableView)
    {
        self.tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        //self.tableView.backgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"透明背景.png"]];
        self.tableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bac_allMain.jpg"]];
        self.tableView.dataSource = self;
        self.tableView.delegate = self;
    }
    return _tableView;
}
- (UILabel *)title_lb
{
    if(!_title_lb)
    {
        _title_lb = [[UILabel alloc]initWithFrame:CGRectMake(0, 4, 140, 41)];
        _title_lb.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"icon_nav_weakup.png"]];
    }
    return _title_lb;
}
#pragma mark - 点击事件
-(void)click
{
    self.tableView.tag = UITableViewCellEditingStyleDelete;
    BOOL edit = self.tableView.editing;
    [self.tableView setEditing:!edit animated:YES];
    if(self.tableView.editing)
    {
        [self.itemDelete setTitle:@"取消 |"];
    }
    else
    {
        [self.itemDelete setTitle:@"删除 |"];
    }
}
- (void)clickBack
{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)addMore
{
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    TimePickViewController *pick = [storyBoard instantiateInitialViewController];
    [self presentViewController:pick animated:YES completion:^{
        
        
    }];
}
-(void)recieveCheck:(NSNotification *)noti
{
//    if (noti.object) {
        [self.tableView reloadData];
//    }
}
#pragma mark - 数据源方法
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    MyTimeModel *model = [[MyTimeModel alloc]init];
    return model.timeArr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    MyTimeModel *model = [[MyTimeModel alloc]init];
    NSDate *date = model.timeArr[indexPath.row];
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
        [formatter setDateFormat:@" HH:mm"];
        NSString *now = [formatter stringFromDate:date];
    cell.textLabel.text = now;
    cell.textLabel.textColor = [UIColor colorWithRed:244 green:112 blue:45];
    cell.textLabel.font = [UIFont systemFontOfSize:70];
    cell.textLabel.textAlignment = NSTextAlignmentRight;
    cell.backgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bac_allMain.jpg"]];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

//    cell.selectedBackgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"6.png"]];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 180;
}
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        MyTimeModel *model = [[MyTimeModel alloc]init];
        NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
        NSDate *date = model.timeArr[indexPath.row];
        [formatter setDateFormat:@" yyyy/MM/dd HH"];
        NSString *now = [formatter stringFromDate:date];
        
//        NSLog(@"cancel======%@",now);
        [LocalNotification cancelLocalNotificationWithKey:[NSString stringWithFormat:@"%@",now]];
        
        [model.timeArr removeObjectAtIndex:indexPath.row];
        NSArray *arr = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
        NSString *way = [arr[0] stringByAppendingPathComponent:@"Time.plist"];
        [model.timeArr writeToFile:way atomically:YES];
        
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
        
    }

}
-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return self.tableView.tag;
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
