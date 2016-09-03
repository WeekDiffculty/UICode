//
//  Pig.m
//  ARC规则
//
//  Created by qingyun on 16/6/6.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "Pig.h"

@implementation Pig

+ (instancetype)defaultPig
{
    // __autoreleasing在规则中可以指直接由编译器来判断，所以不用写
    __autoreleasing Pig *p = [Pig new];
    
    return p;
}

// ARC环境，retain release autorelease dealloc retaincount
- (void)dealloc
{
    NSLog(@"%@ 挂掉了", _name);
}

- (void)laugh
{
    NSLog(@"😄😄😄😄😄😄😄😄");
}


@end
