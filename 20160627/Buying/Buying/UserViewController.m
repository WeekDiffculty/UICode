//
//  User.m
//  Buying
//
//  Created by qingyun on 16/6/27.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "UserViewController.h"

@implementation UserViewController

- (IBAction)buyingSmokeAction {
    Smoke *s = [self getSmoke];
    if ([self.delegate respondsToSelector:@selector(user:didCompleteBuyingSmoke:)]) {
        [self.delegate user:self didCompleteBuyingSmoke:s];
    }
}

- (Smoke *)getSmoke {
    // 坐飞机, 轮船, 游泳, 到达一个可以买烟的地方
    Smoke *s = [[Smoke alloc] init];
    s.strBrand = self.strBrand;
    return s;
}

@end
