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

    Student *st = [Student new];
    
    // 使用点语法来访问属性，本质上是对set、get方法的简介访问
    st.sid = 201610015;
    NSLog(@"st'sid >>>>>> %ld", st.sid);
    
    // 使用直接的setter和getter
    [st setSid:2017100015];
    NSLog(@"st'sid >>>>>> %ld", [st sid]);
    
    
    
    
    return 0;
}
