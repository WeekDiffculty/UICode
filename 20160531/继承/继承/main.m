//
//  main.m
//  继承
//
//  Created by qingyun on 16/5/31.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Student.h"
#import "Teacher.h"
#import "Programmer.h"


int main(int argc, const char * argv[]) {
    
    Student *st = [[Student alloc] init]; // ==== new
    st.school = @"青云学院";
    
    // 当Student继承自于Person类的时候，自动拥有了Person中的属性
    st.name = @"小明";
    st.age = 5;
    st.sex = 'B';
    // eat
    [st eat];
    // eat:
    [st eat:@"🍉"];
    [st study];
    
    // Teacher也继承自于Person
    Teacher *tc = [[Teacher alloc] init];
    tc.skill = @"iOS开发";
    tc.name = @"Poppei";
    [tc eat];
    [tc teach];
    
    // Progrmmer <<< Person
    Programmer *pr = [[Programmer alloc] init];
    pr.name = @"张宏政";
    pr.salary = 10000;
    [pr eat];
    [pr coding];
    
    return 0;
}
