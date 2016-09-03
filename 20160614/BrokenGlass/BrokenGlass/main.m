//
//  main.m
//  BrokenGlass
//
//  Created by qingyun on 16/6/14.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Student.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Student *xiaoming = [[Student alloc] init];
        xiaoming.name = @"小明";
        NSLog(@"%p", xiaoming);
        
        void (^brokenGlass)(void) = ^{
        
            //xiaoming = [[Student alloc] init];
            
            xiaoming.name = @"小小明";
            NSLog(@"%p", xiaoming);
            NSLog(@"%@ 打碎了玻璃", xiaoming.name);
            
        };
        
        
        //.....
        //.....
        //.....
        
        xiaoming = [[Student alloc] init];
        xiaoming.name = @"小刚";
        
        //.....
        //.....
        //.....
        
        brokenGlass();
        
        
        
        
        
        
        
    }
    return 0;
}
