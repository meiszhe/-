//
//  AddExViewController.m
//  我打啊
//
//  Created by imac on 15/10/17.
//  Copyright (c) 2015年 张喆. All rights reserved.
//

#import "AddExViewController.h"
#import "ExperienceModel.h"
//#import "ExperienceViewController.h"
#define mainx [UIScreen mainScreen].bounds.size.width
#define mainy [UIScreen mainScreen].bounds.size.height
@interface AddExViewController ()

@property (nonatomic, strong) NSMutableDictionary *addDic;
@property (nonatomic, copy) NSString *dateStr;
@property (nonatomic, strong) UILabel *chick_lb;
@property (nonatomic, strong) UILabel *title_lb;

@end

@implementation AddExViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    //侧滑返回
    self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    
    [self.view addSubview:self.textView];
    [self.view addSubview:self.chick_lb];
    self.navigationItem.titleView = self.title_lb;
    self.textView.editable = YES;
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bac_allMain.jpg"]];
    self.navigationItem.rightBarButtonItem = self.complete;
    self.navigationItem.leftBarButtonItem = self.back;
}

#pragma mark - 懒加载
- (UITextView *)textView
{
    if(!_textView)
    {
        _textView = [[UITextView alloc]initWithFrame:CGRectMake(0, 64, self.view.width, self.view.frame.size.height-64)];
        _textView.font = [UIFont systemFontOfSize:28];
        _textView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bac_allMain.jpg"]];
        _textView.delegate = self;
    }
    return _textView;
}
- (UILabel *)title_lb
{
    if(!_title_lb)
    {
        _title_lb = [[UILabel alloc]initWithFrame:CGRectMake(0, 4, 180, 41)];
        _title_lb.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"icon_nav_addex.png"]];
    }
    return _title_lb;
}
- (UILabel *)chick_lb
{
    if(!_chick_lb)
    {
        _chick_lb = [[UILabel alloc]initWithFrame:CGRectMake(20, self.view.height-300, 230, 300)];
        _chick_lb.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"icon_aimto.png"]];
    }
    return _chick_lb;
}

- (UIBarButtonItem *)back
{
    if(!_back)
    {
        _back = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(clickBack:)];
    }
    return _back;
}

- (NSMutableDictionary *)addDic
{
    if(!_addDic)
    {
        _addDic = [NSMutableDictionary dictionary];
    }
    return _addDic;
}
- (UIBarButtonItem *)complete
{
    if(!_complete)
    {
        _complete = [[UIBarButtonItem alloc]initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(completeAdd)];
    }
    return _complete;
}

#pragma mark - 点击方法
- (void)completeAdd
{
    self.dateStr = [NSDate stringWithDate];
    
    [self.addDic setObject:self.dateStr forKey:@"date"];
    [self.addDic setObject:self.textView.text forKey:@"contents"];
    
    if([self.textView.text isEqualToString:@""])
    {
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        hud.mode = MBProgressHUDModeText;
        hud.labelText = @"还没输入呢!";
        [hud hide:YES afterDelay:1.5];
        return;
    }
    else
    {
//        ExperienceModel *exModel = [[ExperienceModel alloc]initWithDic:self.addDic];
        ExperienceModel *model = [[ExperienceModel alloc]init];
        [model addDataInModel:self.addDic];
    }
    
//    NSLog(@"%@",exModel);
    
    [self.delegate reloadView];
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)clickBack:(UIBarButtonItem *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - 代理方法
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if (range.location >= 100) {
        return NO;
    }
    
    if([text isEqualToString:@"\n"])
    {
        [textView resignFirstResponder];
        return NO;
    }
    return YES;
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
