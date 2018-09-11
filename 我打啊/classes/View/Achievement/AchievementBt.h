//
//  AchievementBt.h
//  我打啊
//
//  Created by imac on 15/10/17.
//  Copyright (c) 2015年 张喆. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TurnToAchievement <NSObject>

- (void)turnToAchievement;

@end

@interface AchievementBt : UIButton

@property (nonatomic, weak) id<TurnToAchievement> delegate;

@end
