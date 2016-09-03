//
//  Person.m
//  使用类别拆分类的声明
//
//  Created by qingyun on 16/6/7.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "Person.h"

@implementation Person

- (void)study
{
    NSLog(@"good good study");
    [self play];
}

- (void)play
{
    NSLog(@"happy happy play");
}

- (void)work
{
    NSLog(@"hard hard work");
}

@end
