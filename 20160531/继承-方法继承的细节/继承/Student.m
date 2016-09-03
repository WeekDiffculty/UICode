//
//  Student.m
//  继承
//
//  Created by qingyun on 16/5/31.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "Student.h"

@implementation Student

// 1.这个eat是从父类继承过来的，这样的写法会将父类中的逻辑完全覆盖，这是 方法重写 （override），子类的实现有最高优先级顺序，这个过程称为方法调度
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
    // 2.在类的内部，调用自身的方法需要使用关键字 self
    [self eat:@"肉"];
    NSLog(@"self >>>> %p", self); // 可以看到self 就是这个方法的调用者本身，其实对象在调用方法时，默认会把自己的内存地址传进来，用self来表示
    NSLog(@"xuexi....");
    
    [self work]; // 如果子类没有实现该方法，可以直接使用self来调用父类的方法，这时候不需要使用super
}

- (void)takeMoney
{
    // 3.如果子类想调用父类的方法时，需要用 super 关键字，表示明确执行父类方法中的逻辑
    [super takeMoney];
    NSLog(@"赚了1000");
}

- (void)play
{
    NSLog(@"LOL....");
}

@end
