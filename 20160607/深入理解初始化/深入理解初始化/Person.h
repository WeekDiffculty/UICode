//
//  Person.h
//  深入理解初始化
//
//  Created by qingyun on 16/6/7.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic) int age;
@property (nonatomic) float height;

- (instancetype)initWithAge:(int)age;
- (instancetype)initWithName:(NSString *)name;
- (instancetype)initWithHeight:(float)height;


@end
