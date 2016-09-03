//
//  main.m
//  Block语法
//
//  Created by qingyun on 16/6/14.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        int (*fp)(int, int);
        
        // 定义block的类型
        typedef int (^blockType)(int, int);
        
        // ^ : 脱字符
        // block的定义
        //int (^block)(int, int) = ^int(int a, int b){
        blockType block = ^int(int a, int b){
            return a*b;
        };
        
        // block的调用：直接调用
        NSLog(@"result >>>> %d", block(100,200));
        
        
        // 1. 如果没有返回值
        typedef void (^bType1)(int, int);
        bType1 block1 = ^(int a, int b){
            
        };
        // 2. 如果没有返回值，也没有参数
        typedef void (^bType2)(void);
        bType2 block2 = ^{
            NSLog(@"我就是block，你信不信");
            NSLog(@"我就是block，你信不信");
            NSLog(@"我就是block，你信不信");
            NSLog(@"我就是block，你信不信");
        };
        // 3. 如果代码块内部的返回值类型跟类型中定义好的返回值类型一致时，就可以在代码块实现的中省略返回值类型
        typedef int (^bType3)(int, int);
        bType3 block3 = ^(int a, int b){//bType3 block3 = ^int(int a, int b){
            if (YES) {
                return a+b;
            } else {
                return 2;
            }
        };
        
        // block的调用：内联用法（实际就是把block当做参数来传递使用）
        NSArray *arr = @[@"陈文",@"陈宏利",@"赵晓建",@"刘欢",@"张奥"];
        
//        NSComparisonResult (^sortBlock)(NSString *, NSString *) = ^(NSString *obj1, NSString * obj2) {
//            return [obj2 compare:obj1];
//        };
        NSArray *sortedArr = [arr sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
            return [obj2 compare:obj1];
        }];
        
    
        
        
        
        NSLog(@"%@", sortedArr);
        
        
    }
    return 0;
}
