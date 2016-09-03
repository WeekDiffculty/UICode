//
//  main.m
//  ARC规则
//
//  Created by qingyun on 16/6/6.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Pig.h"

int main(int argc, const char * argv[]) {
    
    // 所有的对象指针默认都是强引用（__strong修饰符）,所以__strong不用写
    //__strong Pig *pig0;
    @autoreleasepool {
        // 1.局部变量在出代码块之前，编译器会自动在大括号前插入对应的release消息
        Pig *pig = [[Pig alloc] init];  //1
        pig.name = @"🐜1";
        //pig0 = pig;
    }
    
    //2.对象的赋值其实就是在传递 指针（对象的地址），当把指针指向别的对象，就会造成对原有对象持有关系的释放
    Pig *p2 = [[Pig alloc] init];
    p2.name = @"🐜2";
    Pig *p3 = p2;
    Pig *p4 = p3;
    p3 = [[Pig alloc] init];;
    p3.name = @"🐜3";
    p4 = p3;
    p2 = p3;
    
    //3.循环引用和自我引用
    {
        Pig *p5 = [[Pig alloc] init];
        p5.name = @"🐜4";
        
        Pig *p6 = [[Pig alloc] init];
        p6.name = @"🐜6";
        
        p5.friend = p6;
        p6.friend = p5;
        
        
        Pig *p7 = [[Pig alloc] init];
        p7.name = @"🐜7";
        p7.friend = p7;
        //[p5 release];
        //[p6 release];
//        [p7 release];
    }
    
    
    /*-----------------------weak------------------------------*/
    //__weak 表示弱引用对象指针的修饰，如果一个对象没有任何的强引用，有多少弱引用都不会阻止对象的销毁
    __weak Pig *p8;
    {
        Pig *p9 = [[Pig alloc] init];
        p9.name = @"🐜8戒";
        
        p8 = p9;
        
        [p8 laugh];
    }
//    p8 = nil; 弱引用归零在所有强引用失效之后，弱引用会自动地被置为 0
    NSLog(@"p8 >>>> %p", p8);
    for (int i=0; i<100; i++) {
        NSLog(@"%d", i);
        [p8 laugh];
    }
    
//    __unsafe_unretained 不安全的弱引用，就是在对象呗释放之后地址不归零
//    __autoreleasing     自动释放修饰符（不用写）

    NSLog(@"好可怜的🐜啊！");
    
//    [p3 release];
    return 0;
}
