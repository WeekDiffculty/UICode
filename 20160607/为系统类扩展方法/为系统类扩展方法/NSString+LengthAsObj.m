//
//  NSString+LengthAsObj.m
//  为系统类扩展方法
//
//  Created by qingyun on 16/6/7.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "NSString+LengthAsObj.h"

@implementation NSString (LengthAsObj)

- (NSNumber *)lenghtNumber
{
    
    NSUInteger length = self.length;
    return @(length);
}

@end
