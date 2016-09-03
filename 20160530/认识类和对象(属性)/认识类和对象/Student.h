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
    int _age;  //  在类中用 成员变量 描述事物 静态特征 , 成员变量的名字前面要加上 _用来区分参数名字，这是一个很好的习惯，也是系统推荐的做法
    float _height;
}

//@property 用来表示属性的关键字
// 属性其实是编译器在编译阶段帮我们自动生成的setter 和 getter，默认逻辑跟最简单的setter getter的落实是一样的
@property (nonatomic) long sid; // 这表示一个属性，跟成员变量的作用一样，用来表示事物的静态特征

// 方法返回值类型 方法名字:(参数类型)参数名字 .....
- (void)setAge:(int)age; // setter
- (int)age; // getter

// 类可以描述事物的 动态行为（可以做什么事情）
- (void)study;  // 类似于 函数， 标注叫法 方法（method）

@end
