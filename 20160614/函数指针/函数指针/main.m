//
//  main.m
//  函数指针
//
//  Created by qingyun on 16/6/14.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

// 函数指针的类型定义
typedef int (*funcPtrType)(int, int); // 对函数指针类型的定义同样遵循typedef的原则，除去原来定义变量的名字，剩下的整个部分就是 类型 ，所以使用typdef之后原来的变量名字选择就是一个类型名字

int* func1(int, int);  // 这是一个指针函数，表示该函数有两个整形参数，返回值是 整形指针类型
int func2(int, int); // 这是一个普通的函数，返回值是整形，有两个整形参数的 函数
int func3(int, int);

void doSome(funcPtrType);
funcPtrType tellDoWhat(void);


void tell(funcPtrType);
funcPtrType tellsome(void);



int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"func2 >>>>>>>> %p", func2);
        
        
        // 函数指针的声明
        int (*funcPtr)(int, int);  // 这就是一个函数指针，表示该指针可以指向一个 返回值是整形，有两个整形参数的 函数

        
        // 函数指针的赋值
        funcPtr = func2;
        NSLog(@"func2 >>>>>>>> %p", funcPtr);
        funcPtr = func3;
        NSLog(@"funcPtr >>>>>>>> %p", funcPtr);
        
        
        // 函数指针的调用
        NSLog(@"result >>>>> %d", (*funcPtr)(100,100));
        NSLog(@"result >>>>> %d", funcPtr(100,100));
        
        
        // 函数指针当做参数传递
        doSome(funcPtr); // 主函数 main 让 函数dosome去做指定的某一件事件
        funcPtrType funcPtr2;
        funcPtr2 = func2;
        doSome(funcPtr2);
        
        
        // 函数指针当做返回值来传递
        funcPtrType funcPtr3;
        funcPtr3 = tellDoWhat(); // 函数 tellDoWhat 告诉调用者 main 函数该做什么事情
        NSLog(@"我应该做:%p >>> %d", funcPtr3, funcPtr3(10,98));
        
        
        
        funcPtrType funcPar2;
        funcPar2 = tellsome();
        NSLog(@"告诉我该做什么:%p >>> %d",funcPar2,funcPar2(20,20));
        
    }
    return 0;
}

int func2(int a, int b)
{
    return a+b;
}

int func3(int x, int y)
{
    return x*y;
}

//void doSome(funcPtrType);
//funcPtrType tellDoWhat(void);
//
//
//void tell(funcPtrType);
//funcPtrType tellsome(void);



void doSome(funcPtrType fPtr)
//void doSome(int (*fPtr)(int, int))
{
    int a = 90;
    int b = 88;
    for (int i=0; i<10; i++){
        NSLog(@"result >>>>>> %d", fPtr(a,b));
    }
 }

funcPtrType tellDoWhat(void)
{
    NSLog(@"我告诉你做 %p", func2);
    return func2;
}
