//
//  main.m
//  Block对变量的截获
//
//  Created by qingyun on 16/6/14.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Math.h"

int global = 999;

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // 1. 普通的局部变量
        int a = 100;
        
        void (^block)(int) = ^(int num) {
            // 普通局部变量在传入block内部时，是当做常量来对待的，所以其值不能被改变
            //a = 300; // ???????
            num += a; // 但是这些局部变量可以参与运算
            NSLog(@"a >>>>> %d", a);
            NSLog(@"num >>>>> %d", num);
        };
        
        a = 200; // ????????
        
        // block在定义时已经决定了当时的局部变量应该是什么样的值，不取决与调用的时机
        block(888);
        
        // 2. __block
        __block int b = 100;
        
        void (^block1)(int) = ^(int num) {
            // 普通局部变量在传入block内部时，是当做常量来对待的，所以其值不能被改变
            //b = 300; // ???????
            num += b; // 但是这些局部变量可以参与运算
            NSLog(@"b >>>>> %d", b);
            NSLog(@"num >>>>> %d", num);
        };
        b = 200;
        block1(888);
        
        // 普通局部变量在block中不能被更改值的意义在于 回调 的使用方式，回调就意味着需要调用定义当时的状况
        
        // 3.静态变量和全局变量
        void (^block2)(int) = ^(int num) {
            //global = 1000;
            num += global;
            NSLog(@"global >>>>> %d", global);
            NSLog(@"num >>>>> %d", num);
        };
        
        global = 300;
        block2(200);
        
        // 4.指针类型的变量
        NSMutableArray *students = [NSMutableArray arrayWithArray:@[@"张宝丰",@"李裕韧",@"买帅"]];
        
        void (^block3)(void) = ^{
            [students addObject:@"王伟亮"];
            NSLog(@"students >>>> %@", students);
            
        };
        
        block3();
        
        // 5.成员变量
        Math *math = [[Math alloc] initWithBlock:^int(int a, int b) {
            a += 100;
            b += 100;
            
            return a+b;
        }];
        
        NSLog(@"result >>>>> %d", math.block(200, 300));
        
        math.firstNum = 50;
        math.secondNum = 80;
        [math minus];
        [math caculator];
        
        
        {
            Math *mt = [[Math alloc] init];
            [mt minus];
            mt.block(500,300);
        }
        
        
        
    }
    return 0;
}
