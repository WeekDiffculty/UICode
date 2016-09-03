//
//  Person.m
//  继承
//
//  Created by qingyun on 16/5/31.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "Person.h"

@implementation Person

- (void)eat
{
    NSLog(@"见到什么吃什么");
}

- (void)takeMoney
{
    NSLog(@"赚到1000W");
}

- (void)work
{
    NSLog(@"努力赚钱 养家糊口");
    [self play];
}

- (void)play
{
    NSLog(@"打牌....");
}

@end
