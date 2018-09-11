//
//  ViewController.m
//  打卡等级升级版
//
//  Created by imac on 15/10/20.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "LMFViewController.h"
#import "UIView+view.h"
#import "MainViewController.h"
#import "PersonInfoModel.h"
#import "PersonTool.h"
#define width self.view.frame.size.width
#define height self.view.frame.size.height
@interface LMFViewController ()<UIScrollViewDelegate>
{
    int a;//习惯
    int b;
    int c;
    int d;
    int x;
    int y;
    int z;
    int number;
    float vip;//履约能力
}
@property (nonatomic, strong)UILabel *lable_left;
@property (nonatomic, strong)UILabel *lable_right;
@property (nonatomic, strong)UILabel *lable_number;
@property (nonatomic, strong)UILabel *lable_review;
@property (nonatomic, strong)UILabel *lable_left_new;
@property (nonatomic, strong)UILabel *lable_right_new;
@property (nonatomic, strong)UIButton *button1;
@property (nonatomic, strong)UIButton *button2;
@property (nonatomic, strong)UIButton *button3;
@property (nonatomic, strong)UIButton *button4;
@property (nonatomic, strong)UIButton *button5;
@property (nonatomic, strong)UIButton *button51;
@property (nonatomic, strong)UIButton *button52;
@property (nonatomic, strong)UIButton *button6;
@property (nonatomic, strong)UILabel *haiCha;//还差多少到下一等级
@property (nonatomic, assign) NSInteger allDays;
@property (nonatomic, strong)NSMutableArray *arr;
@property (nonatomic, strong)UIImageView *image1;
@property (nonatomic, strong)UILabel *titleImage;



@end

@implementation LMFViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.titleView = self.titleImage;
    
    NSString *filePatch = [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)objectAtIndex:0]stringByAppendingPathComponent:@"PersonMation.plist"];
    self.arr =[[NSMutableArray alloc] initWithContentsOfFile:filePatch];
    NSLog(@"self.arr.count == %lu",(unsigned long)self.arr.count);
    //判断数组里的个数
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStyleDone target:self action:@selector(back)];
    
    //    NSLog(@"%@",self.arr);
    [self setItems];
    [self HowNumberAllCount];

    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bac_allMain.png"]];
}
- (void)HowNumberAllCount
{
    if (self.arr.count == 0) {
                x  = 0;
                y  = 0;
                z  = 0;
                a  = 0;
                b  = 0;
                c  = 0;
                d  = 0;
        for (NSInteger i=100; i<107; i++) {
            UIButton *sender = (UIButton *)[self.view viewWithTag:i];
            sender.enabled = NO;
        }
            }
            else if(self.arr.count == 1){
                x  = [[self.arr[0] objectForKey:@"allDays"] intValue];
                y  = 0;
                z  = 0;
                a  = 0;
                b  = 0;
                c  = 0;
                d  = 0;
                for (NSInteger i=100; i<107; i++) {
                    if(i>100)
                    {
                        UIButton *sender = (UIButton *)[self.view viewWithTag:i];
                        
                        sender.userInteractionEnabled = NO;
                        //                        NSLog(@"tag===%d",sender.tag);
                    }
                    
                }
        
            }else if(self.arr.count == 2)
            {
                x  = [[self.arr[0] objectForKey:@"allDays"] intValue];
                y  = [[self.arr[1] objectForKey:@"allDays"] intValue];
                z  = 0;
                a  = 0;
                b  = 0;
                c  = 0;
                d  = 0;
                for (NSInteger i=100; i<107; i++) {
                    if(i>101)
                    {
                        UIButton *sender = (UIButton *)[self.view viewWithTag:i];
                        
                        sender.userInteractionEnabled = NO;
                        //                        NSLog(@"tag===%d",sender.tag);
                    }
                    
                }
            }else if(self.arr.count == 3)
            {
                x  = [[self.arr[0] objectForKey:@"allDays"] intValue];
                y  = [[self.arr[1] objectForKey:@"allDays"] intValue];
                z  = [[self.arr[2] objectForKey:@"allDays"] intValue];
                a  = 0;
                b  = 0;
                c  = 0;
                d  = 0;
                for (NSInteger i=100; i<107; i++) {
                    if(i>102)
                    {
                        UIButton *sender = (UIButton *)[self.view viewWithTag:i];
                        
                        sender.userInteractionEnabled = NO;
//                        NSLog(@"tag===%d",sender.tag);
                    }
                    
                }
            }else if(self.arr.count == 4)
            {
                x  = [[self.arr[0] objectForKey:@"allDays"] intValue];
                y  = [[self.arr[1] objectForKey:@"allDays"] intValue];
                z  = [[self.arr[2] objectForKey:@"allDays"] intValue];
                a  = [[self.arr[3] objectForKey:@"allDays"] intValue];
                b  = 0;
                c  = 0;
                d  = 0;
                for (NSInteger i=100; i<107; i++) {
                    if(i>103)
                    {
                        UIButton *sender = (UIButton *)[self.view viewWithTag:i];
                        
                        sender.userInteractionEnabled = NO;
                        //                        NSLog(@"tag===%d",sender.tag);
                    }
                    
                }
            }else if(self.arr.count == 5)
            {
                x  = [[self.arr[0] objectForKey:@"allDays"] intValue];
                y  = [[self.arr[1] objectForKey:@"allDays"] intValue];
                z  = [[self.arr[2] objectForKey:@"allDays"] intValue];
                a  = [[self.arr[3] objectForKey:@"allDays"] intValue];
                b  = [[self.arr[4] objectForKey:@"allDays"] intValue];
                c  = 0;
                d  = 0;
                for (NSInteger i=100; i<107; i++) {
                    if(i>104)
                    {
                        UIButton *sender = (UIButton *)[self.view viewWithTag:i];
                        
                        sender.userInteractionEnabled = NO;
                        //                        NSLog(@"tag===%d",sender.tag);
                    }
                    
                }
            }else if(self.arr.count == 6)
            {
                x  = [[self.arr[0] objectForKey:@"allDays"] intValue];
                y  = [[self.arr[1] objectForKey:@"allDays"] intValue];
                z  = [[self.arr[2] objectForKey:@"allDays"] intValue];
                a  = [[self.arr[3] objectForKey:@"allDays"] intValue];
                b  = [[self.arr[4] objectForKey:@"allDays"] intValue];
                c  = [[self.arr[5] objectForKey:@"allDays"] intValue];
                d  = 0;
                for (NSInteger i=100; i<107; i++) {
                    if(i>105)
                    {
                        UIButton *sender = (UIButton *)[self.view viewWithTag:i];
                        
                        sender.userInteractionEnabled = NO;
                        //                        NSLog(@"tag===%d",sender.tag);
                    }
                    
                }
            }else if(self.arr.count >= 7)
            {
                x  = [[self.arr[0] objectForKey:@"allDays"] intValue];
                y  = [[self.arr[1] objectForKey:@"allDays"] intValue];
                z  = [[self.arr[2] objectForKey:@"allDays"] intValue];
                a  = [[self.arr[3] objectForKey:@"allDays"] intValue];
                b  = [[self.arr[4] objectForKey:@"allDays"] intValue];
                c  = [[self.arr[5] objectForKey:@"allDays"] intValue];
                d  = [[self.arr[6] objectForKey:@"allDays"] intValue];
            }
        
//            x  = [[self.arr[0] objectForKey:@"allDays"] intValue];
//            y  = [[self.arr[1] objectForKey:@"allDays"] intValue];
//            z  = [[self.arr[2] objectForKey:@"allDays"] intValue];
//            a  = [[self.arr[3] objectForKey:@"allDays"] intValue];
//            b  = [[self.arr[4] objectForKey:@"allDays"] intValue];
//            c  = [[self.arr[5] objectForKey:@"allDays"] intValue];
//            d  = [[self.arr[6] objectForKey:@"allDays"] intValue];
    
        number = x;
}
- (void)setItems
{
    [self.view addSubview:self.lable_left];
    [self.view addSubview:self.lable_right];
    [self.view addSubview:self.button1];
    [self.view addSubview:self.button2];
    [self.view addSubview:self.button3];
    [self.view addSubview:self.button4];
    [self.view addSubview:self.button5];
    [self.view addSubview:self.button51];
    [self.view addSubview:self.button52];//所有习惯的按钮
    
    [self.view addSubview:self.button6];//返回
    [self.view addSubview:self.lable_number];
    [self.view addSubview:self.lable_review];//履约能力
//    [self setNumberAll:];
    

    [self set];
    [self.view addSubview:self.haiCha];
    //     NSString *str  = [NSString stringWithFormat:@"已坚持:%ld天",(long)[PersonTool moedlWithItemName:self.itemNameArr].allDays];
    
}
-(UILabel *)titleImage
{
    if (!_titleImage) {
        _titleImage = [[UILabel alloc]initWithFrame:CGRectMake(80, 20, 200, 50)];
        _titleImage.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"nav_achieve1.png"]];
    }return _titleImage;
}
-(UIImageView *)image1
{
    if (!_image1) {
        _image1 = [[UIImageView alloc]init];
    }return _image1;
}
- (void)set
{
    for (int i = 1; i<6; i++) {
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(i*65-30, 110, 40, 40)];
        imageView.image  = [UIImage imageNamed:[NSString stringWithFormat:@"chicken%d.png",i]];
        [self.view addSubview:imageView];
    }
//    UILabel *typeLabel = [[UILabel alloc]initWithFrame:CGRectMake(30, 130, 350, 23)];
//    typeLabel.text = @"    青铜          白银       黄金       钻石         王者";
//    typeLabel.font = [UIFont systemFontOfSize:14];
//    [self.view_up addSubview:typeLabel];//图片与等级
}

-(UILabel *)haiCha
{
    if (!_haiCha) {
        _haiCha = [[UILabel alloc]initWithFrame:CGRectMake(0, 180, 200, 20)];
    }return _haiCha;//还差多少积分能到下一级
}
- (void)click:(UIButton *)sender
{
    number = x;
//    [sender setTitleColor:[UIColor colorWithRed:244 green:112 blue:45] forState:UIControlStateNormal];
    [self setNumberAll:sender];
//根据对应的按钮将整个页面需要更改的习惯信息进行更换。
    
}
- (void)click2:(UIButton *)sender
{
    number = y;
//    [sender setTitleColor:[UIColor colorWithRed:244 green:112 blue:45] forState:UIControlStateNormal];
    [self setNumberAll:sender];
}
- (void)click3:(UIButton *)sender
{
    number = z;
//    [sender setTitleColor:[UIColor colorWithRed:244 green:112 blue:45] forState:UIControlStateNormal];
    [self setNumberAll:sender];
}
- (void)click4:(UIButton *)sender
{
    number = a;
//    [sender setTitleColor:[UIColor colorWithRed:244 green:112 blue:45] forState:UIControlStateNormal];
    [self setNumberAll:sender];
}
- (void)click5:(UIButton *)sender
{
    number = b;
//    [sender setTitleColor:[UIColor colorWithRed:244 green:112 blue:45] forState:UIControlStateNormal];
    [self setNumberAll:sender];
}
- (void)click51:(UIButton *)sender
{
    number = c;
//    [sender setTitleColor:[UIColor colorWithRed:244 green:112 blue:45] forState:UIControlStateNormal];
    [self setNumberAll:sender];
}
- (void)click52:(UIButton *)sender
{
    number = d;
//    [sender setTitleColor:[UIColor colorWithRed:244 green:112 blue:45] forState:UIControlStateNormal];
    [self setNumberAll:sender];
}
-(UIButton *)button1
{
    if (!_button1) {
        _button1 = [[UIButton alloc]initWithFrame:CGRectMake( -5, height/8*3+42, width/3+20, width/3)];
        _button1.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"number1"]];
//        _button1.layer.cornerRadius = 100;
//        NSLog(@"%@",[self.arr[0] objectForKey:@"itemName"]);
        
        [_button1 setTitleEdgeInsets:UIEdgeInsetsMake(60,40, 0, 40)];
        if (self.arr.count == 0) {
//            return;
        }else if(self.arr.count >=1)
        {
        [_button1 setTitle:[self.arr[0] objectForKey:@"itemName"] forState:UIControlStateNormal];
        }
        

        [_button1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_button1 addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
        _button1.tag = 100;
        
        NSLog(@"懒加载===tag====%d",_button1.tag);
    }return _button1;
}

-(UIButton *)button2
{
    if (!_button2) {
        _button2 = [[UIButton alloc]initWithFrame:CGRectMake( width/3-8, height/8*3+42, width/3+15, width/3)];
        _button2.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"number2"]];
        [_button2 setTitleEdgeInsets:UIEdgeInsetsMake(60,30, 0, 30)];
        if (self.arr.count >= 2) {
            [_button2 setTitle:[self.arr[1] objectForKey:@"itemName"] forState:UIControlStateNormal];
        }

        _button2.tag = 101;

        [_button2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_button2 addTarget:self action:@selector(click2:) forControlEvents:UIControlEventTouchUpInside];
    }return _button2;
}
-(UIButton *)button3
{
    if (!_button3) {
        _button3 = [[UIButton alloc]initWithFrame:CGRectMake( width/3*2-8, height/8*3+45, width/3, width/3)];
        _button3.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"number3"]];
        [_button3 setTitleEdgeInsets:UIEdgeInsetsMake(55,35, 0, 23)];
        if (self.arr.count >= 3) {
            [_button3 setTitle:[self.arr[2] objectForKey:@"itemName"] forState:UIControlStateNormal];
        }
        _button3.tag = 102;

        [_button3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_button3 addTarget:self action:@selector(click3:) forControlEvents:UIControlEventTouchUpInside];
    }return _button3;
}
-(UIButton *)button4
{
    if (!_button4) {
        _button4 = [[UIButton alloc]initWithFrame:CGRectMake( -5, height/8*3+42+width/3,  width/3+20, width/3)];
        _button4.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"number4"]];
        [_button4 setTitleEdgeInsets:UIEdgeInsetsMake(40,27, 0, 30)];
        if (self.arr.count >= 4) {
            [_button4 setTitle:[self.arr[3] objectForKey:@"itemName"] forState:UIControlStateNormal];
        }
        [_button4 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_button4 addTarget:self action:@selector(click4:) forControlEvents:UIControlEventTouchUpInside];
        _button4.tag = 103;

    }return _button4;
}
-(UIButton *)button5
{
    if (!_button5) {
        _button5 = [[UIButton alloc]initWithFrame:CGRectMake( width/3-8, height/8*3+42+width/3, width/3+15, width/3)];
        _button5.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"number5"]];
        [_button5 setTitleEdgeInsets:UIEdgeInsetsMake(50,33, 0, 30)];
        if (self.arr.count >= 5) {
            [_button5 setTitle:[self.arr[4] objectForKey:@"itemName"] forState:UIControlStateNormal];
        }
        [_button5 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_button5 addTarget:self action:@selector(click5:) forControlEvents:UIControlEventTouchUpInside];
        _button5.tag = 104;

    }return _button5;
}
-(UIButton *)button51
{
    if (!_button51) {
        _button51 = [[UIButton alloc]initWithFrame:CGRectMake( width/3*2, height/8*3+42+width/3, width/3, width/3)];
        _button51.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"number6"]];
        [_button51 setTitleEdgeInsets:UIEdgeInsetsMake(45,24, 0, 20)];
        if (self.arr.count >= 6) {
            [_button51 setTitle:[self.arr[5] objectForKey:@"itemName"] forState:UIControlStateNormal];
        }
        [_button51 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_button51 addTarget:self action:@selector(click51:) forControlEvents:UIControlEventTouchUpInside];
        _button51.tag = 105;

    }return _button51;
}
-(UIButton *)button52
{
    if (!_button52) {
        _button52 = [[UIButton alloc]initWithFrame:CGRectMake( 0, height/8*3+42+width/3*2, width/3+20, width/3)];
        _button52.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"number7"]];
        [_button52 setTitleEdgeInsets:UIEdgeInsetsMake(50,30, 0, 10)];
        if (self.arr.count >= 7) {
            [_button52 setTitle:[self.arr[6] objectForKey:@"itemName"] forState:UIControlStateNormal];
        }
        [_button52 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_button52 addTarget:self action:@selector(click52:) forControlEvents:UIControlEventTouchUpInside];
        _button52.tag = 106;

    }return _button52;
}

-(UIButton *)button6
{
    if (!_button6) {
        _button6 = [[UIButton alloc]initWithFrame:CGRectMake( width/3+30, height/8*3+33+width/2+width/4, 200, 80)];
        _button6.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"number10"]];

    }return _button6;
}
- (void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}
-(UILabel *)lable_number
{
    if (!_lable_number) {
        _lable_number = [[UILabel alloc]initWithFrame:CGRectMake(4, height/4+42, width/2-5, height/8)];
        _lable_number.textColor = [UIColor purpleColor];
//        _lable_number.backgroundColor = [UIColor yellowColor];
//        _lable_number.alpha = 0.5;
        _lable_number.layer.cornerRadius = 20 ;
        _lable_number.layer.backgroundColor = [[UIColor whiteColor]CGColor];
        _lable_number.layer.borderColor = [[UIColor orangeColor]CGColor];
        _lable_number.layer.borderWidth = 2;

    }return _lable_number;
}
-(UILabel *)lable_review
{
    if (!_lable_review) {
        _lable_review = [[UILabel alloc]initWithFrame:CGRectMake(width/2+5, height/4+42, width/2-8, height/8)];
        _lable_review.textColor = [UIColor purpleColor];
        _lable_review.layer.cornerRadius = 20 ;
        _lable_review.layer.backgroundColor = [[UIColor whiteColor]CGColor];
        _lable_review.layer.borderWidth = 2;
        _lable_review.layer.borderColor = [[UIColor orangeColor]CGColor];
//        _lable_review.alpha = 0.5;
    }return _lable_review;
}
- (void)setNumberAll:(UIButton *)sender
{
    
    NSLog(@"%@",self.arr[sender.tag-100]);
    for (NSInteger i=100; i<107; i++) {
        UIButton *sender = (UIButton *)[self.view viewWithTag:i];
        [sender setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    [sender setTitleColor:[UIColor colorWithRed:244 green:112 blue:45] forState:UIControlStateNormal];
    NSDate *beginDate = [self.arr[sender.tag-100] objectForKey:@"beginDate"];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDate *datenow = [NSDate date];
    NSLog(@"%@,%@",beginDate,datenow);
    unsigned int unitFlag = NSCalendarUnitDay;
    NSDateComponents *components = [calendar components:unitFlag fromDate:beginDate toDate:datenow options:0];
    NSInteger days = [components day] + 1;
    NSLog(@"days=====%ld",(long)days);
    NSLog(@"number=====%d",number);
//        vip = days/(number+1);
    vip = (number + 1)/days;
    
//    float vip1=(number+1)/days;
//        vip=1/vip1;
//        NSLog(@"vip====%f",vip1);
    
    self.lable_number.text = [NSString stringWithFormat:@" 成长值%d",number];
    self.lable_review.text = [NSString stringWithFormat:@"评价"];

    if (vip>=0.9) {
        
            self.image1.frame = CGRectMake(33, 25, 150, 30);
            self.image1.image = [UIImage imageNamed:@"super5.png"];
            [self.lable_review addSubview:self.image1];
        
    }else if (vip>=0.8)
    {
        self.image1.frame = CGRectMake(33, 25, 150, 30);
        self.image1.image = [UIImage imageNamed:@"super4.png"];
        [self.lable_review addSubview:self.image1];
    }
    else if (vip>=0.5)
    {
        
        
        self.image1.frame = CGRectMake(33, 25, 150, 30);
        self.image1.image = [UIImage imageNamed:@"super3.png"];
        [self.lable_review addSubview:self.image1];
    }else if (vip>=0.2)
    {
        
        
        self.image1.frame = CGRectMake(33, 25, 150, 30);
        self.image1.image = [UIImage imageNamed:@"super2.png"];
        [self.lable_review addSubview:self.image1];
    }else if (vip>=0)
    {
        
        
        self.image1.frame = CGRectMake(33, 25, 150, 30);
        self.image1.image = [UIImage imageNamed:@"super1.png"];
        [self.lable_review addSubview:self.image1];
    }
    
    

    
    
    if (number ==0) {
        self.haiCha.text = [NSString stringWithFormat:@"还没开始坚持的习惯哦！"];
        self.haiCha.textColor = [UIColor redColor];
    }else if (number<=width/6) {
        self.haiCha.text = [NSString stringWithFormat:@"还差%d天就可以孵化了",(int)width/6-number];
        self.haiCha.textColor = [UIColor blackColor];
        
        
    }else if(number<=width/3)
    {
        self.haiCha.text = [NSString stringWithFormat:@"还差%d天就可以破壳了",(int)width/3-number];
        self.haiCha.textColor = [UIColor blackColor];
        
    }else if(number<=width/2)
    {
        self.haiCha.text = [NSString stringWithFormat:@"还差%d天就可以退壳了",(int)width/2-number];
        self.haiCha.textColor = [UIColor blackColor];
        
    }else if(number<=width/3*2)
    {
        self.haiCha.text = [NSString stringWithFormat:@"还差%d天就可以穿衣服了",(int)width/3*2-number];
        self.haiCha.textColor = [UIColor blackColor];
        
    }else if(number<=width/6*5)
    {
        self.haiCha.text = [NSString stringWithFormat:@"还差%d天就可以下蛋了",(int)width/6*5-number];
        self.haiCha.textColor = [UIColor blackColor];
        
    }else if(number<=width)
    {
        self.haiCha.text = [NSString stringWithFormat:@"还差%d天就可以了",(int)width-number];
        self.haiCha.textColor = [UIColor blackColor];
        
    }
    
    //    [self.view_up addSubview:self.lable_run];
    
    self.lable_left_new.frame =  CGRectMake(0, 160, number, 10);
    self.lable_left_new.backgroundColor = [UIColor redColor];

    //    self.lable_left_new.layer.cornerRadius = 200;
    [self.view addSubview:self.lable_left_new];
    
    self.lable_right.frame = CGRectMake(number, 160, width-number, 10);
    self.lable_right_new.backgroundColor = [UIColor grayColor];
    [self.view addSubview:self.lable_right_new];
    //    UILabel *haiCha = [[UILabel alloc]initWithFrame:CGRectMake(0, 180, 200, 20)];
    //    haiCha.text = [NSString stringWithFormat:@"还差%d积分到下一等级",(int)width-number];
    //    [self.view_up addSubview:haiCha];
}
-(UILabel *)lable_left_new
{
    if (!_lable_left_new) {
        _lable_left_new = [[UILabel alloc]init];
        _lable_left_new.layer.cornerRadius = 300;
    }return _lable_left_new;
}
//-(UILabel *)lable_right_new
//{
//    if (!_lable_right_new) {
//        _lable_right_new = [[UILabel alloc]init];
//    }return _lable_right_new;
//}
-(UILabel *)lable_right
{
    if (!_lable_right) {
        _lable_right = [[UILabel alloc]initWithFrame:CGRectMake(x, 160, width-x, 10)];
        _lable_right.backgroundColor = [UIColor grayColor];//左边进度条
    }return _lable_right;
}

//-(UIView *)view_up
//{
//    if (!_view_up) {
//        _view_up = [[UIView alloc]initWithFrame:CGRectMake(0, 0, width, height/4+42)];
//        _view_up.backgroundColor = [UIColor whiteColor];//邮编进度条
//    }return _view_up;
//}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
