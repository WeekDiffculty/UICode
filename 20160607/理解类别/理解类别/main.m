//
//  main.m
//  理解类别
//
//  Created by qingyun on 16/6/7.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Person.h"
//#import "Person+Study.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Person *xiaoming = [[Person alloc] init];
        xiaoming.name = @"小明";
        
        [xiaoming studyPorgramming];
        [xiaoming studyEnglish];
        
        
        [xiaoming shopping];
        
    }
    return 0;
}
