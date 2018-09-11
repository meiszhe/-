//
//  SeeAllViewController.m
//  我打啊
//
//  Created by imac on 15/11/8.
//  Copyright (c) 2015年 张喆. All rights reserved.
//

#import "SeeAllViewController.h"
#import "SignInViewController.h"
#import "SeeAllCell.h"
@interface SeeAllViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *itemNameArr;
@property (nonatomic, copy) NSString *obbItemName;
@property (nonatomic, assign) NSInteger obbRow;
@property (nonatomic, strong) NSMutableArray *totalDayArr;
@property (nonatomic, strong) UIBarButtonItem *backItem;
@property (nonatomic, strong) UIBarButtonItem *deleteItem;
@property (nonatomic, strong) UILabel *title_lb;

@end

@implementation SeeAllViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.titleView = self.title_lb;

    //侧滑返回
    self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    
    [self.view addSubview:self.tableView];
    self.navigationItem.leftBarButtonItem = self.backItem;
    self.navigationItem.rightBarButtonItem = self.deleteItem;
}

#pragma mark - 懒加载
- (UITableView *)tableView
{
    if(!_tableView)
    {
        _tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
        _tableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bac_allMain.jpg"]];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.dataSource = self;
        _tableView.delegate = self;
    }
    return _tableView;
}
- (UILabel *)title_lb
{
    if(!_title_lb)
    {
        _title_lb = [[UILabel alloc]initWithFrame:CGRectMake(0, 4, 140, 41)];
        _title_lb.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"icon_nav_list.png"]];
    }
    return _title_lb;
}
- (UIBarButtonItem *)backItem
{
    if(!_backItem)
    {
        _backItem = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStyleDone target:self action:@selector(clickBack)];
    }
    return _backItem;
}
- (UIBarButtonItem *)deleteItem
{
    if(!_deleteItem)
    {
        _deleteItem = [[UIBarButtonItem alloc]initWithTitle:@"删除" style:UIBarButtonItemStyleDone target:self action:@selector(clickDelete)];
    }
    return _deleteItem;
}
- (NSMutableArray *)totalDayArr
{
    if(!_totalDayArr)
    {
        for (NSDictionary *dic in [PersonTool allPersonInfo]) {
            NSArray *arr = dic[@"totalDate"];
            [self.totalDayArr addObject:@(arr.count)];
        }
    }
    return _totalDayArr;
}
- (NSMutableArray *)itemNameArr
{
    if(!_itemNameArr)
    {
        _itemNameArr = [NSMutableArray array];
        for (NSDictionary *dic in [PersonTool allPersonInfo]) {
            [self.itemNameArr addObject:[NSString stringWithFormat:@"%@",dic[@"itemName"]]];
//            NSLog(@"%@",dic[@"itemName"]);
        }
    }
    return _itemNameArr;
}
#pragma mark -  数据源方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [PersonTool allPersonInfo].count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *str = @"cell";
    SeeAllCell *cell = [self.tableView dequeueReusableCellWithIdentifier:str];
    if(cell == nil)
    {
        cell = [[SeeAllCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
    }
    cell.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bac_allMain.jpg"]];
    cell.itemName_lb.text = self.itemNameArr[indexPath.row];
    cell.itemName_lb.textColor = [UIColor colorWithRed:244 green:112 blue:45];
    cell.totalDays_lb.text = [NSString stringWithFormat:@"已坚持:%ld天",(long)[PersonTool moedlWithItemName:self.itemNameArr[indexPath.row]].allDays];
    cell.totalDays_lb.textColor = [UIColor colorWithRed:244 green:112 blue:45];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}
#pragma mark - 代理方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.obbItemName = self.itemNameArr[indexPath.row];
    self.obbRow = indexPath.row;
    SignInViewController *signInController = [[SignInViewController alloc]init];
    [self.navigationController pushViewController:signInController animated:YES];
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return self.tableView.tag;
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(editingStyle == UITableViewCellEditingStyleDelete)
    {
        NSMutableArray *person = [NSMutableArray array];
        person = [PersonTool allPersonInfo];
        [person enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            if([obj[@"itemName"] isEqualToString:self.itemNameArr[indexPath.row]])
            {
                *stop = YES;
            }
            if(*stop == YES)
            {
                [self.itemNameArr removeObjectAtIndex:indexPath.row];
                [person removeObject:obj];
            }
        }];
        [PersonTool writeInMyFile:person];
    }
    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}
#pragma mark - 点击方法
- (void)clickBack
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}
- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    if(self.obbItemName!=nil)
    {
        [[NSNotificationCenter defaultCenter]postNotificationName:@"DidSelectSeeAllTable" object:nil userInfo:@{@"didSelectItemName":self.obbItemName,@"selectRow":@(self.obbRow)}];
    }
    
}
- (void)clickDelete
{
    self.tableView.tag = UITableViewCellEditingStyleDelete;
    BOOL isEdting = self.tableView.editing;
    [self.tableView setEditing:!isEdting];
    if (self.tableView.editing) {
        [self.deleteItem setTitle:@"取消"];
    }
    else
    {
        [self.deleteItem setTitle:@"删除"];
    }
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
