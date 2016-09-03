//
//  main.m
//  自动释放
//
//  Created by qingyun on 16/6/6.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Person.h"

int main(int argc, const char * argv[]) {
    
    // 1.谁创建谁销毁
    // 2.谁使用谁释放
    // 3.不是自己创建的，可以持有，但是必须在使用完之后进行释放
    // 4.不是自己创建的，不要去销毁
    
#if 1
    @autoreleasepool {
       
        Person *xiaoming = [[Person alloc] init]; //+1
        xiaoming.name = @"小明";
        [xiaoming release];//-1
        
        Person *xiaohong = [Person personWithName:@"小红"];
        
        NSArray *arr = [NSArray arrayWithObjects:@"abc",@123,@'x',nil];
        [arr retain];
        [arr release];
        
        NSArray *arr2 = [[NSArray alloc] initWithObjects:@"xx",@"yy", nil];
        [arr2 release];
        
    } // 当自动释放池销毁的时候，会自动地向池中的对象发送 一条 release，这样就就可以抵消最开始的+1
#else
    // 其实自动释放池也是一个类，所以池子开始就创建自动释放池对象
    NSAutoreleasePool *arp = [[NSAutoreleasePool alloc] init];
    
    Person *xiaohong = [Person personWithName:@"小红"];
    
    // 销毁池子就是向池子对象发送最后一次release
    [arp release];
#endif
    
    
    // ⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️
    Person *xiaogang = [[Person alloc] init];
    xiaogang.name = @"小刚";
    
    NSArray *children = @[xiaogang]; // 数组和字典、nsset 这些集合对象也会对其中的元素进行持有，在手东内容管理里需要对对象释放，或者对数组、字典、set对象本身进行释放
    [children release];
    [xiaogang release];
    
    // ⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️ 单例
    Person *xiaohe = [Person sharedPerson];
    NSLog(@"xiaohe >>>>> %p", xiaohe);
    NSLog(@"xiaohe >>>>> %p", [Person sharedPerson]);
    NSLog(@"xiaohe >>>>> %p", [Person sharedPerson]);
    
    
    NSLog(@"xiaohe >>>>> %p", [[Person alloc] init]);
    NSLog(@"xiaohe >>>>> %p", [[Person alloc] init]);
    NSLog(@"xiaohe >>>>> %p", [[Person alloc] init]);
    NSLog(@"xiaohe >>>>> %p", [[Person alloc] init]);
    NSLog(@"xiaohe >>>>> %p", [[Person alloc] init]);
    
    
    
    

    
    

    return 0;
}
