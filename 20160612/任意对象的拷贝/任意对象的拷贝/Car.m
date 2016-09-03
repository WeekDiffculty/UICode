//
//  Car.m
//  任意对象的拷贝
//
//  Created by qingyun on 16/6/12.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "Car.h"

#import "Engine.h"

@implementation Car

- (instancetype)copyWithZone:(NSZone *)zone
{
//    Car *smartCopy = [[Car alloc] init];
    
    //  1.在copy时要使用allocWithZone:来去使用系统传入的zone内存，这样会保证在copy时效率最高，也能保证系统对内存的使用最合理
    Car *smartCopy = [[[self class] allocWithZone:zone] init]; // 3.在继承的时候这里不能直接写成固定的类的名字，应该写成 [self class]，来自动判断应该是按照哪个类来分配内存
    smartCopy.brand = self.brand; // 系统对象的拷贝
    smartCopy.price = self.price; // 基本数据类型（数值）的拷贝
    smartCopy.engine = [self.engine copy]; // 2.对自定义对象进行copy的时候，对其拥有的复合对象也需要调用copy方法
    return smartCopy;
}

// 虽然常规自定义对象的mutableCopy没有直接意义，但是需要实现mutablecopy的话，尽量在mutableCopyWithZone：里对所有拥有对象进行 mutableCopy 调用
//- (instancetype)mutableCopyWithZone:(NSZone *)zone
//{
//    Car *smartCopy = [[[self class] allocWithZone:zone] init]; // 3.在继承的时候这里不能直接写成固定的类的名字，应该写成 [self class]，来自动判断应该是按照哪个类来分配内存
//    smartCopy.brand = self.brand; // 系统对象的拷贝
//    smartCopy.price = self.price; // 基本数据类型（数值）的拷贝
//    smartCopy.engine = [self.engine mutableCopy]; // 2.对自定义对象进行copy的时候，对其拥有的复合对象也需要调用copy方法
//    return smartCopy;
//
//}

@end
