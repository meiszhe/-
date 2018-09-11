//
//  ViewController.m
//  PeekInspiredTimePicker
//
//  Created by Adam Cooper on 11/23/14.
//  Copyright (c) 2014 Adam Cooper. All rights reserved.
//

#import "TimePickViewController.h"
#import "MinutesViewController.h"
#import "HourViewController.h"
#import "MyTimeModel.h"
#import "TimeMainViewController.h"
#import "LocalNotification.h"

@interface TimePickViewController () <UIGestureRecognizerDelegate, MinuteViewDelegate, HourViewDelegate>
@property (weak, nonatomic) IBOutlet UIButton *closeButton;
@property (weak, nonatomic) IBOutlet UIButton *checkButton;
@property (weak, nonatomic) IBOutlet UIButton *timeOfDaySwitch;

@property NSInteger selectedHour;
@property NSInteger selectedMinute;

@end

@implementation TimePickViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bac_allMain.jpg"]];
    self.timeOfDaySwitch.frame = CGRectMake(0, 0, 44, 44);
    self.timeOfDaySwitch.clipsToBounds = YES;
    self.timeOfDaySwitch.layer.cornerRadius = 44/2.0f;
    self.timeOfDaySwitch.layer.borderWidth=1.0f;

    self.checkButton.imageEdgeInsets = UIEdgeInsetsMake(15, 15, 15, 15);
    self.closeButton.imageEdgeInsets = UIEdgeInsetsMake(15, 15, 15, 15);

}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];

    NSDate *now = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:NSCalendarUnitHour fromDate:now];
    NSInteger hour = [components hour];

    if (hour < 12) {
        self.timeOfDaySwitch.backgroundColor = [UIColor clearColor];
        [self.timeOfDaySwitch setTitle:@"上午" forState:UIControlStateNormal];
        self.timeOfDaySwitch.tag = 1;

    } else {
        self.timeOfDaySwitch.backgroundColor = [UIColor clearColor];
        [self.timeOfDaySwitch setTitle:@"下午" forState:UIControlStateNormal];
        self.timeOfDaySwitch.tag = 0;
    }
}

-  (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
        MinutesViewController *minutesViewController = segue.destinationViewController;
        minutesViewController.delegate = self;

        HourViewController *hoursViewController = segue.destinationViewController;
        hoursViewController.delegate = self;
}

- (IBAction)onTimeOfDayButtonPressed:(UIButton *)sender {

    if (sender.tag == 0) {
        self.timeOfDaySwitch.backgroundColor = [UIColor clearColor];
        [self.timeOfDaySwitch setTitle:@"上午" forState:UIControlStateNormal];
        sender.tag++;
    } else {
        self.timeOfDaySwitch.backgroundColor = [UIColor clearColor];
        [self.timeOfDaySwitch setTitle:@"下午" forState:UIControlStateNormal];
        sender.tag--;
    }
}

-(void)minuteSelected:(NSString *)string{
    self.selectedMinute = 0;
//    NSLog(@"Minute: %@",string);
    self.selectedMinute = string.integerValue;
}

-(void)hourSelected:(NSString *)string{
    self.selectedHour = 0;
//    NSLog(@"Hour: %@",string);
    self.selectedHour = string.integerValue;
}
- (IBAction)onCloseButtonPressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)onCheckButtonPressed:(id)sender {

    NSDate *oldDate = [NSDate date];
    unsigned unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth |  NSCalendarUnitDay;
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:unitFlags fromDate:oldDate];
    components.minute = self.selectedMinute;
    
    if (self.timeOfDaySwitch.tag == 0){
        components.hour = self.selectedHour + 12;
    } else {
        components.hour = self.selectedHour;
    }
    self.selectedDate = [calendar dateFromComponents:components];
    
    NSArray *arr = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *way = [arr[0] stringByAppendingPathComponent:@"Time.plist"];
    MyTimeModel *model = [[MyTimeModel alloc]init];
    if(![model.timeArr containsObject:self.selectedDate])
    {
        if(model.timeArr == nil)
        {
            NSMutableArray *arr = [NSMutableArray array];
            [arr addObject:self.selectedDate];
            [arr writeToFile:way atomically:YES];
            
            for (NSDate *date in arr)
            {
                NSDate *now = [NSDate date];
                NSTimeInterval secondsBetweenDates= [date timeIntervalSinceDate:now];
                [LocalNotification registerLocalNotification:secondsBetweenDates];
                [self dismissViewControllerAnimated:YES completion:^{
                    [[NSNotificationCenter defaultCenter]postNotificationName:@"CheckNotification" object:way userInfo:nil];
                }];
            }
            return;
        }
        [model.timeArr addObject:self.selectedDate];
        [model.timeArr writeToFile:way atomically:YES];
        for (NSDate *date in model.timeArr)
        {
            NSDate *now = [NSDate date];
            NSTimeInterval secondsBetweenDates= [date timeIntervalSinceDate:now];
            [LocalNotification registerLocalNotification:secondsBetweenDates];
            [self dismissViewControllerAnimated:YES completion:^{
                [[NSNotificationCenter defaultCenter]postNotificationName:@"CheckNotification" object:way userInfo:nil];
            }];
        }
    }
    else
    {
//        [MBProgressHUD showError:@"已经添加过同一个时间了呦" toView:self.view];
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        hud.mode = MBProgressHUDModeText;
        hud.labelText = @"已经添加过同一个时间了呦";
        [hud hide:YES afterDelay:1.5];
    }
}



@end
