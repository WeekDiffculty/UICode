//
//  main.m
//  常用结构体
//
//  Created by qingyun on 16/6/2.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    
    //NSRect;
//    CGRect; // 矩形区域
//    CGPoint; // 点
//    CGSize; // 尺寸
    
    CGRect frame = CGRectMake(10, 10, 100, 100);
    CGRect bounds = (CGRect){10, 10, 100, 100};
    CGRect frame1;
    frame.origin = CGPointMake(10, 10);
    frame.size = CGSizeMake(100, 100);
    
    
    // 范围
    NSRange;
//    NSMakeRange(<#NSUInteger loc#>, <#NSUInteger len#>)
    
    return 0;
}
