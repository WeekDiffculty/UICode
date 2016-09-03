//
//  main.m
//  printDA
//
//  Created by Selena on 16/6/2.
//  Copyright © 2016年 河南青云信息技术有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ListPrinter.h"


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        
        
        NSArray *arr = @[@"二蛋",@"张三",@"李四",@"旺旺"];
        NSDictionary *dict = @{@"姓名":@"李四",@"年龄":@"五岁",@"性别":@"男"};
        
        
        [ListPrinter printArray:arr];
        [ListPrinter printDictionary:dict];
        
        NSArray *arr1 = @[@"二蛋",@"李四",@[@"张三",@"逍遥"],@"吃饭"];

        [ListPrinter printArray:arr1];
        
//        ListPrinter  *print = [[ListPrinter alloc]init];
//        
//        [print printArray:arr];
//        [print printDictionary:dict];
        
    }
    return 0;
}
