//
//  NewFeatureViewController.m
//  我打啊
//
//  Created by imac on 15/11/11.
//  Copyright (c) 2015年 张喆. All rights reserved.
//

#import "NewFeatureViewController.h"
#import "FirstFeatureView.h"
#import "SecondFeatureView.h"
#import "ThirdFeatureView.h"
#import "FourthFeatureView.h"
#import "FifthFeatureView.h"
#define mainx [UIScreen mainScreen].bounds.size.width
#define mainy [UIScreen mainScreen].bounds.size.height
@interface NewFeatureViewController ()

@property (nonatomic, strong) UIScrollView *feature;

@end

@implementation NewFeatureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.feature];
}

#pragma mark - 懒加载
- (UIScrollView *)feature
{
    if(!_feature)
    {
        _feature = [[UIScrollView alloc]initWithFrame:[UIScreen mainScreen].bounds];
        _feature.pagingEnabled = YES;
        _feature.showsHorizontalScrollIndicator = NO;
        _feature.contentSize = CGSizeMake(5*self.view.width, 0);
        FirstFeatureView *first = [[FirstFeatureView alloc]initWithFrame:CGRectMake(0, 0, mainx, mainy)];
        [_feature addSubview:first];
        SecondFeatureView *second = [[SecondFeatureView alloc]initWithFrame:CGRectMake(mainx, 0, mainx, mainy)];
        [_feature addSubview:second];
        ThirdFeatureView *third = [[ThirdFeatureView alloc]initWithFrame:CGRectMake(2*mainx, 0, mainx, mainy)];
        [_feature addSubview:third];
        FourthFeatureView *four = [[FourthFeatureView alloc]initWithFrame:CGRectMake(3*mainx, 0, mainx, mainy)];
        [_feature addSubview:four];
        FifthFeatureView *fif = [[FifthFeatureView alloc]initWithFrame:CGRectMake(4*mainx, 0, mainx, mainy)];
        [_feature addSubview:fif];
    }
    return _feature;
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
