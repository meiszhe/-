//
//  PickerItemName.m
//  我打啊
//
//  Created by imac on 15/11/7.
//  Copyright (c) 2015年 张喆. All rights reserved.
//

#import "PickerItemName.h"

@interface PickerItemName ()<UIPickerViewDataSource, UIPickerViewDelegate>


@property (nonatomic, strong) NSMutableArray *personArr;
@property (nonatomic, strong) NSArray *personItemCount;

@end

@implementation PickerItemName

#pragma mark - 初始化
- (instancetype)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
    {
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bac_allMain.jpg"]];
        [self addSubview:self.pickName];
    }
    return self;
}

#pragma mark - 懒加载
- (UIPickerView *)pickName
{
    if(!_pickName)
    {
        _pickName = [[UIPickerView alloc]initWithFrame:CGRectMake(0 , 0, self.width, self.height)];
        _pickName.dataSource = self;
        _pickName.delegate = self;
    }
    return _pickName;
}

- (NSArray *)personItemCount
{
    if(!_personItemCount)
    {
        _personItemCount = [PersonTool allPersonInfo];
    }
    return _personItemCount;
}

- (NSMutableArray *)personArr
{
    if(!_personArr)
    {
        NSArray *personArr = [PersonTool allPersonInfo];
        _personArr = [NSMutableArray array];
        for (NSDictionary *dic in personArr) {
            [_personArr addObject:dic[@"itemName"]];
        }
    }
    return _personArr;
}
#pragma mark - 数据源方法
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return self.personArr.count;
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
//    return self.personArr[row%self.personItemCount.count];
    return self.personArr[row];
}
#pragma mark - 代理方法
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    [[NSNotificationCenter defaultCenter]postNotificationName:@"ItemNameDidChanged" object:nil userInfo:@{@"pickerItemName":self.personArr[row%self.personItemCount.count]}];
//    NSLog(@"%@",self.personArr[row%self.personItemCount.count]);
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
