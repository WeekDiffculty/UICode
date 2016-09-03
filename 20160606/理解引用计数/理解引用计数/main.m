//
//  main.m
//  理解引用计数
//
//  Created by qingyun on 16/6/6.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Man.h"

int main(int argc, const char * argv[]) {
    
    Man *man = [[Man alloc] init]; // 对象诞生以为着有一个指针可以访问到对象内存空间（堆上） +1
    NSLog(@"count >>>> %lu", [man retainCount]);
    
    [man retain]; // +1
    NSLog(@"count >>>> %lu", [man retainCount]);
    
    [man release]; // -1
    NSLog(@"count >>>> %lu", [man retainCount]);
    
    [man release]; // >>> 0 最后一次release会抵消最开始的alloc的+1，那么对象即将进入销毁状态 >>> dealloc
    man = nil; // dealloc 实际上只是对该对象的内存空间打上一个标记，标识该内存空间可以重新被分配给别的对象使用，所以对象在dealloc之后需要被置成 nil 表示彻底不用了
    
    for (int i=0; i<100; i++) {
        NSLog(@"i >>>>>> %d", i);
        [man live];
    }
    
    
    
    
    
    return 0;
}
