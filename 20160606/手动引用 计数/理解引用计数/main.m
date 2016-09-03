//
//  main.m
//  理解引用计数
//
//  Created by qingyun on 16/6/6.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Man.h"
#import "Woman.h"

int main(int argc, const char * argv[]) {
    
    Man *jack = [[Man alloc] init]; // 对象诞生以为着有一个指针可以访问到对象内存空间（堆上） +1
    jack.name = @"杰克·穷死";
    
    Woman *rose = [[Woman alloc] init]; // +1
    rose.name = @"柔丝";
    NSLog(@"count >>>> %lu", [rose retainCount]);
    
    [jack setGirl:rose]; // retain
    NSLog(@"count >>>> %lu", [rose retainCount]);
    
    [rose release]; // -1
    NSLog(@"count >>>> %lu", [rose retainCount]);
    
    [jack live];
    
    // 第三者出现了
    Woman *lily = [[Woman alloc] init];
    lily.name = @"莉莉";
    
    [jack setGirl:lily];

    [jack release];
    [lily release];
    
    
    
    
    return 0;
}
