//
//  main.m
//  使用类别拆分类的声明
//
//  Created by qingyun on 16/6/7.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Person.h"
#import "Person+PrivateDeclare.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Person *xiaoming = [[Person alloc] init];
        
        [xiaoming study];
        // play
        [xiaoming work];
        
        [xiaoming play];
        
    }
    return 0;
}
