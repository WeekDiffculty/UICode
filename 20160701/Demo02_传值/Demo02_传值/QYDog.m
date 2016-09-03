//
//  QYDog.m
//  Demo02_传值
//
//  Created by qingyun on 16/7/1.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "QYDog.h"
#import "B.h"

@interface QYDog () <QYWangCaiDelegate>

@end

@implementation QYDog

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self loadDefaultSetting];
    }
    return self;
}

/** Load the default UI elements And prepare some datas needed. */
- (void)loadDefaultSetting {
    B *wangcai = [B new];
    wangcai.delegate = self;
}

- (void)wangcai:(B *)wangcai didFinishWithCount:(NSUInteger)count {
    
}

@end
