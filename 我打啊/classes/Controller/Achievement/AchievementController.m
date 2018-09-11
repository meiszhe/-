//
//  AchievementController.m
//  我打啊
//
//  Created by imac on 15/11/26.
//  Copyright (c) 2015年 张喆. All rights reserved.
//

#import "AchievementController.h"

@interface AchievementController ()<UIAlertViewDelegate>

@property (weak, nonatomic) IBOutlet UIView *myView;
@property (weak, nonatomic) IBOutlet UIButton *hen_btn;
@property (weak, nonatomic) IBOutlet UIButton *yellowChick_btn;
@property (weak, nonatomic) IBOutlet UIButton *blueChick_btn;
@property (weak, nonatomic) IBOutlet UIButton *purple_btn;
@property (weak, nonatomic) IBOutlet UIButton *yellowChickSec_btn;
@property (weak, nonatomic) IBOutlet UIButton *black_btn;
@property (weak, nonatomic) IBOutlet UIButton *rabbit_btn;
@property (nonatomic, strong) UIAlertView *alertView;
@property (nonatomic, strong) NSArray *allData;
@property (nonatomic, strong) UIAlertController *alerController;

@end

@implementation AchievementController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //侧滑返回
    self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(clickBack)];
    self.navigationItem.leftBarButtonItem = backItem;
}
#pragma mark - 点击事件
- (void)clickBack
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)clickHen:(id)sender {
    self.alerController.message = self.allData[0];
    [self presentViewController:self.alerController animated:YES completion:nil];
}
- (IBAction)clickYellowChick:(id)sender {
    self.alerController.message = self.allData[1];
    [self presentViewController:self.alerController animated:YES completion:nil];
}
- (IBAction)clickBlueChick:(id)sender {
    self.alerController.message = self.allData[2];
    [self presentViewController:self.alerController animated:YES completion:nil];
}
- (IBAction)clickPurple:(id)sender {
    self.alerController.message = self.allData[3];
    [self presentViewController:self.alerController animated:YES completion:nil];
}
- (IBAction)clickYellowChickSec:(id)sender {
    self.alerController.message = self.allData[4];
    [self presentViewController:self.alerController animated:YES completion:nil];
}
- (IBAction)clickBlack:(id)sender {
    self.alerController.message = self.allData[5];
    [self presentViewController:self.alerController animated:YES completion:nil];
}
- (IBAction)clickRabbit:(id)sender {
    self.alerController.message = self.allData[6];
    [self presentViewController:self.alerController animated:YES completion:nil];
}

#pragma mark - 懒加载
- (UIAlertController *)alerController
{
    if(!_alerController)
    {
        _alerController = [UIAlertController alertControllerWithTitle:@"坚持住！" message:@"" preferredStyle:UIAlertControllerStyleActionSheet];
        UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
        [_alerController addAction:cancel];
    }
    return _alerController;
}
- (UIAlertView *)alertView
{
    if(!_alertView)
    {
        _alertView = [[UIAlertView alloc]initWithTitle:@"加油！坚持住！" message:@"aaa" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:nil];
    }
    return _alertView;
}
- (NSArray *)allData
{
    if(!_allData)
    {
        NSString *str = [[NSBundle mainBundle]pathForResource:@"Storyplist" ofType:@"plist"];
        _allData = [NSArray arrayWithContentsOfFile:str];
    }
    return _allData;
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
