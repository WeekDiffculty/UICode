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
    
    Person *p = [[Person alloc] init];
    [p work];
    
    // 当Student继承自于Person类的时候，自动拥有了Person中的属性
    st.name = @"小明";
    st.age = 5;
    st.sex = 'B';
    NSLog(@"st >>>> %p", st);
    [st study];
    
    
    
    return 0;
}
