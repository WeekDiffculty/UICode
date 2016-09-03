//
//  main.m
//  正式协议
//
//  Created by qingyun on 16/6/8.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person *xiaoming = [[Person alloc] init];
        xiaoming.school = @"青云学院";
//        [xiaoming coding];
//        [xiaoming goToClassRoom];
        [xiaoming name];
        
    }
    return 0;
}
