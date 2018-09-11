//
//  MainViewController.m
//  我打啊
//
//  Created by imac on 15/10/17.
//  Copyright (c) 2015年 张喆. All rights reserved.
//

#import "MainViewController.h"
#import "AchievementBt.h"
#import "SeeAllBt.h"
#import "WeakUpBt.h"
#import "ExperienceBt.h"
#import "SignInBt.h"
#import "AddBt.h"
#import "ExperienceViewController.h"
#import "AddNewItemViewController.h"
#import "SignInViewController.h"
#import "TimeMainViewController.h"
#import "SeeAllViewController.h"
#import "AchievementController.h"
#define mainW [UIScreen mainScreen].bounds.size.width
#define mainH [UIScreen mainScreen].bounds.size.height
@interface MainViewController ()<turnToExperience, SignIn, TurnToWeakUp, TurnToAchievement, TurnToSeeAll>

@property (nonatomic, strong) UILabel *title_lb;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.titleView = self.title_lb;
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bac_allMain.jpg"]];
    [self loadAllBt];
    
    self.navigationController.interactivePopGestureRecognizer.delegate = (id)self;
}

#pragma mark - 加载所有按钮
- (void)loadAllBt
{
    CGFloat btnW = (mainW/2)*3/5;
    CGFloat btnH = (mainH-44)/4;
    CGFloat btnX = (mainW/2)/4;
    CGFloat btnY = (mainH-btnH-44)/3;
//    NSLog(@"%f",btnY);
    
    AchievementBt *ac_bt = [[AchievementBt alloc]initWithFrame:CGRectMake(btnX, btnY, btnW, btnH)];
    ac_bt.delegate = self;
    [self.view addSubview:ac_bt];
    
    SeeAllBt *see_bt = [[SeeAllBt alloc]initWithFrame:CGRectMake(btnX+mainW/2, btnY, btnW, btnH)];
//    NSLog(@"%f",btnX);
    see_bt.delegate = self;
    [self.view addSubview:see_bt];
    
    WeakUpBt *wk_bt = [[WeakUpBt alloc]initWithFrame:CGRectMake(btnX, ac_bt.frame.origin.y+ac_bt.frame.size.height+40, btnW, btnH)];
    wk_bt.delegate = self;
    [self.view addSubview:wk_bt];
    
    ExperienceBt *ex_bt = [[ExperienceBt alloc]initWithFrame:CGRectMake(see_bt.frame.origin.x, wk_bt.frame.origin.y, btnW, btnH)];
    ex_bt.delegate = self;
    [self.view addSubview:ex_bt];
    
    SignInBt *sign_bt = [[SignInBt alloc]initWithFrame:CGRectMake(mainW/4, mainH-mainH/5, mainW/2, mainH/6)];
    sign_bt.delegate = self;
    [self.view addSubview:sign_bt];
    
    UIBarButtonItem *add_bt = [[UIBarButtonItem alloc]initWithTitle:@"添加" style:UIBarButtonItemStylePlain target:self action:@selector(clickAdd:)];
    self.navigationItem.leftBarButtonItem = add_bt;
}

#pragma mark - 实现协议
- (void)turnToExperience
{
    ExperienceViewController *exController = [[ExperienceViewController alloc]init];
    [self.navigationController pushViewController:exController animated:YES];
}
- (void)signIn
{
    if([PersonTool allPersonInfo].count == 0)
    {
//        [MBProgressHUD showError:@"还没有习惯，快去添加吧!" toView:self.view];
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        hud.mode = MBProgressHUDModeText;
        hud.labelText = @"还没有习惯，快去添加吧!";
        [hud hide:YES afterDelay:1.5];
        return;
    }
    SignInViewController *signInController = [[SignInViewController alloc]init];
    [self.navigationController pushViewController:signInController animated:YES];
}
- (void)turnToWeakUp
{
    TimeMainViewController *weakUp = [[TimeMainViewController alloc]init];
    [self.navigationController pushViewController:weakUp animated:YES];
}
- (void)turnToAchievement
{
    AchievementController *achieve = [[AchievementController alloc]init];
    [self.navigationController pushViewController:achieve animated:YES];
}
- (void)turnSeeAll
{
    SeeAllViewController *seeAll = [[SeeAllViewController alloc]init];
    [self.navigationController pushViewController:seeAll animated:YES];
}
#pragma mark - 点击方法
- (void)clickAdd:(AddBt *)sender
{
    AddNewItemViewController *addNewItem = [[AddNewItemViewController alloc]init];
    [self.navigationController pushViewController:addNewItem animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - 懒加载
- (UILabel *)title_lb
{
    if(!_title_lb)
    {
        _title_lb = [[UILabel alloc]initWithFrame:CGRectMake(0, 4, 140, 41)];
        _title_lb.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"icon_nav_title.png"]];
    }
    return _title_lb;
}
#pragma mark - life
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.view.hidden = YES;
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.view.hidden = NO;
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
