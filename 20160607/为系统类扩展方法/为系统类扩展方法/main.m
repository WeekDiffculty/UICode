//
//  main.m
//  为系统类扩展方法
//
//  Created by qingyun on 16/6/7.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Person.h"

#import "NSString+LengthAsObj.h"
#import "NSArray+PrettyPrint.h"


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        

        
        NSArray *lengthArr = @[[str lenghtNumber], [str3 lenghtNumber], [str2 lenghtNumber]];
        NSLog(@"lengths >>> %@", lengthArr);
        
        // 如果需要为系统类或者一些无法获取源码的类添加新方法的话就可以使用类别
        NSArray *arr = @[@"罗宁",@"王勇",[NSObject new],[Person new],@"AVC",@1,@'x'];
        [arr prettyPrint];
        
        
    }
    return 0;
}
