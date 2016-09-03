//
//  Student.m
//  继承
//
//  Created by qingyun on 16/5/31.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "Student.h"

@implementation Student

// 这个eat是从父类继承过来的，这样的写法会将父类中的逻辑完全覆盖，这是 方法重写 （override），子类的实现有最高优先级顺序
- (void)eat
{
    NSLog(@"美酒+美人");
}

- (void)eat:(NSString *)food
{
    NSLog(@"吃了%@", food);
}

- (void)study
{
    NSLog(@"xuexi....");
}

@end
