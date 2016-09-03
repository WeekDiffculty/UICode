//
//  Person.m
//  属性
//
//  Created by qingyun on 16/6/7.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "Person.h"

@implementation Person

//@synthesize name = _name;

//- (void)setName:(NSString *)name
//{
//    _name = name;
//}

- (NSString *)name
{
    return _name;
}

// 下面对象的getter方法是一种懒加载，就是在getter的过程中将对象创建
- (NSMutableArray *)friends
{
    if (_friends == nil) {
        _friends = [NSMutableArray array];
    }
    return _friends;
}

@end
