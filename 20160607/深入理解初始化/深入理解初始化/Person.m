//
//  Person.m
//  深入理解初始化
//
//  Created by qingyun on 16/6/7.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "Person.h"

#define DefaultAge 18

@implementation Person

- (instancetype)init
{
#if 0
    if (self = [super init]) { // [super init] >>>> nsobject > isa
        
    }
#endif
    self = [super init];
    if (self != nil) {
        _age = 1;
        _name = @"青云";
    }
    return self;
}

// 带参数的初始化方法，后面的参数就是创建该对象的一些 素材或者条件
- (instancetype)initWithAge:(int)age
{
    if (self = [super init]) {
        _age = age;
    }
    return self;
}

// 类似的如同initWithName: initWithHeight:这些初始化方法给创建对象提供了更多选择的便利，我们称他们为便利初始化方法
- (instancetype)initWithName:(NSString *)name
{
    // initWithName:在内部调用了initWithAge:，这时候initWithAge:就是initWithName:的指定初始化方法
    // 一般指定初始化方法里面的初始化的属性（成员变量）是该类对象的主要属性或者必须依赖的属性，尽量越多越好
    if (self = [self initWithAge:DefaultAge]) {
        _name = name;
    }
    return self;
}

- (instancetype)initWithHeight:(float)height
{
    if (self = [self initWithAge:DefaultAge]) {
        _height = height;
    }
    return self;
}


@end
