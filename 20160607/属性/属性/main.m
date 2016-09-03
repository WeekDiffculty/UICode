//
//  main.m
//  属性
//
//  Created by qingyun on 16/6/7.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Person.h"
#import "Student.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {

        Person *xiaohong = [[Person alloc] init];
        Person *xiaohuang = [[Person alloc] init];
    
        Person *xiaohua = [[Person alloc] init];
        [xiaohua.friends addObject:xiaohong];
        [xiaohua.friends addObject:xiaohuang];
        
        NSLog(@"friends >>>>>> %@", xiaohua.friends);
        
        
    }
    return 0;
}
