//
//  main.m
//  非正式协议
//
//  Created by qingyun on 16/6/8.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Student.h"
#import "Teacher.h"
#import "Person.h"
#import "Clock.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Student *xiaoming = [[Student alloc] init];
        xiaoming.name = @"小明";
        
#if 0
        [xiaoming sleep];
     
        Teacher *xingjie = [[Teacher alloc] init];
        [xiaoming tellSleeping:xingjie];
        
        //        Person *xiaohong = [[Person alloc] init];
        //        [xiaoming tellSleeping:xiaohong];
#endif

        Clock *clock = [[Clock alloc] init];
        xiaoming.delegate = clock;
        
        [xiaoming sleep];
        
        
        [[NSRunLoop mainRunLoop] run]; //启用运行循环来使计时器生效
    }
    return 0;
}
