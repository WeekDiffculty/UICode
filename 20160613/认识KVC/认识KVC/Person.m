//
//  Person.m
//  认识KVC
//
//  Created by qingyun on 16/6/13.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "Person.h"

@interface Person ()

@property (nonatomic) NSInteger money;

@end

@implementation Person

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    NSLog(@"不是%@!", key);
    if ([key isEqualToString:@"nickName"] || [key isEqualToString:@"userName"]) {
        [self setValue:value forKey:@"name"];
    }
}

- (void)setNilValueForKey:(NSString *)key
{
    NSLog(@"是0呢还是nil对象呢？");
    [self setValue:@0 forKey:key];
}

@end
