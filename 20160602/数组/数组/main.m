//
//  main.m
//  数组
//
//  Created by qingyun on 16/6/2.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Person.h"

int main(int argc, const char * argv[]) {
    
    // 创建数组
    Person *dongdong = [Person new];
    // OC 的数组是对象，那么它里面的元素必须都是对象, 不能存空对象（nil）
    NSArray *arr = @[@"张恒", @"闫鹏举", @"🐂道长", @"王萌红", dongdong, [NSObject new]]; //2.0
    NSArray *arr1 = [NSArray arrayWithObjects:@"张恒", @"闫鹏举", @"🐂道长", @"王萌红", nil]; // 1.0
    
    // 访问数组
    NSLog(@"arr1[0] >>>>>>> %@ %ld", arr[0], arr.count);
    
    // 遍历
    for (int i=0; i<arr.count; i++) {
         NSLog(@"arr1[0] >>>>>>> %@ %ld", arr[i], arr.count);
    }
    
    // 快速枚举
    // for (元素的公共类型 *临时变量 in 需要遍历的数组){}
    for (NSObject *obj in arr) {
        NSLog(@"obj >>>>> %@", obj);
    }
    
    // 枚举器
//    NSEnumerator
    
    // 
//    [arr containsObject:<#(nonnull id)#>]
    // 查找
//    [arr indexOfObject:<#(nonnull id)#>
    
    // 连接
//    arr arrayByAddingObjectsFromArray:<#(nonnull NSArray *)#>
    
    // 分割字符串
    NSString *str = @"杨栋, 杨小龙, 段鹏, 冯毅良";
    NSArray *names = [str componentsSeparatedByString:@", "];
    NSLog(@"names >>>>> %@", names);
    NSString *str1 = [names componentsJoinedByString:@"👐"];
    NSLog(@"names >>>>> %@", str1);
    
    // NSMutableArray
    // 增删改插
    
    
    return 0;
}
