//
//  QYWangCai.m
//  Demo02_传值
//
//  Created by qingyun on 16/7/1.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "B.h"

@implementation B


- (void)wang {
    NSUInteger count = arc4random_uniform(100) + 5;
    
    for (NSUInteger index = 0; index < count; index ++) {
        NSLog(@"汪汪汪\n");
    }
    
    if (self.blkDidWang) {
        self.blkDidWang(count);
    }
    
    
    
    if ([self.delegate respondsToSelector:@selector(wangcai:didFinishWithCount:)]) {
        [self.delegate wangcai:self didFinishWithCount:count];
    }
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"QWERTYUIOP" object:self userInfo:@{@"count": @(count)}];
}

@end
