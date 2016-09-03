//
//  NSArray+PrettyPrint.m
//  为系统类扩展方法
//
//  Created by qingyun on 16/6/7.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "NSArray+PrettyPrint.h"

@implementation NSArray (PrettyPrint)

- (void)prettyPrint
{
    NSMutableString *desc = [NSMutableString stringWithString:@"\n>>>> [\n"];
    for (NSObject *obj in self) {
        [desc appendFormat:@">>>>\t%@,\n",obj];
    }
    [desc appendString:@">>>> ]"];
    NSLog(@"%@", desc);
}


@end
