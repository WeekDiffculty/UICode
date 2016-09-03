//
//  Person.h
//  继承
//
//  Created by qingyun on 16/5/31.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property (nonatomic) NSInteger age; // NSInteger 是对Cocoa int的额外定义，可以根据不同的编译条件代表 int 或者 long，对应的还有无符号的 NSUInteger
@property (nonatomic, strong) NSString *name; // 如果是对象作为类的属性时，需要在括号内加上一个strong
@property (nonatomic) char sex;

- (void)eat;

- (void)takeMoney;

- (void)work;

- (void)play;

@end
