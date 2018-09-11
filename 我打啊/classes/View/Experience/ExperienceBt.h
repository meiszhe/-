//
//  ExperienceBt.h
//  我打啊
//
//  Created by imac on 15/10/17.
//  Copyright (c) 2015年 张喆. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol turnToExperience <NSObject>

- (void)turnToExperience;

@end

@interface ExperienceBt : UIButton

@property (nonatomic, weak) id<turnToExperience> delegate;

@end
