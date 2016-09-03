//
//  NSObject+WakeUp.m
//  非正式协议
//
//  Created by qingyun on 16/6/8.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "NSObject+WakeUp.h"

@implementation NSObject (WakeUp)

- (void)wakeUp:(NSTimer *)timer
{
    NSLog(@"%@:%@,该醒了，再不醒可以 滚出去了！", [self class], timer.userInfo);
}

@end
