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
        NSLog(@"笑笑笑...\n");
    }
    
    [self.delegate 笑了];
}

@end
