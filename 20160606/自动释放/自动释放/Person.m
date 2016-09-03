//
//  Person.m
//  自动释放
//
//  Created by qingyun on 16/6/6.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "Person.h"

@implementation Person

+ (instancetype)personWithName:(NSString *)name
{
    Person *p = [[Person alloc] init];
    p.name = name;
    //使用对象。。。。。
    //使用对象。。。。。
    //使用对象。。。。。
    //使用对象。。。。。
    //使用对象。。。。。
    //[p autorelease]; // autorelease 向自动释放池添加需要被自动释放的对象
    
    // 自动释放需要注意的特点：
    // 1.一般情况autorelease只会在类方法创建对象时使用
    // 2.发送过一次autorelease消息的对象在自动释放池结束的时候只会发送一条release
    return [p autorelease];
}

+ (instancetype)sharedPerson
{
    static Person *p;
    if (p == nil) {
        p = [[Person alloc] init];
    }
    return p;
}

- (void)dealloc
{
    NSLog(@"%@ 挂了", _name);
    [super dealloc];
}

@end
