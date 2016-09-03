//
//  main.m
//  认识类和对象
//
//  Created by qingyun on 16/5/30.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>
// 要想使用一个类，必须先导入该类的头文件，用于识别该类
#import "Student.h"

int main(int argc, const char * argv[]) {
    
    NSLog(@"\nHello, World!");
    
    // C 的结构体，表示一个具体的事物
    struct student {
        int age;
        float height;
    } st1,st3;
    
    st1.age = 18;
    st1.height = 1.87;
    
    NSLog(@"st1 >>>> %p", &st1);
    
    // OC 中用类来描述一类物体的特征，用对象表示该类事物中的具体一个
    Student *st2 = [Student new]; // 因为对象的内存在堆上分配，所以对象可以理解成一个指针类型的变量
    NSLog(@"st2 >>> %p", st2);
    
    [st2 setAge:18];  // 给st2的成员变量  _age 赋值
    
//    int ageNum = [st2 age];
//    NSLog(@"st2‘age >>>>> %d", ageNum);
    
    [st2 study]; // [] 是OC独有的语法，表示调用方法，前半部分表示调用方法的主题，后面表示方法名字
    
    
    Student *st4 = [Student new]; // 新建一个对象
    [st4 setAge:10];
    [st4 study];
    
    
    
    return 0;
}
