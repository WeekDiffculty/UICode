//
//  Student.h
//  认识类和对象
//
//  Created by qingyun on 16/5/30.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Student : NSObject

{
    int _age;  //  在类中用 成员变量 描述事物 静态特征
    float _height;
}

// 方法返回值类型 方法名字:(参数类型)参数名字 .....
- (void)setAge:(int)age; // setter
- (int)age; // getter

// 类可以描述事物的 动态行为（可以做什么事情）
- (void)study;  // 类似于 函数， 标注叫法 方法（method）

@end
