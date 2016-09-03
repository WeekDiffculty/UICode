//
//  main.m
//  内存理解
//
//  Created by qingyun on 16/6/6.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Teacher.h"

int main(int argc, const char * argv[]) {
    
    int arr[10] = {1,2,3,4,412,6,89};
    NSLog(@"arr[5] >>>>>> %d", *(arr+5));
    
    typedef struct {
        int age;
        float height;
    } Student;
    
    Student st1;
    st1.age = 20;
    st1.height = 1.78;
    
    Student *stp = &st1;
    NSLog(@"age >>>> %d", stp->age);
    NSLog(@"height >>>> %.2f ", stp->height);
    
    // 对象类型的指针
    Teacher *tc = [[Teacher alloc] init];
    tc->_salary = 10000;
    tc.EX = 10;
    NSLog(@"salary >>>> %d", tc->_salary);
    NSLog(@"ex >>>> %d", tc->_EX);
    
    return 0;
}
