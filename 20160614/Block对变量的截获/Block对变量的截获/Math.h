//
//  Person.h
//  Block对变量的截获
//
//  Created by qingyun on 16/6/14.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef int (^blockType)(int, int);

@interface Math : NSObject

@property (nonatomic) int firstNum;
@property (nonatomic) int secondNum;
@property (nonatomic, copy) blockType block; // 当block作为属性时，建议使用copy把block拷贝到堆内存上，这样能避免block的无故释放

- (instancetype)initWithBlock:(blockType)block;

- (void)caculator;

- (void)minus;

@end
