//
//  Person.h
//  属性的内存语意扩展
//
//  Created by qingyun on 16/6/6.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Car,Tire;

@interface Person : NSObject

// 改名
// 经常使用与一些 bool 状态的getter改名

// 属性里面的读写语意扩展可以分为两种
// readwrite 可读可写 ，默认的 √
// readonly 只读的

// 属性里面的安全性能语意扩展可以分为两种种
// nonatomic 非原子性，可以提升在多线程访问中的性能   √
// atomic   原子性，在多线程访问时会排队等待，性能较低，但是有一定的安全性

// 属性里面的内存语意扩展可以分为三种
// strong 表示将来生成成员变量是强引用 √
// weak 表示将来生成成员变量是弱引用
// assign 表示基本数据类型 int float char 结构体  >> __unsafe_unretained (标量)
// copy 一般不推荐使用，表示 将来的对象 是通过 复制 得来的
@property (nonatomic, strong) Car *car;  // >>>>>> __strong Car *_car
@property (nonatomic, weak) Tire *tire; // __weak Tire *_tire;

@property (nonatomic, getter=isHidden) BOOL hidden;


@end
