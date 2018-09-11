//
//  SeeAllBt.h
//  我打啊
//
//  Created by imac on 15/10/17.
//  Copyright (c) 2015年 张喆. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TurnToSeeAll <NSObject>

- (void)turnSeeAll;

@end

@interface SeeAllBt : UIButton

@property (nonatomic, weak) id<TurnToSeeAll> delegate;

@end
