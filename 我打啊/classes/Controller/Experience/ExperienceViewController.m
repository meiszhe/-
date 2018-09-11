//
//  ExperienceViewController.m
//  我打啊
//
//  Created by imac on 15/10/17.
//  Copyright (c) 2015年 张喆. All rights reserved.
//

#import "ExperienceViewController.h"
#import "WaDaViewController.h"
#import "AddExViewController.h"
#import "ExperienceModel.h"
#import "ExperienceCell.h"
#define mainx [UIScreen mainScreen].bounds.size.width
#define mainy [UIScreen mainScreen].bounds.size.height
@interface ExperienceViewController ()

@property (nonatomic, strong) NSMutableArray *allArr;
@property (nonatomic, strong) NSMutableDictionary *dic;
@property (nonatomic, strong) UILabel *title_lb;

@end

@implementation ExperienceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //侧滑返回
    self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    
    [self.view addSubview:self.tableView];
    self.navigationItem.titleView = self.title_lb;

    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bac_ex.jpg"]];
    
    self.navigationItem.rightBarButtonItem = self.add;
    self.navigationItem.leftBarButtonItem = self.back;
}

#pragma mark - 懒加载
- (NSMutableArray *)allArr
{
    if(!_allArr)
    {
        NSArray *arr = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
        NSString *path = [arr[0] stringByAppendingPathComponent:@"Experience.plist"];
        NSArray *flagArr = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *flagMutArr = [NSMutableArray array];
        [flagArr enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            ExperienceModel *model = [ExperienceModel modelWithDic:flagArr[idx]];
            [flagMutArr addObject:model];
        }];
        _allArr = flagMutArr;
//        NSLog(@"%@",_allArr);
    }
    return _allArr;
}
- (UILabel *)title_lb
{
    if(!_title_lb)
    {
        _title_lb = [[UILabel alloc]initWithFrame:CGRectMake(0, 4, 140, 41)];
        _title_lb.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"icon_nav_mind.png"]];
    }
    return _title_lb;
}
- (UIBarButtonItem *)add
{
    if(!_add)
    {
        _add = [[UIBarButtonItem alloc]initWithTitle:@"添加" style:UIBarButtonItemStylePlain target:self action:@selector(addEx)];
    }
    return _add;
}

- (UITableView *)tableView
{
    if(!_tableView)
    {
        _tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

- (UIBarButtonItem *)back
{
    if(!_back)
    {
        _back = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(clickBack:)];
    }
    return _back;
}

#pragma mark - 实现点击方法
- (void)addEx
{
    AddExViewController *add = [[AddExViewController alloc]init];
    add.delegate = self;
    [self.navigationController pushViewController:add animated:YES];
}
- (void)clickBack:(UIBarButtonItem *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - 获取沙盒数据
- (void)buildData
{
    NSArray *arr = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *path = [arr[0] stringByAppendingPathComponent:@"Experience.plist"];
    NSArray *flagArr = [NSArray arrayWithContentsOfFile:path];
    NSMutableArray *flagMutArr = [NSMutableArray array];
//    int i=0;
//    for (NSString *str in flagArr) {
//        ExperienceModel *model = [ExperienceModel modelWithDic:flagArr[i]];
//        i++;
//        [flagMutArr addObject:model];
//    }
    
    [flagArr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        ExperienceModel *model = [ExperienceModel modelWithDic:flagArr[idx]];
        [flagMutArr addObject:model];
    }];
    
            self.allArr = flagMutArr;
//            NSLog(@"%@",self.allArr);
}

#pragma mark - 实现数据源代理方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.allArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *str = @"cell";
    ExperienceCell *cell = [self.tableView dequeueReusableCellWithIdentifier:str];
    if(cell == nil)
    {
        cell = [[ExperienceCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
    }
    ExperienceModel *model = self.allArr[indexPath.row];
    cell.exDateLabel.text = model.date;
    cell.exContentLabel.text = model.contents;
    cell.backgroundColor = [UIColor clearColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return (mainy-50)/3;
}

#pragma mark - 自定义代理方法
- (void)reloadView
{
    [self buildData];
    [self.tableView reloadData];
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
