//
//  main.m
//  初始化
//
//  Created by qingyun on 16/5/30.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Student.h"

int main(int argc, const char * argv[]) {
    
    // new ====== alloc + init
    // 使用默认的初始化方法来创建对象，所有对象虽然不是空白，但是是一样的

//    Student *st = [[Student alloc] init];
//    NSLog(@"年纪:%d\t身高:%.2f\t学号:%ld\t性别:%c", st.age, st.height, st.sid, st.sex);
//    
//    Student *st1 = [[Student alloc] init];
//    NSLog(@"年纪:%d\t身高:%.2f\t学号:%ld\t性别:%c", st1.age, st1.height, st1.sid, st1.sex);


    // 要想创建不一样的新对象，可以选择不同条件的 初始化 来做到
    // alloc 是用来分配内存空间的，获得对象的内存空间之后要立刻进行时init（初始化），当然init是可以选择不同条件的
    Student *st2 = [[Student alloc] initWithAge:20 andSid:100001];
    Student *st3 = [[Student alloc] initWithAge:18 andSid:100002];
    NSLog(@"年纪:%d\t身高:%.2f\t学号:%ld\t性别:%c", st2.age, st2.height, st2.sid, st2.sex);
    NSLog(@"年纪:%d\t身高:%.2f\t学号:%ld\t性别:%c", st3.age, st3.height, st3.sid, st3.sex);
    
    // 每一层中括号都代表着一个方法的调用，里层的返回值继续调用外层的方法，所以必须保证里层的方法都必须有返回值，而且这个返回值能调用外层方法
    //[[[st3 study] play] sleep];
    [st3 study];
    
    [Student introduce];
    
    return 0;
}
