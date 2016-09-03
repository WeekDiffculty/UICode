//
//  Student.m
//  认识类和对象
//
//  Created by qingyun on 16/5/30.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "Student.h"

@implementation Student

// 这是最基本的setter getter的实现，默认属性生成的setter getter跟他们是一样的
- (void)setAge:(int)age
{
    _age = age;
}

- (int)age
{
    return _age;
}

- (long)sid
{
    //NSLog(@"这是我们自己写的getter");
    return _sid;
}

- (void)study
{
    if (_age >= 18) {
        NSLog(@"一个年龄为 %d 的学生正在学习iOS编程-OC语法", _age);
    } else {
        NSLog(@"太幼稚了，回去玩泥巴吧...");
    }
}

- (Student *)initWithAge:(int)age
{
    if (self = [super init]) {
        _age = age;
    }
    return self;
}

+ (Student *)studentWithSid:(long)sid
{
#if 0
    Student *st = [Student new];
    st.sid = sid;
#endif
    Student *st = [[Student alloc] initWithAge:1];
    st.sid  = sid;
    
    return st;
}

@end
