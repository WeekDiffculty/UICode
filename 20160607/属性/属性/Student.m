//
//  Student.m
//  属性
//
//  Created by qingyun on 16/6/7.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "Student.h"

@implementation Student

// 如果在子类中非得使用父类属性直接生成的成员变量时，就需要 @synthesize
@synthesize name = _name;

- (NSString *)description
{
    return [NSString stringWithFormat:@"我叫%@，我来在%@", _name, _school];
}

@end
