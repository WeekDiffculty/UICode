//
//  Student.m
//  认识类和对象
//
//  Created by qingyun on 16/5/30.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "Student.h"

@implementation Student

- (void)setAge:(int)age
{
    _age = age;
}

- (int)age
{
    return _age;
}

- (void)study
{
    if (_age >= 18) {
        NSLog(@"一个年龄为 %d 的学生正在学习iOS编程-OC语法", _age);
    } else {
        NSLog(@"太幼稚了，回去玩泥巴吧...");
    }
}

@end
