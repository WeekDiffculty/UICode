//
//  Student.m
//  初始化
//
//  Created by qingyun on 16/5/30.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "Student.h"

@implementation Student

- (Student *)init
{
//    Student *st = [Student new];
    if (self = [super init]) {
        self.age = 1;
        self.height = 80;
        self.sid = 1000000001;
        self.sex = 'B';
    }
    return self;
}

- (Student *)initWithAge:(int)age andSid:(long)sid
{
    if (self = [super init]) {
        self.age = age;
        self.sid = sid;
    }
    return self;
}

- (void)study
{
    NSLog(@"学习...");
}

- (void)play
{
    NSLog(@"LOL...");
}

- (void)sleep
{
    NSLog(@"😪");
}

+ (void)introduce
{
    NSLog(@"我们是人类");
}

@end
