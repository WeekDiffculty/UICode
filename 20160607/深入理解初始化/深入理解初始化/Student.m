//
//  Student.m
//  深入理解初始化
//
//  Created by qingyun on 16/6/7.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "Student.h"

@implementation Student

- (instancetype)init
{
    if (self = [super init]) {
        _school = @"青云学院";
    }
    return self;
}

- (instancetype)initWithSchool:(NSString *)school
{
    // 在子类的初始化中尽量调用父类里初始化信息最全面的那个方法作为自己的指定初始化方法，这样可以保证子类从父类或者继承链中所继承的属性在一开始都是有默认值的
    if (self = [super initWithName:@"青云-xxxxx"]) {
        _school = @"青云学院1605";
    }
    return self;
}

- (void)dealloc
{
    // dealloc 跟 alloc的过程，在手动内存里管理，一般dealloc都是先把该类对象依赖的成员变量先release掉，最后才能 [super dealloc]，这样才能使对象按照正确的顺序来依次释放内存
//    [super dealloc];
}


@end
