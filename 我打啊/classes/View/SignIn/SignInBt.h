//
//  SignInBt.h
//  我打啊
//
//  Created by imac on 15/10/26.
//  Copyright (c) 2015年 张喆. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SignIn <NSObject>

- (void)signIn;

@end

@interface SignInBt : UIButton

@property (nonatomic, weak) id<SignIn> delegate;

@end
