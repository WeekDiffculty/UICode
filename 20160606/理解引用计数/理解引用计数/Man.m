//
//  Man.m
//  理解引用计数
//
//  Created by qingyun on 16/6/6.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "Man.h"

@implementation Man

- (void)live
{
    NSLog(@"活着真好！");
}

- (void)dealloc
{
    NSLog(@"我挂了");
    [super dealloc];
}

@end
