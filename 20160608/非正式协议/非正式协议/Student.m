//
//  Student.m
//  非正式协议
//
//  Created by qingyun on 16/6/8.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "Student.h"

#import "Teacher.h"
#import "NSObject+WakeUp.h"// 非正式协议可以约束delegate做叫醒的事情

@implementation Student

#if 0
- (void)sleep
{
    NSLog(@"我要睡了，6小时之后叫醒我");
    
    Teacher *poppei = [[Teacher alloc] init];
    poppei.name = @"佩佩老师";
    
    // 6小时之后老师要叫醒学生
    [NSTimer scheduledTimerWithTimeInterval:6 target:poppei selector:@selector(wakeUp:) userInfo:self.name repeats:NO];
}

- (void)tellSleeping:(id)obj
{
    NSLog(@"我要睡了，6小时之后叫醒我");
    
    // 6小时之后老师要叫醒学生
    //    respondsToSelector:用来判断某一个对象是否响应或者能调用指定的方法
    // SEL是响应选择器（方法作为参数）的类型
    SEL method = @selector(wakeUp:);
    if ([obj respondsToSelector:method]) {
        [NSTimer scheduledTimerWithTimeInterval:6 target:obj selector:method userInfo:self.name repeats:NO];
    }
}

#endif

- (void)sleep
{
    NSLog(@"我要睡了，6小时之后叫醒我");
    
    // 6小时之后要叫醒学生
    //    respondsToSelector:用来判断某一个对象是否响应或者能调用指定的方法
    // SEL是响应选择器（方法作为参数）的类型
    SEL method = @selector(wakeUp:);
    if ([self.delegate respondsToSelector:method]) {
        [NSTimer scheduledTimerWithTimeInterval:6 target:self.delegate selector:method userInfo:self.name repeats:NO];
    }
}

@end
